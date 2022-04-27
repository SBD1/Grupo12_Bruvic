const chalk = require('chalk');
const clear = require('clear');
const figlet = require('figlet');
const personagemControl = require('./user_interaction/personagem_loc/personagem_loc_control');


clear();

console.log(
  chalk.blue(
    figlet.textSync('Bruvic', { horizontalLayout: 'full' })
  )
);

personagemControl.run();