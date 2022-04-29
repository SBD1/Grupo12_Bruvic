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

const cleanScreen = () => {
  clear();
  console.log();
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
    // cleanScreen();
    await PersonagensManager.getPersonagemLocalizacao(newPersonagem);
    console.log("LÁ VAMOS NÓS GRANDE AVENTUREIRO");
    console.log("aqui explicação da história");

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
