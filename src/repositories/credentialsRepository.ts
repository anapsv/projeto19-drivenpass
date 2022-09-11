import client from '../db.js';
import { credentials } from '@prisma/client';

export type TypeNewCredential = Omit<credentials, "id" | "createdAt">;

export async function findByUserIdAndTitle(userId: number, title: string) {

    const credential = await client.credentials.findFirst({ where: { userId, title } });

    return credential;
}

export async function insert(newCredential: TypeNewCredential) {

    await client.credentials.create({ data: newCredential });
}

export async function getUserCredentials(userId: number) {

    const credentials = await client.credentials.findMany({ where: { userId } });

    return credentials;
}

export async function getCredentialById(id: number) {

    const credential = await client.credentials.findUnique({ where: { id } });

    return credential;
}

export async function deleteCredentialById(id: number) {

    await client.credentials.delete({ where: { id } });
}