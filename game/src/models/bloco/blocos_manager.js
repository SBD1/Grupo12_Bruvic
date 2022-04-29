const Bloco = require("./bloco");
const db = require("../../db/db_config");

module.exports = class BlocosManager {
  static async getAllFromMapa(mapa) {
    const client = await db.connect();
    const querySelectByMapa = `SELECT * from BLOCO where mapa = '${mapa.id}'`;
    const blocos = [];

    const retrived_blocos = await client
      .query(querySelectByMapa)
      .then((res) => {
        res.rows.forEach((bloco) => {
          blocos.push(
            new Bloco(
              bloco.eixo_x,
              bloco.eixo_y,
              bloco.mapa,
              bloco.tipo,
              bloco.spawn_item
            )
          );
        });
        return blocos;
      });
    client.release();
    return await retrived_blocos;
  }
};
