const db = require("../../db/db_config");

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
        const pathToScript = require('path').resolve(__dirname, './item_sale.sql');
        const scriptFile = fs.readFileSync(pathToScript).toString();
        const client = await db.connect();

        await client.query(scriptFile).then(async ()=>{
            await client.query(`select vendeItem('${this.nome}', '${personagem.nome}', ${personagem.idMochila})`);
        });
        client.release();
    }

    removerItemDaMochila(){
        return;
    }

}