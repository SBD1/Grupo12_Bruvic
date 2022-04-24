const forms  = require('./personagem_loc_forms');
const PersonagensManager = require('../../models/personagens/personagens_manager');

async function localizacaoPersonagem(personagem){
    await forms.prossegueAventuraPersonagem().then(async () => {
        const praca_negociantes_control = require('../praca_negociantes/praca_negociantes_control');
        await praca_negociantes_control.run(personagem);
    });
}

module.exports = {
    run: async () => {
        await forms.askPersonagemNome().then(async (formPersonagem) => {
            const personagem = await PersonagensManager.getPersonagemAtual(formPersonagem.nomePersonagem);
            localizacaoPersonagem(personagem);
        });
    },
    localizacaoPersonagem: localizacaoPersonagem
}