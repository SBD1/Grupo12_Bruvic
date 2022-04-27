const inquirer = require('inquirer');
const chalk = require('chalk');
const PersonagensManager = require('../../models/personagens/personagens_manager');
const PRACA_NEGOCIANTES = 'Praça dos negociantes';
const VISUALIZAR_MOCHILA = 'Visualizar minha mochila';

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
            choices: [PRACA_NEGOCIANTES, VISUALIZAR_MOCHILA],
            default: PRACA_NEGOCIANTES
        }
        ];
        return inquirer.prompt(questions);
    },
    PRACA_NEGOCIANTES: PRACA_NEGOCIANTES,
    VISUALIZAR_MOCHILA: VISUALIZAR_MOCHILA
};