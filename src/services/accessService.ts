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

export async function signIn(email: string, password: string) {

    const user = await emailCheck(email);

    if (!user) throw { type: "unauthorized_error", message: "Incorrect email or password" };

    const encryptedPassword = user.password;

    if (!bcrypt.compareSync(password, encryptedPassword)) throw { type: "unauthorized_error", message: "Incorrect email or password" };

    const token = generateToken(user.id);

    return { token };
}

async function emailCheck(email: string) {

    return await accessRepository.findByEmail(email);

}

function encryptPassword(password: string) {

    const salt = 10;

    return bcrypt.hashSync(password, salt);
}

function generateToken(id: number) {

    const data = { id };

    const SECRET = "" + process.env.JWT_SECRET;

    const EXPIRES_IN = Number(process.env.TOKEN_EXPIRES_IN);

    const options = { expiresIn: EXPIRES_IN };

    return jwt.sign(data, SECRET, options);
}

export async function verifyUser(id: number) {

    const user = await accessRepository.findByToken(id);

    if (!user) throw { type: "notfound_error", message: "User not found" }
}