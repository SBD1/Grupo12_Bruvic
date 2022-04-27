const clear = require('clear');
const inquirer = require('inquirer');

var characterName;
var characterRace;

const nameQuestionId = 'nameOpt';
const nameQuestion = [
    {
        name: nameQuestionId,
        type: 'input',
        message: 'Digite o nome do seu personagem: ',
        validate: async function( value ) {
            const newVal = value.trim();
            const check = newVal.length;
            return check<1 ? 'O nome não pode ser vazio' : true; 
        }
    }
];

const raceQuestionId = 'raceOpt';
const raceQuestion = [
    {
        name: raceQuestionId,
        type: 'input',
        message: 'Escolha a raça do seu personagem: ',
        validate: async function (value) {
            const check = parseInt(value);
            return (isNaN(check) || check<1 || check>3) ?
            'A opção precisa ser um número entre 1 e 3' : true;
        }
    }
];

const buildTitle = () => {
    clear();
    console.log();
    console.log();
    console.log("▀█████████▄     ▄████████ ███    █▄   ▄█    █▄   ▄█   ▄████████");
    console.log("  ███    ███   ███    ███ ███    ███ ███    ███ ███  ███    ███");
    console.log("  ███    ███   ███    ███ ███    ███ ███    ███ ███▌ ███    █▀");
    console.log(" ▄███▄▄▄██▀   ▄███▄▄▄▄██▀ ███    ███ ███    ███ ███▌ ███ ");
    console.log("▀▀███▀▀▀██▄  ▀▀███▀▀▀▀▀   ███    ███ ███    ███ ███▌ ███ ");
    console.log("  ███    ██▄ ▀███████████ ███    ███ ███    ███ ███  ███    █▄");
    console.log("  ███    ███   ███    ███ ███    ███ ███    ███ ███  ███    ███");
    console.log("▄█████████▀    ███    ███ ████████▀   ▀██████▀  █▀   ████████▀")
    console.log("               ███    ███");   
    console.log();
    console.log();
    console.log();
};

const capitalize = (str) => (str.charAt(0).toUpperCase() + str.slice(1));

const getCharacterName = async () => {
    const answer = await inquirer.prompt(nameQuestion);
    characterName = capitalize(answer[nameQuestionId].trim());
};

const chooseRace = () => {
    inquirer.prompt(raceQuestion).then((answer) => {
        const opt = parseInt(answer[raceQuestionId]);
        var race;
        if (opt == 1) {
            race = 'Guerreiro';
        } else if (opt == 2) {
            race = 'Mago';
        } else {
            race = 'Clerigo';
        }

        characterRace = race;
        console.log(characterRace);
    });
}

const getRace = () => {
    // clear();
    console.log();
    console.log();
    console.log("------ Selecione sua raça -------");
    console.log('1) Guerreiro');
    console.log('2) Mago');
    console.log('3) Clérigo');
    console.log();
    chooseRace();
};

const getCharClass = () => {

};

const getAttributes = () => {};

const createNewCharacter = async () => {
    buildTitle();
    console.log("----- Criação de personagem -----");
    console.log();
    getCharacterName();
    getRace();
};

module.exports = createNewCharacter;