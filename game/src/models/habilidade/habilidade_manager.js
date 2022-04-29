const Habilidade = require('./habilidade'); 
const db = require("../../db/db_config");

module.exports = class HabilidadeManager {
    static async getByName(nome){
      const client = await db.connect();
      const querySelectByName = `SELECT * from HABILIDADE JOIN HABILIDADE_TIPO ON HABILIDADE.nome = HABILIDADE_TIPO.nome WHERE HABILIDADE.nome = '${nome}';`
      const query = await client.query(querySelectByName);
      const habilidade = query.rows[0]; 
      client.release();

      if(habilidade){
          return new Habilidade(
            habilidade.nome, 
            habilidade.descricao,
            habilidade.nivel, 
            habilidade.tipo
          ); 
      }
  }

  static async getAllByTipo(tipo){
    const client = await db.connect();
    const querySelectByName = `SELECT * from HABILIDADE JOIN HABILIDADE_TIPO ON HABILIDADE.nome = HABILIDADE_TIPO.nome WHERE HABILIDADE_TIPO.tipo = '${tipo}';`
    const query = await client.query(querySelectByName);
    client.release();
    return query.rows.map(habilidade => new Habilidade(
      habilidade.nome, 
      habilidade.descricao,
      habilidade.nivel, 
      habilidade.tipo
    ));
  }

  static async saveToClerigoTruque(habilidade, personagem){
    const client = await db.connect();
    const insertQuery = `INSERT INTO ClerigoTruque(clerigo, truque) VALUES (${personagem.id}, '${habilidade.nome}');`; 
    await client.query(insertQuery);
    client.release();
  }

  static async saveToClerigoCura(habilidade, personagem){
    const client = await db.connect();
    const insertQuery = `INSERT INTO ClerigoCura(clerigo, cura) VALUES (${personagem.id}, '${habilidade.nome}');`; 
    await client.query(insertQuery);
    client.release();
  }

  static async saveToMagoMagia(habilidade, personagem){
    const client = await db.connect();
    const insertQuery = `INSERT INTO MagoMagia (mago, magia) VALUES (${personagem.id}, '${habilidade.nome}');`; 
    await client.query(insertQuery);
    client.release();

  }
}