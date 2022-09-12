import { verifyUser } from "./accessService.js";
import * as notesRepository from '../repositories/notesRepository.js';

export async function createNote(data: notesRepository.TypeNewNote) {

    const { userId, title } = data;

    await verifyUser(userId);

    await verifyTitle(userId, title);

    await notesRepository.insert(data);

    return "Secure note successfully registered";
}

async function verifyTitle(userId: number, title: string) {

    const result = await notesRepository.searchByTitleAndUserId(userId, title);

    if (result) throw { type: "conflict_error", message: "A secure note with this title is already registered" };
}

export async function getNotes(userId: number) {

    await verifyUser(userId);

    const notes = await notesRepository.getNotes(userId);

    return notes;
}

export async function getNoteById(userId: number, noteId: number) {

    await verifyUser(userId);

    const note = await verifyNoteAndUserId(userId, noteId);

    return note;
}

export async function deleteNoteById(userId: number, noteId: number) {

    await verifyUser(userId);

    await verifyNoteAndUserId(userId, noteId);

    await notesRepository.deleteById(noteId);

    return "Note successfully deleted";
}

async function verifyNoteAndUserId(userId: number, noteId: number) {

    const note = await notesRepository.findById(noteId);

    if (!note) throw { type: "notfound_error", message: "Note not found" };

    if (note.userId !== userId) throw { type: "unauthorized_error", message: "Note doesn't belong to user" };

    return note;
}