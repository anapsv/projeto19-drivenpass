import client from "../db.js";
import { cards } from "@prisma/client";

export type TypeNewCard = Omit<cards, "id" | "createdAt">

export async function searchByTitleAndUserId(userId: number, title: string) {

    const result = await client.cards.findUnique({
        where: {
            title_userId: {
                userId,
                title
            }
        }
    });

    return result;
}

export async function insert(card: TypeNewCard) {

    await client.cards.create({ data: card });
}

export async function getCards(userId: number) {

    const cards = await client.cards.findMany({ where: { userId } });

    return cards;
}

export async function findById(id: number) {

    const card = await client.cards.findUnique({ where: { id } });

    return card;
}

export async function deleteById(id: number) {

    await client.cards.delete({ where: { id } });
}