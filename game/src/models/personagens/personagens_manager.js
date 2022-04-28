const db = require("../../db/db_config");
const Personagem = require("./personagem");
const HabilidadeManager = require('../habilidade/habilidade_manager'); 
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
        if(mochila_info){
            personagem.setMochilaInfo(mochila_info.capacidade, mochila_info.id);
        }
        

        if(personagem.classe === 'Clerigo'){
            const cura = await client.query(`SELECT * FROM ClerigoCura WHERE clerigo = ${personagem.id}`);
            const cura_info_promisses =  cura.rows.map(cura_info => HabilidadeManager.getByName(cura_info.cura)); 
            const cura_info = await Promise.all(cura_info_promisses); 
            if(cura_info && cura_info.length > 0){
                personagem.habilidades = [...personagem.habilidades, ...cura_info]
            }

            const truque = await client.query(`SELECT * FROM ClerigoTruque WHERE clerigo = ${personagem.id}`);
            const truque_info_promisses =  truque.rows.map(truque_info => HabilidadeManager.getByName(truque_info.truque)); 
            const truque_info = await Promise.all(truque_info_promisses); 
            if(truque_info && truque_info.length > 0){
                personagem.habilidades = [...personagem.habilidades, ...truque_info]
            }
        }
        
        if(personagem.classe  === 'Mago'){
            const magia = await client.query(`SELECT * FROM MagoMagia WHERE mago = ${personagem.id}`);
            const magia_info_promisses =  magia.rows.map(magia_info => HabilidadeManager.getByName(magia_info.magia)); 
            const magia_info = await Promise.all(magia_info_promisses); 
            if(magia_info && magia_info.length > 0){
                personagem.habilidades = [...personagem.habilidades, ...magia_info]
            }
        }

        
        client.release();
        return personagem; 
    }

    static async addHabiliadesToPersonagem(personagem, habilidade){
        const client = await db.connect();
    
        if(!personagem.classe || !habilidade.tipo) return; 

        let query; 
        if(personagem.classe  === 'Clerigo' && habilidade.tipo === 'Cura'){
            query = 'ClerigoCura(clerigo, cura)'; 
        }

        if(personagem.classe  === 'Clerigo' && habilidade.tipo === 'Truque'){
            query = 'ClerigoTruque(clerigo, truque)'; 
        }

        if(personagem.classe  === 'Mago' && habilidade.tipo === 'Magia'){
            query = 'MagoMagia(mago, magia)'; 
        }
       const result =  await client.query(`INSERT INTO ${query} VALUES (${personagem.id}, '${habilidade.nome}');`)
       console.log(result);
       client.release();
       personagem.setNewHabilidade(habilidade); 
       return personagem;
    }
}