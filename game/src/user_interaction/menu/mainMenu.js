const clear = require("clear");
const { exit } = require("process");
const inquirer = require("inquirer");
const createNewCharacter = require("../personagem/createCharacter");
const loadCharacter = require("../personagem/loadCharacter");
const addHabilidadeToPersonagem = require("../habilidades/addHabilidadeToPersonagem");
const { buildGameTitle, cleanScreen } = require("../common");
const navigation = require("../mapa/renderMapa");
const PersonagensManager = require("../../models/personagens/personagens_manager");

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

const logTab = (line = 1) => {
  for (var i = 0; i < line; i++) console.log();
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
    // const personagemWithHabilidade = await addHabilidadeToPersonagem(
    //   newPersonagem
    // );
    const personagemLocalizacao =
      await PersonagensManager.getPersonagemLocalizacao(newPersonagem);

    console.log("");
    console.log("");
    console.log("LÁ VAMOS NÓS GRANDE AVENTUREIRO");
    console.log("");
    console.log(
      "Bruvic é uma cidade portuária: é possível encontrar grandes portos, navios de todo o canto do mundo e as mais diversas mercadorias de todo o continente. Em sua maioria, os cenários são compostos por grandes construções de madeira embasadas em estruturas de pier, que por sua vez também são constituídos de madeira. Apesar do cenário que remete bastante a portos piratas, a cidade apresenta pouca ou nenhuma hostilidade para com visitantes."
    );
    console.log("");
    console.log(
      "Pela cidade não possuir estratificação e uma notável neutralidade, em Bely-Krugg isso é uma característica ainda mais rara do que ser uma cidade quente, os povos do continente se reúnem anualmente para celebrar um breve momento de paz política, militar e ainda realizar confraternizações religiosas. Tal evento é conhecido como a Procissão. "
    );
    console.log("");
    console.log(
      "Você é mais um habitante de Bely-Krugg que se dirigiu a Bruvic para participar da Procissão. E tudo estava ocorrendo bem, até que..."
    );
    console.log("");
    console.log("");

    const location = await navigation(personagemLocalizacao);

    console.log("Obrigado por jogar!");
    await PersonagensManager.updatePersonagemLocalizacao(location);
    exit(0);
  }

  if (inp == 2) {
    const newPersonagem = await loadCharacter();
    const personagemLocalizacao =
      await PersonagensManager.getPersonagemLocalizacao(newPersonagem);

    const location = await navigation(personagemLocalizacao);

    console.log("Obrigado por jogar!");
    await PersonagensManager.updatePersonagemLocalizacao(location);
    exit(0);
  }

  if (inp == 3) {
    repeatablePrints();
    console.log("Obrigado por jogar!");
    logTab();
    exit(0);
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
