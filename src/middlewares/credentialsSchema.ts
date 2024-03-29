import joi from "joi";

const credentialsSchema = joi.object({
    title: joi.string().required(),
    url: joi.string().uri().required(),
    username: joi.string().required(),
    password: joi.string().required()
});

export default credentialsSchema;
