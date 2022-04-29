const BlocosManager = require("../../models/bloco/blocos_manager");
const MapasManager = require("../../models/mapa/mapas_manager");
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
  var render = Array(mapa.altura + 1).fill(Array(mapa.largura + 1));

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
          chalk.bgRgb(256, 256, 256)(" "),
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

  renderMapa(render);
};

const loadMapa = async (id) => {
  const mapa = await MapasManager.get(id);
  const blocos = await BlocosManager.getAllFromMapa(mapa).then((res) => {
    return res;
  });

  return { blocos, mapa };
};

const buildNavigationOptions = () => {
  console.log("W - Cima");
  console.log(" ");
  console.log("2) Exit");
};

const handleInput = (value) => {
  console.log(value);
};

const getOption = () => {
  inquirer.prompt(optionQuestion).then((answer) => {
    const pressed = parseInt(answer[optionQuestionId]);
    handleInput(pressed);
    return pressed;
  });
};

const navigation = async () => {
  const { blocos, mapa } = await loadMapa(1);
  var pressed = "";

  while (pressed !== 2) {
    handleBlocos(blocos, mapa);
    buildNavigationOptions();
    pressed = getOption();
  }
};

module.exports = navigation;
