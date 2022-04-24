const forms  = require('./praca_negociantes_forms');
const ItemsManager = require("../../models/items/items_manager");
const NegociantesManager = require('../../models/negociantes/negociantes_manager');

module.exports = {
    run: async () => {
        const negociantes = await NegociantesManager.getAll().then((res)=>{return res});

        const mensagem_praca = await forms.choiceFromNegocianteList(negociantes);
        console.log(mensagem_praca);
    }
}