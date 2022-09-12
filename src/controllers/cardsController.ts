import { Request, Response } from "express";
import * as cardsService from '../services/cardsService.js';

export async function createCard(req: Request, res: Response) {

    const userId = res.locals.id;

    const card = req.body;

    const result = await cardsService.createCard({ userId: Number(userId), ...card });

    return res.status(201).send(result);
}

export async function getCards(req: Request, res: Response) {

    const userId = res.locals.id;

    const result = await cardsService.getUserCards(Number(userId));

    return res.status(200).send(result);
}

export async function getCardById(req: Request, res: Response) {

    const userId = res.locals.id;

    const { cardId } = req.params;

    const result = await cardsService.getCardById(Number(userId), Number(cardId));

    return res.status(200).send(result);
}

export async function deleteCardById(req: Request, res: Response) {

    const userId = res.locals.id;

    const { cardId } = req.params;

    const result = await cardsService.deleteCardById(Number(userId), Number(cardId));

    return res.status(200).send(result);
}