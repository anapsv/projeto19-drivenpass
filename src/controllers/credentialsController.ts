import { Request, Response } from "express";
import * as credentialsService from '../services/credentialsService.js';

export async function createCredential(req: Request, res: Response) {

    const userId = res.locals.id;

    const credential = req.body;

    const result = await credentialsService.createCredential({ userId: Number(userId), ...credential });

    return res.status(201).send(result);
}

export async function getCredentials(req: Request, res: Response) {

    const userId = res.locals.id;

    const result = await credentialsService.getUserCredentials(Number(userId));

    return res.status(200).send(result);
}

export async function getCredentialById(req: Request, res: Response) {

    const userId = res.locals.id;

    const { credentialId } = req.params;

    const result = await credentialsService.getCredentialById(Number(userId), Number(credentialId));

    return res.status(200).send(result);
}

export async function deleteCredentialById(req: Request, res: Response) {

    const userId = res.locals.id;

    const { credentialId } = req.params;

    const result = await credentialsService.deleteCredentialById(Number(userId), Number(credentialId));

    return res.status(200).send(result);
}