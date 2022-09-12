import { Router } from "express";
import * as wifisController from '../controllers/wifisController.js';
import validateToken from "../middlewares/tokenValidator.js";
import wifiSchema from "../middlewares/wifisSchema.js";
import schemaValidator from "../middlewares/schemaValidator.js";

const wifisRouter = Router();

wifisRouter.post("/wifis/new", validateToken, schemaValidator(wifiSchema), wifisController.createWifi);
wifisRouter.get("/wifis", validateToken, wifisController.getWifis);
wifisRouter.get("/wifis/:wifiId", validateToken, wifisController.getWifiById);
wifisRouter.delete("/wifis/delete/:wifiId", validateToken, wifisController.deleteWifiById);

export default wifisRouter;