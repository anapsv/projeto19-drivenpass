import { Request, Response } from "express";
import * as notesService from '../services/notesService.js';

export async function createNote(req: Request, res: Response) {

    const userId = res.locals.id;

    const note = req.body;

    const result = await notesService.createNote({ userId: Number(userId), ...note });

    return res.status(201).send(result);
}

export async function getUserNotes(req: Request, res: Response) {

    const userId = res.locals.id;

    const result = await notesService.getNotes(Number(userId));

    return res.status(200).send(result);
}

export async function getNoteById(req: Request, res: Response) {

    const userId = res.locals.id;

    const { noteId } = req.params;

    const result = await notesService.getNoteById(Number(userId), Number(noteId));

    return res.status(200).send(result);
}

export async function deleteNoteById(req: Request, res: Response) {

    const userId = res.locals.id;

    const { noteId } = req.params;

    const result = await notesService.deleteNoteById(Number(userId), Number(noteId));

    return res.status(200).send(result);
}