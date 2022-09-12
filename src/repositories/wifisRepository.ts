import client from "../db.js";
import { wifis } from "@prisma/client";

export type TypeNewWifi = Omit<wifis, "id" | "createdAt">

export async function findByTitleAndUserId(userId: number, title: string) {

    const result = await client.wifis.findUnique({
        where:
        {
            title_userId: {
                userId,
                title
            }
        }
    });

    return result;
}

export async function insert(wifi: TypeNewWifi) {

    await client.wifis.create({ data: wifi });
}

export async function getUserWifis(userId: number) {

    const wifis = await client.wifis.findMany({ where: { userId } });

    return wifis;
}

export async function getById(id: number) {

    const wifi = await client.wifis.findUnique({ where: { id } });

    return wifi;
}

export async function deleteById(id: number) {

    await client.wifis.delete({ where: { id } });
}