const db = require("../../db/db_config");
const Negociante = require("./negociante");

module.exports = class NegociantesManager {

    static async getAll(){
        const client = await db.connect();
        const querySelectByName = `SELECT * from Negociante negociante LEFT JOIN NPC npc ON negociante.npc = npc.id`

        const retrived_negociantes = await client.query(querySelectByName).then((res)=>{
            const negociantes = [];
            res.rows.forEach(function(negociante) {
                negociantes.push(new Negociante(
                    negociante.id,
                    negociante.eixo_x,
                    negociante.eixo_y,
                    negociante.mapa,
                    negociante.nome,
                    negociante.tipo,
                    negociante.vida,
                    negociante.montante
                ));
            });
            return negociantes;
        });
        return await retrived_negociantes;
    }

}