module.exports = class HabilidadeManager {
    static async get(nome){
      const client = await db.connect();
      const querySelectByName = `SELECT * from HABILIDADE where nome = '${nome}'`

      const query = await client.query(querySelectByName);
      console.log(query);
      client.release();
  }
}