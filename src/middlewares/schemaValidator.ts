import { Request, Response, NextFunction } from "express";

export default function schemaValidator(schema: any) {

    return (req: Request, res: Response, next: NextFunction) => {

        const { error } = schema.validate(req.body);

        if (error) {

            throw { type: "schema_error", message: error.details.map((detail: { message: any }) => detail.message) }

        }

        next();
    }
}