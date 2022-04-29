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
    return personagem;
}

    
const buildPersonagemSelection = async (personagens) => {
    console.log('Personagens salvos no banco de dados.');
    console.log();
    showPersonagemOptions(personagens); 
    console.log();
    const option = await getInputPrompt(personagens.length);   
    const personagemSelected = personagens[option]
    return personagemSelected; 
}

const showPersonagemOptions = (personagens) => {
    personagens.forEach((personagem, i) => {
        console.log(`${i + 1}) ${personagem.nome} - ${personagem.classe} - ${personagem.raca} - lvl ${personagem.nivel}`);
    }); 
}

const getInputPrompt = async (limit) =>{
    const { personagemOpt } = await inquirer.prompt([
        {
            name: 'personagemOpt',
            type: 'input',
            message: 'Escolha qual personagem você deseja usar:',
            validate: async function (value) {
                const check = parseInt(value);
                return (isNaN(check) || check<1 || check>limit) ?
                `A opção precisa ser um número entre 1 e ${limit}` : true;
            }
        }
    ]);   

    return Number(personagemOpt-1); 
}

module.exports = loadCharacter;