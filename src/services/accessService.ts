import * as accessRepository from '../repositories/accessRepository.js';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';

export async function signUp(data: accessRepository.TypeNewUser) {

    const emailRegistered = await emailCheck(data.email);

    if (emailRegistered) throw { type: 'conflict_error', message: 'Email already registered' };

    const encryptedPassword = encryptPassword(data.password);

    await accessRepository.insert({ email: data.email, password: encryptedPassword });

    return 'User successfully registered';

}

async function emailCheck(email: string) {

    return await accessRepository.findByEmail(email);

}

function encryptPassword(password: string) {

    const salt = 10;

    return bcrypt.hashSync(password, salt);

}