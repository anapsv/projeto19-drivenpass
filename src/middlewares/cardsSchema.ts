import joi from 'joi';

const cardSchema = joi.object({
    title: joi.string().required(),
    number: joi.string().length(16).pattern(/^[0-9]+$/).required(),
    cardholderName: joi.string().required(),
    securityCode: joi.string().length(3).pattern(/^[0-9]+$/).required(),
    expirationDate: joi.string().pattern(/^(0[1-9]|1[012])[-\/.]([0-9][0-9])$/).required(),
    password: joi.string().pattern(/^[0-9]+$/).required(),
    isVirtual: joi.boolean().strict().required(),
    type: joi.string().valid('credit', 'debit', 'both').required()
})

export default cardSchema;