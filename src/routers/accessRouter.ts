import { Router } from "express";
import { signUp } from "../controllers/accessController.js";
import schemaValidator from "../middlewares/schemaValidator.js";
import accessSchema from "../middlewares/accessSchema.js";

const accessRouter = Router();

accessRouter.post("/signup", schemaValidator(accessSchema), signUp);

export default accessRouter;