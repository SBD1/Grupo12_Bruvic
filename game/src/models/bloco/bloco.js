module.exports = class Bloco {
  constructor(eixo_x, eixo_y, mapa, tipo, spawn_item) {
    // mandatory fields
    this.eixo_x = eixo_x;
    this.eixo_y = eixo_y;
    this.mapa = mapa;
    this.tipo = tipo;

    // optional fields
    this.spawn_item = spawn_item;
  }
};
