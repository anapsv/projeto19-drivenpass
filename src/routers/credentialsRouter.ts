import { Router } from "express";
import { createCredential, getCredentials, getCredentialById, deleteCredentialById } from "../controllers/credentialsController.js";
import validateToken from "../middlewares/tokenValidator.js";
import credentialsSchema from "../middlewares/credentialsSchema.js";
import schemaValidator from "../middlewares/schemaValidator.js";

const credentialsRouter = Router();

credentialsRouter.post("/credentials/new", validateToken, schemaValidator(credentialsSchema), createCredential);
credentialsRouter.get("/credentials", validateToken, getCredentials);
credentialsRouter.get("/credentials/:credentialId", validateToken, getCredentialById);
credentialsRouter.delete("/credentials/delete/:credentialId", validateToken, deleteCredentialById);

export default credentialsRouter;