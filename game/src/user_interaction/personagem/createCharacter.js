const inquirer = require('inquirer');
const createAttributes = require('./createAttributes');
const { buildGameTitle } = require('../common'); 

var characterName;
var characterRace;
var characterClass;

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
    },
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

const classQuestionId = 'classOpt';
const classQuestion = [
    {
        name: classQuestionId,
        type: 'input',
        message: 'Escolha a classe do seu personagem: ',
        validate: async function (value) {
            const check = parseInt(value);
            return (isNaN(check) || check<1 || check>4) ?
            'A opção precisa ser um número entre 1 e 4' : true;
        }
    }
];



const capitalize = (str) => (str.charAt(0).toUpperCase() + str.slice(1));

const getCharacterName = async () => {
    const answer = await inquirer.prompt(nameQuestion);
    characterName = capitalize(answer[nameQuestionId].trim());
    
};

const chooseRace = async () => {
    const answer = await inquirer.prompt(raceQuestion);
    const opt = parseInt(answer[raceQuestionId]);
    var race;

    if (opt == 1)      race = 'Guerreiro';
    else if (opt == 2) race = 'Mago';
    else               race = 'Clerigo';

    characterRace = race;
};

const getRace = async () => {
    console.log();
    console.log();
    console.log("------ Selecione sua raça -------");
    console.log('1) Guerreiro');
    console.log('2) Mago');
    console.log('3) Clérigo');
    console.log();
    await chooseRace();
};

const chooseClass = async () => {
    const answer = await inquirer.prompt(classQuestion);
    const opt = parseInt(answer[classQuestionId]);
    var charClass;

    if (opt == 1)      charClass = 'Humano';
    else if (opt == 2) charClass = 'Anao';
    else if (opt == 3) charClass = 'MeioElfo';
    else               charClass = 'Draconato';

    characterClass = charClass;
}

const getCharClass = async () => {
    console.log();
    console.log();
    console.log("------ Selecione sua classe -----");
    console.log('1) Humano');
    console.log('2) Anão');
    console.log('3) Meio-Elfo');
    console.log('4) Draconato');
    console.log();
    await chooseClass();
};

const createNewCharacter = async () => {
    buildGameTitle();
    console.log("----- Criação de personagem -----");
    console.log();
    await getCharacterName();
    await getRace();
    await getCharClass();
    createAttributes(characterName, characterRace, characterClass);
};

module.exports = createNewCharacter;