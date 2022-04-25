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


async function choiceFromItemList(negociante, items) {
  console.log(
    chalk.green(
        `Essa é a loja de ${negociante.nome}. Ele dá as boas-vindas para todos os pechinchadores.`
    )
    );

    const clui = require('clui'),
     clc = require('cli-color'),
    Line = clui.Line;

    var headers = new Line()
      .padding(2)
      .column('Nome', 30, [clc.cyan])
      .column('Preço', 10, [clc.cyan])
      .column('Peso', 10, [clc.cyan])
      .fill();

  const items_choices = items.map((item) => { 
    item_name_line = new Line()
    .padding(2)
    .column(item.nome, 30, [clc.cyan])
    .column(String(item.preco), 10, [clc.cyan])
    .column(String(item.peso), 10, [clc.cyan])
    .fill();
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


