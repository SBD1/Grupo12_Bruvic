const db = require("../../db/db_config");
const clui = require('clui'),
clc = require('cli-color'),
Line = clui.Line;

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


    async vender(personagem, usoMochila){
        const chalk = require('chalk');
        if(personagem.montante >= this.preco && personagem.capacidadeMochila >= (usoMochila + this.peso)){
            const fs = require('fs');
            const pathToScript = require('path').resolve(__dirname, './item_sale.sql');
            const scriptFile = fs.readFileSync(pathToScript).toString();
            const client = await db.connect();
    
            await client.query(scriptFile).then(async ()=>{
                await client.query(`select vendeItem('${this.nome}', '${personagem.nome}', ${personagem.idMochila})`);
            });
            client.release();
            console.log(
                chalk.green(`Você adquiriu o item ${this.nome} com sucesso e ele foi transferido para sua mochila.\n\n\n\n`)
            );
        } else {
            console.log(
                chalk.red(
                    `Você não tem dinheiro suficiente para adquirir o item ou sua mochila está cheia.`
                )
            );
        }

    }
    
    static cabecalhoTabela(){
       return new Line()
         .padding(2)
         .column('Nome', 30, [clc.cyan])
         .column('Preço', 10, [clc.cyan])
         .column('Peso', 10, [clc.cyan])
         .fill();
    }

    visualizarEmLinha(){

        return new Line()
        .padding(2)
        .column(this.nome, 30, [clc.cyan])
        .column(String(this.preco), 10, [clc.cyan])
        .column(String(this.peso), 10, [clc.cyan])
        .fill();
    }

    removerItemDaMochila(){
        return;
    }

}