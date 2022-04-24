const db = require("../../db/db_config");
const client = db.connect();

module.exports = class Item  {
    constructor(nome, preco, peso, eixo_x=null, eixo_y=null, mapa=null, mochila=null, negociante=null){

        // mandatory fields
        this.nome = nome
        this.preco = preco
        this.peso = peso

        // optional fields
        this.eixo_x = eixo_x
        this.eixo_y = eixo_y
        this.mapa = mapa
        this.mochila = mochila
        this.negociante = negociante 
    }


    async vender(personagem){
        const fs = require('fs');
        const patha = require('path').resolve(__dirname, './item_sale.sql');
        console.log(patha)
        const scriptFile = fs.readFileSync(patha).toString();
        const values = [`'${this.nome}'`, `'${personagem.nome}'`, `'${personagem.idMochila}'`];
        await client.query(scriptFile, values);
    }

    removerItemDaMochila(){
        return;
    }

}