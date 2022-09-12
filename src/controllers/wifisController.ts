import { Request, Response } from "express";
import * as wifisService from '../services/wifisService.js';


export async function createWifi(req: Request, res: Response) {

    const userId = res.locals.id;

    const wifi = req.body;

    const result = await wifisService.createWifi({ userId: Number(userId), ...wifi });

    return res.status(201).send(result);
}


export async function getWifis(req: Request, res: Response) {

    const userId = res.locals.id;

    const result = await wifisService.getUserWifis(Number(userId));

    return res.status(200).send(result);
}

export async function getWifiById(req: Request, res: Response) {

    const userId = res.locals.id;

    const { wifiId } = req.params;

    const result = await wifisService.getWifiById(Number(userId), Number(wifiId));

    return res.status(200).send(result);
}

export async function deleteWifiById(req: Request, res: Response) {

    const userId = res.locals.id;

    const { wifiId } = req.params;

    const result = await wifisService.deleteWifiById(Number(userId), Number(wifiId));

    return res.status(200).send(result);
}