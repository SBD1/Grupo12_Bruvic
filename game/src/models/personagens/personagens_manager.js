const db = require("../../db/db_config");
const Personagem = require("./personagem");

module.exports = class PersonagensManager {

    static async getPersonagemAtual(nome="bolinha"){

        const client = await db.connect();
        const querySelectByName = `SELECT DISTINCT * from DefinicaoPersonagem def LEFT JOIN Personagem personagem  ON personagem.id = def.personagem WHERE personagem.nome = '${nome}';`

        const response = await client.query(querySelectByName); 
        const personagem_info = response.rows[0];

        if(!personagem_info){
            client.release();
            return;
        }

        const personagem = new Personagem(
            personagem_info.id, 
            personagem_info.vida, 
            personagem_info.nome, 
            personagem_info.destreza,
            personagem_info.forca, 
            personagem_info.constituicao,
            personagem_info.carisma, 
            personagem_info.sabedoria, 
            personagem_info.inteligencia, 
            personagem_info.montante,
            personagem_info.raca, 
            personagem_info.classe, 
            personagem_info.classe_de_armadura, 
            personagem_info.experiencia, 
            personagem_info.nivel
        );
        const mochila = await client.query(`SELECT * FROM MOCHILA WHERE personagem = ${personagem_info.id}`)
        const mochila_info = mochila.rows[0]; 
        personagem.setMochilaInfo(mochila_info.capacidade, mochila_info.id);
        client.release();
        return personagem; 
    }
}