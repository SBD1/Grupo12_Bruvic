const inquirer = require('inquirer');
const chalk = require('chalk');
const PersonagensManager = require('../../models/personagens/personagens_manager');
const NegociantesManager = require('../../models/negociantes/negociantes_manager');
const BACK_MENU = 'voltar para o menu anterior';

module.exports = {
    askPersonagemNome: () => {
    console.log(
        chalk.green(
            "Olá aventureire, bem vindo de volta!"
        )
        );
    const questions = [
        {
        name: 'nomePersonagem',
        type: 'input',
        message: 'Digite o nome do seu personagem:',
        validate: async function( value ) {
            personagem = await PersonagensManager.getPersonagemAtual(value);
            if(personagem){
                return true;
            } else {
                return 'Esse personagem não está cadastrado.';
            }
        }
        }
    ];
    return inquirer.prompt(questions);
    },
    prossegueAventuraPersonagem: async () => {    
        const questions = [
        {
            type: 'list',
            name: 'selecaoCaminho',
            message: 'Você está na famosa cidade dos ladrões, escolha para onde prosseguir.',
            choices: ['Praça dos negociantes'],
            default: 'Praça dos negociantes'
        }
        ];
        return inquirer.prompt(questions);
    }
};