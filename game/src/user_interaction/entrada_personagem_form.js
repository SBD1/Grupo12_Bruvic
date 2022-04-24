const inquirer = require('inquirer');
const chalk = require('chalk');
const PersonagensManager = require('../models/personagens/personagens_manager');

module.exports = {
    askPersonagemNome: () => {
    console.log(
        chalk.green(
            "Olá aventureire, bem vindo de volta!"
        )
        );
    const questions = [
        {
        name: 'name',
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
};