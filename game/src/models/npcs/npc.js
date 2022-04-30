module.exports = class NPC  {
    constructor(id, eixo_x, eixo_y, mapa, nome, tipo, vida, texto){

        this.nome = nome;
        this.id = id;
        this.tipo = tipo;

        this.eixo_x = eixo_x;
        this.eixo_y = eixo_y;
        this.mapa = mapa;
        this.vida = vida;
        this.texto = texto;
    }
}