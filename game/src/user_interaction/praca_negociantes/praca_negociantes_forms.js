// Bem vindo bolinha a praça dos negociantes, existem esses negociantes nas suas proximidades:
    // 1 - Homi da arma 
    // 2 - Homi da breja
    // Gostaria de negociar com algum deles? Digite o número, se não, digite 0

    // 1
    // O homi da arma possui esses items em sua posse:
    // 1 - item preço
    // 2- - item preço

    // você gostaria de comprar com o homi da arma? para olhar outras barracas, digite 0


const inquirer = require('inquirer');
const chalk = require('chalk');


const BACK_MENU = 'voltar para o menu anterior'

async function choiceFromNegocianteList(negociantes) {
  console.log(
    chalk.green(
        "Bem-vinde a praça dos negociantes, aqui você conseguirá encontrar de tudo!"
    )
    );
  const negociantes_nomes = negociantes.map((negociante) => { console.log(negociante.nome);return negociante.nome})
  negociantes_nomes.push(BACK_MENU);

  const questions = [
  {
    type: 'list',
    name: 'selecaoNegociante',
    message: 'Estes são os negociantes em suas proximidades, gostaria de conversar com algum deles?',
    choices: negociantes_nomes,
    default: BACK_MENU
  }
  ];
  return inquirer.prompt(questions);
}

module.exports = {
  choiceFromNegocianteList: choiceFromNegocianteList,
  BACK_MENU: BACK_MENU
};


