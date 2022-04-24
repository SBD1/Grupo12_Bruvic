const forms  = require('./praca_negociantes_forms');
const ItemsManager = require("../../models/items/items_manager");
const NegociantesManager = require('../../models/negociantes/negociantes_manager');

module.exports = {
    run: async () => {
        const negociantes = await NegociantesManager.getAll().then((res)=>{return res});

        const mensagem_praca = await forms.choiceFromNegocianteList(negociantes);
        console.log(mensagem_praca);
        if(mensagem_praca.selecaoNegociante == forms.BACK_MENU){
            //TODO: something
            console.log("voltar ao menu anterior")
        } else {
            console.log("mostra os itens")
            const negocianteSelecionado = negociantes.filter(negociante => {
                return negociante.nome === mensagem_praca.selecaoNegociante
            })[0];
            const itemsNegociante = await ItemsManager.getAllFromNegociante(negocianteSelecionado).then((res) => {return res});
            forms.choiceFromItemsList(negocianteSelecionado, itemsNegociante);
        }
    }
}