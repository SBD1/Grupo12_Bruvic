const db = require("../../db/db_config");
const NPC = require("./npc");

module.exports = class NPCsManager {

    static async getNPCInfoByCoordinates(eixo_x, eixo_y){
        const client = await db.connect();
        const querySelectByName = `SELECT * from NPC WHERE eixo_x = ${eixo_x} AND eixo_y = ${eixo_y}`

        const retrived_npc = await client.query(querySelectByName).then((res) => {
            const npcInfo = res.rows[0]
            const npc = new NPC(npcInfo.id, npcInfo.eixo_x, npcInfo.eixo_y, npcInfo.mapa, npcInfo.nome,
                npcInfo.tipo, npcInfo.vida, npcInfo.texto);
            
            return npc;
        });
        return await retrived_npc;
    }
}