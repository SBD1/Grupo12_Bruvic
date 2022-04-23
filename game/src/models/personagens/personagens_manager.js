const db = require("../../db/db_config");
const Negociante = require("./negociante");

module.exports = class PersonagensManager {

    static async getPersonagemAtual(nome="bolinha"){
        const client = await db.connect();
        const querySelectByName = `SELECT DISTINCT * from DefinicaoPersonagem def LEFT JOIN Personagem personagem  ON personagem.id = def.personagem WHERE personagem.nome = '${nome}';`

        const retrived_negociantes = await client.query(querySelectByName).then((res)=>{
            const negociantes = [];
            res.rows.forEach((negociante) => {
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