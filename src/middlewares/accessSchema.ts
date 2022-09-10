import joi from 'joi';

const accessSchema = joi.object({

    email: joi.string().regex(/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/).required(),

    password: joi.string().min(10).required(),

});

export default accessSchema;