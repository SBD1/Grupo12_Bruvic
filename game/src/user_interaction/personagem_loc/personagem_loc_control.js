const forms  = require('./personagem_loc_forms');
const PersonagensManager = require('../../models/personagens/personagens_manager');
const ItemsManager = require('../../models/items/items_manager');
const Mochila = require('../../models/mochila');
const Item = require('../../models/items/item');
const chalk = require('chalk')

async function localizacaoPersonagem(personagem){
    await forms.prossegueAventuraPersonagem().then(async (formAventura) => {

        if(formAventura.selecaoCaminho == forms.PRACA_NEGOCIANTES){
            const praca_negociantes_control = require('../praca_negociantes/praca_negociantes_control');
            return praca_negociantes_control.run(personagem);
        } else {
            showPersonagemMochila(personagem);
            localizacaoPersonagem(personagem);
        }

    });
}

async function showPersonagemMochila(personagem){
    const items = await ItemsManager.getAllFromPersonagem(personagem);
    const capacity = Mochila.showCapacityUse(items, personagem.capacidadeMochila);
    console.log(chalk.green(capacity));
    
    console.log(Item.cabecalhoTabela().contents());

    items.forEach(item => {
        console.log(item.visualizarEmLinha().contents());
    });
}

module.exports = {
    run: async () => {
        await forms.askPersonagemNome().then(async (formPersonagem) => {
            const personagem = await PersonagensManager.getPersonagemAtual(formPersonagem.nomePersonagem);
            localizacaoPersonagem(personagem);
        });
    },
    localizacaoPersonagem: localizacaoPersonagem,
    showPersonagemMochila: showPersonagemMochila
}