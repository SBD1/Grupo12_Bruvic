const inquirer = require('inquirer');
const { buildGameTitle } = require('../common'); 
const PersonagensManager = require('../../models/personagens/personagens_manager');

const loadCharacter = async () => {
    buildGameTitle();
    const personagens = await PersonagensManager.getAllPersonagem();
    if(personagens.length === 0){
        console.log('Não há personagens disponíveis para serem escolhidos.'); 
        return; 
    }
    const personagem = await buildPersonagemSelection(personagens); 
    return personagem.selecao;
}


const personagemSelectionMenu = async(personagens) => {
    const Personagem = require('../../models/personagens/personagem');
    const headers = Personagem.cabecalhoTabela();
  
    const personagens_choices = personagens.map((personagem) => { 
      personagem_name_line = personagem.visualizarEmLinha();
      return {name: personagem_name_line.contents(), value: personagem, short: personagem.nome}
    });
  
    const questions = [
    {
      type: 'list',
      name: 'selecao',
      message: `Esses são os personagens presentes no banco de dados\n ${headers.contents()}`,
      choices: personagens_choices
    }
    ];
    return inquirer.prompt(questions);
}
    
const buildPersonagemSelection = async (personagens) => {
    return await personagemSelectionMenu(personagens);
}

module.exports = loadCharacter;