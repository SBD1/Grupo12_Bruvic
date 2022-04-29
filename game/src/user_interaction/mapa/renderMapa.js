const BlocosManager = require("../../models/bloco/blocos_manager");
const MapasManager = require("../../models/mapa/mapas_manager");
const chalk = require("chalk");

const loadMapa = async (id) => {
  const mapa = await MapasManager.get(id);
  const blocos = await BlocosManager.getAllFromMapa(mapa).then((res) => {
    return res;
  });

  var render = Array(mapa.altura).fill(Array(mapa.largura));

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

  console.log("");
  render.forEach((bloco_y) => {
    console.log("  " + bloco_y.join(""));
  });
  console.log("");

  return blocos;
};

module.exports = loadMapa;
