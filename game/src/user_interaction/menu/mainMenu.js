const clear = require('clear');
const { exit } = require('process');
const inquirer = require('inquirer');
const createNewCharacter = require('../personagem/createCharacter');
const loadCharacter = require('../personagem/loadCharacter');
const addHabilidadeToPersonagem = require('../habilidades/addHabilidadeToPersonagem'); 
const { buildGameTitle } = require('../common'); 
const navigation = require("../mapa/renderMapa");
const PersonagensManager = require('../../models/personagens/personagens_manager');

const optionQuestionId = "mainMenuOpt";
const optionQuestion = [
  {
    name: optionQuestionId,
    type: "input",
    message: "Selecione a sua opção: ",
    validate: function (value) {
      const check = parseInt(value);
      return isNaN(check) || check < 1 || check > 3
        ? "A opção precisa ser um número entre 1 e 3"
        : true;
    },
  },
];

const storyQuestionId = "storyOpt";
const storyQuestion = [
  {
    name: storyQuestionId,
    type: "input",
    message: "Digite qualquer tecla para continuar...",
    validate: function (value) {
      return true;
    },
  },
];

const cleanScreen = () => {
  clear();
  console.log();
};

const tellStoryGame = async () => {
  cleanScreen();
  console.log("Bruvic é uma cidade dentro do continente de Bely-Krugg. Bely-Krugg é um ambiente extenso, na sua maioria composto por planícies");
  console.log("nevadas. O continente de Bely-krugg tem três grandes povos: os Filhos de Thok, os Sábios de Kou e os Seguidores de Brum, as três");
  console.log("grandes criaturas celestiais que criaram Bely-Krugg. Historicamente, as três entidades nunca tiveram uma relação pacífica ou ");
  console.log("amistosa, e assim a fizeram as três grandes tribos do continente.");
  console.log();
  console.log("Bruvic é uma cidade com uma temperatura mais elevada, ambiente raro em Bely-Krugg, e não está no território de nenhuma das três tribos.");
  console.log("Assim como a sua natureza política, as orientações culturais e religiosas da cidade são bastante variadas.")
  console.log();
  console.log("Bruvic é uma cidade portuária: é possível encontrar grandes portos, navios de todo o canto do mundo e as mais diversas mercadorias de todo o continente. Em sua");
  console.log("maioria, os cenários são compostos por grandes construções de madeira embasadas em estruturas de pier, que por sua vez também são construídas de madeira. Apesar");
  console.log("do cenário que remete bastante a portos piratas, a cidade apresenta pouca ou nenhuma hostilidade para com visitantes.")
  console.log("Pela cidade não possuir estratificação e uma notável neutralidade, em Bely-Krugg isso é uma característica ainda mais rara do que ser uma cidade quente, os povos do continente se reúnem");
  console.log("anualmente para celebrar um breve momento de paz política e militar e ainda realizar confraternizações religiosas. Tal evento é conhecido como a Procissão.");
  console.log();
  console.log("Atualmente você está na taverna em que você se hospedou. Você se encontra num bar com várias pessoas.");
  console.log();
  console.log("Você é mais um habitante de Bely-Krugg que se dirigiu a Bruvic para participar da Procissão. E tudo estava ocorrendo bem, até que...");
  console.log();
  console.log();
  console.log();
  await inquirer.prompt(storyQuestion);
};

const logTab = (line=1) => {
    for (var i=0; i<line; i++) console.log();
};

const buildMenuOptions = () => {
  console.log("1) Novo personagem");
  console.log("2) Carregar personagem salvo");
  console.log("3) Sair do jogo");
};

const getOption = () => {
  inquirer.prompt(optionQuestion).then((answer) => {
    const option = parseInt(answer[optionQuestionId]);
    handleInput(option);
  });
};

const handleInput = async (inp) => {
  if (inp == 1) {
    const newPersonagem = await createNewCharacter();
    const personagemWithHabilidade = await addHabilidadeToPersonagem(newPersonagem); 
    console.log(personagemWithHabilidade);
    cleanScreen();
    const personagemLocalizacao = await PersonagensManager.getPersonagemLocalizacao(newPersonagem);
    console.log(personagemLocalizacao);
    await tellStoryGame();

    navigation();
  }

  if (inp == 2) {
    loadCharacter();
  }

  if (inp == 3) {
    repeatablePrints();
    console.log("Obrigado por jogar!");
    logTab();
    exit(1);
  }
};

const repeatablePrints = () => {
  cleanScreen();
  logTab();
  buildGameTitle();
  logTab(3);
};

const buildMenu = () => {
  repeatablePrints();
  buildMenuOptions();
  logTab();
  getOption();
};

module.exports = { buildMenu };
