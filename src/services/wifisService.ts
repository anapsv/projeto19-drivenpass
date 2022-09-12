import * as wifisRepository from '../repositories/wifisRepository.js';
import { verifyUser } from './accessService.js';
import Cryptr from 'cryptr';

export async function createWifi(wifiData: wifisRepository.TypeNewWifi) {

    const { userId, title, password } = wifiData;

    await verifyUser(userId);

    await verifyTitle(userId, title);

    const wifi = { ...wifiData, password: encryptPassword(password) };

    await wifisRepository.insert(wifi);

    return "Wifi successfully registered";
}

async function verifyTitle(userId: number, title: string) {

    const result = await wifisRepository.findByTitleAndUserId(userId, title);

    if (result) throw { type: "conflict_error", message: "A wifi with this title is already registered" };
}

function encryptPassword(password: string) {

    const cryptr = new Cryptr(process.env.CRYPTR_SECRET || "");

    const encryptedPassword = cryptr.encrypt(password);

    return encryptedPassword;
}

function decryptPassword(password: string) {

    const cryptr = new Cryptr(process.env.CRYPTR_SECRET || "");

    const decryptedPassword = cryptr.decrypt(password);

    return decryptedPassword;
}

export async function getUserWifis(userId: number) {

    await verifyUser(userId);

    const wifis = await wifisRepository.getUserWifis(userId);

    wifis.map(wifi => wifi.password = decryptPassword(wifi.password));

    return wifis;
}


async function verifyWifiAndUserId(userId: number, wifiId: number) {

    const wifi = await wifisRepository.getById(wifiId);

    if (!wifi) throw { type: "notfound_error", message: "Wifi not found" };

    if (wifi.userId !== userId) throw { type: "unauthorized_error", message: "Wifi doesn't belong to user" };

    return wifi;
}

export async function getWifiById(userId: number, wifiId: number) {

    await verifyUser(userId);

    const wifi = await verifyWifiAndUserId(userId, wifiId);

    return { ...wifi, password: decryptPassword(wifi.password) };
}

export async function deleteWifiById(userId: number, wifiId: number) {

    await verifyUser(userId);

    await verifyWifiAndUserId(userId, wifiId);

    await wifisRepository.deleteById(wifiId);

    return "Wifi register successfully deleted";
}
