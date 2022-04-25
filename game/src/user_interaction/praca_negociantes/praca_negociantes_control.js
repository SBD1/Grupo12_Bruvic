const forms  = require('./praca_negociantes_forms');
const ItemsManager = require("../../models/items/items_manager");
const NegociantesManager = require('../../models/negociantes/negociantes_manager');
const chalk = require('chalk');

async function negociantesFlow(personagem){
    const negociantes = await NegociantesManager.getAll().then((res)=>{return res});
    const formNegociante = await forms.choiceFromNegocianteList(negociantes);

    if(formNegociante.selecaoNegociante == forms.BACK_MENU){
        const clear = require('clear');
        clear();
        const personagemControl = require('../personagem_loc/personagem_loc_control');
        personagemControl.localizacaoPersonagem(personagem);
    } else {
        const negocianteSelecionado = negociantes.filter(negociante => {
            return negociante.nome === formNegociante.selecaoNegociante
        })[0];
        const itemsNegociante = await ItemsManager.getAllFromNegociante(negocianteSelecionado).then((res) => {return res});
        const formItem = await forms.choiceFromItemsList(negocianteSelecionado, itemsNegociante);
        itemsFlow(formItem, personagem);
    }
}

async function itemsFlow(formItem, personagem){
    const clear = require('clear');

    if(formItem.selecaoItem == forms.BACK_MENU){
        clear();
        await negociantesFlow(personagem);
    } else {
        await formItem.selecaoItem.vender(personagem);
        clear();
        console.log(
            chalk.green(`Você adquiriu o item ${formItem.selecaoItem.nome} com sucesso e foi transferido para sua mochila.\n\n\n\n`)
        );
        await negociantesFlow(personagem);
    }
}

module.exports = {
    run: async (personagem) => {
        negociantesFlow(personagem);
    }
}