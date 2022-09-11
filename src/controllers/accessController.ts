import { Request, Response } from "express";
import * as accessService from '../services/accessService.js';

export async function signUp(req: Request, res: Response) {

    const data = req.body;

    const result = await accessService.signUp(data);

    return res.status(201).send(result);

}

export async function signIn(req: Request, res: Response) {

    const { email, password } = req.body;

    const result = await accessService.signIn(email, password);

    return res.status(200).send(result);
}