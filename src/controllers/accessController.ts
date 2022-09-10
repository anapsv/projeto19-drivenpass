import { Request, Response } from "express";
import * as accessService from '../services/accessService.js';

export async function signUp(req: Request, res: Response) {

    const data = req.body;

    await accessService.signUp(data);

    return res.status(201);

}