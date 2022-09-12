import { verifyUser } from "./accessService.js";
import * as credentialsRepository from '../repositories/credentialsRepository.js';
import Cryptr from 'cryptr';

export async function createCredential(data: credentialsRepository.TypeNewCredential) {

    const { userId, title, password } = data;

    await verifyUser(userId);

    await verifyTitle(userId, title);

    const credentials = { ...data, password: encryptPassword(password) };

    await credentialsRepository.insert(credentials);

    return "Credential successfully registered";
}

async function verifyTitle(userId: number, title: string) {

    const result = await credentialsRepository.findByUserIdAndTitle(userId, title);

    if (result) throw { type: "conflict_error", message: "A credential with this title is already registered" };
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

export async function getUserCredentials(userId: number) {

    await verifyUser(userId);

    const credentials = await credentialsRepository.getUserCredentials(userId);

    credentials.map(credential => credential.password = decryptPassword(credential.password));

    return credentials;
}

export async function getCredentialById(userId: number, credentialId: number) {

    await verifyUser(userId);

    const credential = await verifyCredentialAndUserId(userId, credentialId);

    return { ...credential, password: decryptPassword(credential.password) };
}

export async function deleteCredentialById(userId: number, credentialId: number) {

    await verifyUser(userId);

    await verifyCredentialAndUserId(userId, credentialId);

    await credentialsRepository.deleteCredentialById(credentialId);

    return "Credential successfully deleted";
}

async function verifyCredentialAndUserId(userId: number, credentialId: number) {

    const credential = await credentialsRepository.getCredentialById(credentialId);

    if (!credential) throw { type: "notfound_error", message: "Credential not found" };

    if (credential.userId !== userId) throw { type: "unauthorized_error", message: "Credential doesn't belong to user" };

    return credential;
}