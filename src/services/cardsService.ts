import { verifyUser } from "./accessService.js";
import * as cardsRepository from '../repositories/cardsRepository.js'
import Cryptr from "cryptr";

export async function createCard(cardData: cardsRepository.TypeNewCard) {

    const { userId, title, password, securityCode } = cardData;

    await verifyUser(userId);

    const card = { ...cardData, password: encryptData(password), securityCode: encryptData(securityCode) };

    await cardsRepository.insert(card);

    return "Card successfully registered";
}

async function verifyTitle(userId: number, title: string) {

    const result = await cardsRepository.searchByTitleAndUserId(userId, title);

    if (result) throw { type: "conflict_error", message: "A card with this title is already registered" };
}

function encryptData(arg: string) {

    const cryptr = new Cryptr(process.env.CRYPTR_SECRET || "");

    const encryptedData = cryptr.encrypt(arg);

    return encryptedData;
}

function decryptData(arg: string) {

    const crypt = new Cryptr(process.env.CRYPTR_SECRET || "");

    const decryptedData = crypt.decrypt(arg);

    return decryptedData;
}

export async function getUserCards(userId: number) {

    await verifyUser(userId);

    const cards = await cardsRepository.getCards(userId);

    cards.map(card => {
        card.password = decryptData(card.password);
        card.securityCode = decryptData(card.securityCode);
    });

    return cards;
}

export async function getCardById(userId: number, cardId: number) {

    await verifyUser(userId);

    const card = await verifyCardAndUserId(userId, cardId);

    return { ...card, password: decryptData(card.password), securityCode: decryptData(card.securityCode) };
}

export async function deleteCardById(userId: number, cardId: number) {

    await verifyUser(userId);

    await verifyCardAndUserId(userId, cardId);

    await cardsRepository.deleteById(cardId);

    return "Card successfully deleted";
}

async function verifyCardAndUserId(userId: number, cardId: number) {

    const card = await cardsRepository.findById(cardId);

    if (!card) throw { type: "notfound_error", message: "Card not found" };

    if (card.userId !== userId) throw { type: "unauthorized_error", message: "Card doesn't belong to user" };

    return card;
}