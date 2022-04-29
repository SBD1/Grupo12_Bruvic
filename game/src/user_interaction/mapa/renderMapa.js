const BlocosManager = require("../../models/bloco/blocos_manager");
const MapasManager = require("../../models/mapa/mapas_manager");
const { cleanScreen } = require("../common");
const inquirer = require("inquirer");
const chalk = require("chalk");

const renderMapa = (render) => {
  console.log("");
  render.forEach((bloco_y) => {
    console.log("  " + bloco_y.join(""));
  });
  console.log("");
};

const handleBlocos = (blocos, mapa) => {
  var render = Array(mapa.altura + 1).fill(Array());

  blocos.forEach((bloco) => {
    switch (bloco.tipo) {
      case "wall":
        render[bloco.eixo_y] = [...render[bloco.eixo_y], chalk.gray("█")];
        break;
      case "floor":
        render[bloco.eixo_y] = [
          ...render[bloco.eixo_y],
          chalk.bgRgb(256, 256, 256)(" "),
        ];
        break;
      case "trap":
        render[bloco.eixo_y] = [
          ...render[bloco.eixo_y],
          chalk.bgWhiteBright(" "),
        ];
        break;
      case "npc":
        render[bloco.eixo_y] = [
          ...render[bloco.eixo_y],
          chalk.rgb(256, 256, 256).inverse("⍝"),
        ];
        break;
      case "door":
        render[bloco.eixo_y] = [
          ...render[bloco.eixo_y],
          chalk.white.bgRgb(75, 56, 33)("∘"),
        ];
        break;
      case "chest":
        render[bloco.eixo_y] = [
          ...render[bloco.eixo_y],
          chalk.black.bgRgb(256, 256, 256)("◨"),
        ];
        break;
      case "character":
        render[bloco.eixo_y] = [
          ...render[bloco.eixo_y],
          chalk.yellow.bgRgb(256, 256, 256)("●"),
        ];
        break;
      default:
        render[bloco.eixo_y] = [...render[bloco.eixo_y], "█"];
    }
  });

  return render;
};

const loadMapa = async (id) => {
  const mapa = await MapasManager.get(id);
  const blocos = await BlocosManager.getAllFromMapa(mapa).then((res) => {
    return res;
  });

  return { blocos, mapa };
};

const buildNavigationOptions = () => {
  console.log("w - Cima");
  console.log("a - Esquerda");
  console.log("s - Baixo");
  console.log("d - Direita");
  console.log(" ");
  console.log("2) Exit");
};

const optionQuestionId = "mapaOpt";

const optionQuestion = [
  {
    name: optionQuestionId,
    type: "input",
    message: "Selecione a sua opção: ",
  },
];

const validadeAction = (vertical, horizontal, render) => {
  if (render[vertical][horizontal] !== chalk.bgRgb(256, 256, 256)(" ")) {
    return false;
  }

  if (vertical < 0 || vertical > 48 || horizontal < 0 || horizontal > 48) {
    return false;
  }

  return true;
};

const handleInput = (value, render, personagem) => {
  var horizontal = personagem.eixo_x;
  var vertical = personagem.eixo_y;

  switch (value) {
    case "w":
      if (validadeAction(vertical - 1, horizontal, render)) {
        render[vertical][horizontal] = chalk.bgRgb(256, 256, 256)(" ");
        render[vertical - 1][horizontal] = chalk.yellow.bgRgb(
          256,
          256,
          256
        )("●");
        personagem.eixo_y = personagem.eixo_y - 1;
      } else {
        console.log("Você não pode ir nessa direção");
      }
      break;
    case "s":
      if (validadeAction(vertical + 1, horizontal, render)) {
        render[vertical][horizontal] = chalk.bgRgb(256, 256, 256)(" ");
        render[vertical + 1][horizontal] = chalk.yellow.bgRgb(
          256,
          256,
          256
        )("●");
        personagem.eixo_y = personagem.eixo_y + 1;
      } else {
        console.log("Você não pode ir nessa direção");
      }
      break;
    case "a":
      if (validadeAction(vertical, horizontal - 1, render)) {
        render[vertical][horizontal] = chalk.bgRgb(256, 256, 256)(" ");
        render[vertical][horizontal - 1] = chalk.yellow.bgRgb(
          256,
          256,
          256
        )("●");
        personagem.eixo_x = personagem.eixo_x - 1;
      } else {
        console.log("Você não pode ir nessa direção");
      }
      break;
    case "d":
      if (validadeAction(vertical, horizontal + 1, render)) {
        render[vertical][horizontal] = chalk.bgRgb(256, 256, 256)(" ");
        render[vertical][horizontal + 1] = chalk.yellow.bgRgb(
          256,
          256,
          256
        )("●");
        personagem.eixo_x = personagem.eixo_x + 1;
      } else {
        console.log("Você não pode ir nessa direção");
      }
      break;
    default:
      console.log("Digite para se mover ou para sair!");
  }

  return { render, personagem };
};

const getOption = async ({ render, personagem }) => {
  const answer = await inquirer.prompt(optionQuestion);

  const pressed = answer[optionQuestionId];
  var options = handleInput(pressed, render, personagem);

  return { pressed, options };
};

const navigation = async (personagem) => {
  var { blocos, mapa } = await loadMapa(personagem.mapa);
  var render = handleBlocos(blocos, mapa);

  var pressed = "";

  var options = {
    render: render,
    personagem: personagem,
  };

  while (pressed !== 2) {
    cleanScreen();
    renderMapa(options.render);
    buildNavigationOptions();
    var { pressed, options } = await getOption(options);
  }
};

module.exports = navigation;
