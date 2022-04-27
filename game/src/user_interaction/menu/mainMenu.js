const clear = require('clear');
const { exit } = require('process');
const inquirer = require('inquirer');
const createNewCharacter = require('../personagem/createCharacter');

const optionQuestionId = 'mainMenuOpt';

const optionQuestion = [
    {
        name: optionQuestionId,
        type: 'input',
        message: 'Selecione a sua opção: ',
        validate: async function( value ) {
            return true;
        }
    }
];

const cleanScreen = () => {
    clear();
    console.log();
};

const buildGameTitle = () => {
    console.log("▀█████████▄     ▄████████ ███    █▄   ▄█    █▄   ▄█   ▄████████");
    console.log("  ███    ███   ███    ███ ███    ███ ███    ███ ███  ███    ███");
    console.log("  ███    ███   ███    ███ ███    ███ ███    ███ ███▌ ███    █▀");
    console.log(" ▄███▄▄▄██▀   ▄███▄▄▄▄██▀ ███    ███ ███    ███ ███▌ ███ ");
    console.log("▀▀███▀▀▀██▄  ▀▀███▀▀▀▀▀   ███    ███ ███    ███ ███▌ ███ ");
    console.log("  ███    ██▄ ▀███████████ ███    ███ ███    ███ ███  ███    █▄");
    console.log("  ███    ███   ███    ███ ███    ███ ███    ███ ███  ███    ███");
    console.log("▄█████████▀    ███    ███ ████████▀   ▀██████▀  █▀   ████████▀")
    console.log("               ███    ███");                                   
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

const handleInput = (inp) => {
    if (isNaN(inp) || inp<1 || inp>3) {
        buildMenuWithValidation();
    }

    if (inp == 1) {
        createNewCharacter();
    }

    if (inp == 2) {
        console.log("2");
        // chooseCharacter();
    }

    if (inp == 3) {
        repeatablePrints();
        console.log("Obrigado por jogar!");
        logTab();
        exit(1);
    };
};

const repeatablePrints = () => {
    cleanScreen();
    logTab();
    buildGameTitle();
    logTab(3);
};

const buildMenuWithValidation = () => {
    repeatablePrints();
    buildMenuOptions();
    logTab();
    console.log('A opção precisa ser um número entre 1 e 3');
    getOption();
};

const buildMenu = () => {
    repeatablePrints();
    buildMenuOptions();
    logTab();
    getOption();
};

module.exports = { buildMenu };