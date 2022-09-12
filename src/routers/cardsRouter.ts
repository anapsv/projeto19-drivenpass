import { Router } from "express";
import * as cardsController from '../controllers/cardsController.js';
import cardSchema from "../middlewares/cardsSchema.js";
import validateToken from "../middlewares/tokenValidator.js";
import schemaValidator from "../middlewares/schemaValidator.js";

const cardsRouter = Router();

cardsRouter.post("/cards/new", validateToken, schemaValidator(cardSchema), cardsController.createCard);
cardsRouter.get("/cards", validateToken, cardsController.getCards);
cardsRouter.get("/cards/:cardId", validateToken, cardsController.getCardById);
cardsRouter.delete("/cards/delete/:cardId", validateToken, cardsController.deleteCardById);

export default cardsRouter;