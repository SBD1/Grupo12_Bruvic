const inquirer = require('inquirer');
const chalk = require('chalk');


const BACK_MENU = 'voltar para o menu anterior';

async function choiceFromNegocianteList(negociantes) {
  console.log(
    chalk.blue(
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


async function choiceFromItemList(items) {
  const Item = require('../../models/items/item');
  const headers = Item.cabecalhoTabela();

  const items_choices = items.map((item) => { 
    item_name_line = item.visualizarEmLinha();
    return {name: item_name_line.contents(), value: item, short: item.nome}
  });
  items_choices.push({name: BACK_MENU, value: BACK_MENU, short:BACK_MENU});

  const questions = [
  {
    type: 'list',
    name: 'selecaoItem',
    message: `Veja a lista de itens disponíveis para compra\n ${headers.contents()}`,
    choices: items_choices,
    default: BACK_MENU
  }
  ];
  return inquirer.prompt(questions);
}


module.exports = {
  choiceFromNegocianteList: choiceFromNegocianteList,
  choiceFromItemsList: choiceFromItemList,
  BACK_MENU: BACK_MENU
};


