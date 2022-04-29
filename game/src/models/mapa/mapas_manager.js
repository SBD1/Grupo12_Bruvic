const Mapa = require("./mapa");
const db = require("../../db/db_config");

module.exports = class MapasManager {
  static async get(id) {
    const client = await db.connect();
    const querySelectById = `SELECT * from MAPA where id = '${id}'`;

    const retrived_mapa = await client.query(querySelectById).then((res) => {
      const mapa = res.rows[0];
      return new Mapa(mapa.id, mapa.largura, mapa.altura);
    });
    client.release();
    return await retrived_mapa;
  }
};
