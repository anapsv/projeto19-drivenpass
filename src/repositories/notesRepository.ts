import client from "../db.js";
import { notes } from "@prisma/client";

export type TypeNewNote = Omit<notes, "id" | "createdAt">;

export async function searchByTitleAndUserId(userId: number, title: string) {

    const result = await client.notes.findFirst({ where: { userId, title } });

    return result;
}

export async function insert(newNote: TypeNewNote) {

    await client.notes.create({ data: newNote });
}

export async function getNotes(userId: number) {

    const notes = await client.notes.findMany({ where: { userId } });

    return notes;
}

export async function findById(id: number) {

    const note = await client.notes.findUnique({ where: { id } });

    return note;
}

export async function deleteById(id: number) {

    await client.notes.delete({ where: { id } });
}