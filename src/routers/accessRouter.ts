import { Router } from "express";
import { signIn, signUp } from "../controllers/accessController.js";
import schemaValidator from "../middlewares/schemaValidator.js";
import accessSchema from "../middlewares/accessSchema.js";

const accessRouter = Router();

accessRouter.post("/signup", schemaValidator(accessSchema), signUp);
accessRouter.post("/signin", schemaValidator(accessSchema), signIn);

export default accessRouter;