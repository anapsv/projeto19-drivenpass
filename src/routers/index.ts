import { Router } from "express";
import accessRouter from "./accessRouter.js";
import credentialsRouter from "./credentialsRouter.js";
import notesRouter from "./notesRouter.js";

const router = Router();

router.use(accessRouter, credentialsRouter, notesRouter);

export default router;