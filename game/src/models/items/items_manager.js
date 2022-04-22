const Item = require("./item");
const db = require("../../db/db_config");

module.exports = class ItemsManager {

    static async get(nome){
        const client = await db.connect();
        const querySelectByName = `SELECT * from ITEM where nome = '${nome}'`

        const retrived_item = await client.query(querySelectByName).then((res)=>{
            const item = res.rows[0];
            return new Item(item.nome, 
                            item.preco, 
                            item.peso, 
                            item.eixo_x, 
                            item.eixo_y,
                            item.mapa,
                            item.mochila,
                            item.negociante);
        });
        return await retrived_item;
    }

    static create(nome, preço){
        // faz um insert e retorna o item
        return;
    }

    static async getAllFromNegociante(negociante){
        const client = await db.connect();
        const querySelectByNegociante = `SELECT * from ITEM where negociante = '${negociante.id}'`
        
        const items = [];
        const retrived_items = await client.query(querySelectByNegociante).then((res)=>{
            res.rows.forEach((item) => {
                items.push(new Item(item.nome, 
                    item.preco, 
                    item.peso, 
                    item.eixo_x, 
                    item.eixo_y,
                    item.mapa,
                    item.mochila,
                    item.negociante));
            }

            );
            return items;
        });
        return await retrived_items;
    }

    static async getAllFromMochila(mochila){
        const client = await db.connect();
        const querySelectByMochila = `SELECT * from ITEM where mochila = '${mochila.id}'`
        return;
    }

}