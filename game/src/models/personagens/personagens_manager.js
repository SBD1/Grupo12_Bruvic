const db = require("../../db/db_config");
const Personagem = require("./personagem");

module.exports = class PersonagensManager {

    static async getPersonagemAtual(nome="bolinha"){
        const client = await db.connect();
        const querySelectByName = `SELECT DISTINCT * from DefinicaoPersonagem def LEFT JOIN Personagem personagem  ON personagem.id = def.personagem WHERE personagem.nome = '${nome}';`

        const retrived_personagem = await client.query(querySelectByName).then(async(res) => {
            const personagem_info = res.rows[0];
            if (personagem_info){
                const personagem = new Personagem(personagem_info.id, personagem_info.vida, personagem_info.nome, 
                    personagem_info.destreza,personagem_info.forca, personagem_info.constituicao,
                    personagem_info.carisma, personagem_info.sabedoria, personagem_info.inteligencia, personagem_info.montante,
                    personagem_info.raca, personagem_info.classe, personagem_info.classe_de_armadura, personagem_info.experiencia, personagem_info.nivel)
                await client.query(`SELECT * FROM MOCHILA WHERE personagem = ${personagem_info.id}`).then((res) => {
                        const personagem_mochila = res.rows[0];
                        personagem.setMochilaInfo(personagem_mochila.capacidade, personagem_mochila.id);
                });
                return personagem;
            }
            return false;
        });


        client.release();
        return await retrived_personagem;
    }
}