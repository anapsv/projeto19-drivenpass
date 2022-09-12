import { Router } from "express";
import * as notesController from '../controllers/notesController.js';
import notesSchema from "../middlewares/notesSchema.js";
import validateToken from "../middlewares/tokenValidator.js";
import schemaValidator from "../middlewares/schemaValidator.js";

const notesRouter = Router();

notesRouter.post("/notes/new", validateToken, schemaValidator(notesSchema), notesController.createNote);
notesRouter.get("/notes", validateToken, notesController.getUserNotes);
notesRouter.get("/notes/:noteId", validateToken, notesController.getNoteById);
notesRouter.delete("/notes/delete/:noteId", validateToken, notesController.deleteNoteById);

export default notesRouter;