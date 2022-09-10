import { users } from "@prisma/client";
import client from "../db.js";

export type TypeNewUser = Omit<users, "id" | "createdAt">;

export async function findByEmail(email: string) {

    const result = await client.users.findUnique({ where: { email } });

    return result;
}

export async function insert(newUser: TypeNewUser) {

    await client.users.create({ data: newUser });
}