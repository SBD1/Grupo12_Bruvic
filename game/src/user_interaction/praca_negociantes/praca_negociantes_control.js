const forms = require("./praca_negociantes_forms");
const ItemsManager = require("../../models/items/items_manager");
const chalk = require("chalk");
const Mochila = require("../../models/mochila");

async function negocianteFlow(personagem, negociante) {
  const itemsNegociante = await ItemsManager.getAllFromNegociante(negociante);
  console.log(chalk.red(`Você tem ${personagem.montante} moedas para usar.`));
  const formItem = await forms.choiceFromItemsList(itemsNegociante);
  itemsFlow(formItem, personagem, negociante);
}

async function itemsFlow(formItem, personagem, negociante) {
  console.log(formItem, personagem, negociante);

  if (formItem.selecaoItem == forms.BACK_MENU) {
    return false;
  } else {
    const usoMochila = Mochila.usoMochila(
      await ItemsManager.getAllFromPersonagem(personagem)
    );
    await formItem.selecaoItem.vender(personagem, usoMochila);
    await negocianteFlow(personagem, negociante);
  }
}

module.exports = {
  negocianteFlow: negocianteFlow,
};
