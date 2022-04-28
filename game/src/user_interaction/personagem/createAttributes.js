const clear = require('clear');
const inquirer = require('inquirer');

const validation = async (value) => {
    var newVal = value.trim();
    newVal = newVal.toUpperCase();
    const check = newVal.length;

    if (check < 1) return true;
    if (check > 1) return 'Resposta grande demais! Digite apenas "S" ou "N"';
    if (newVal!="S" && newVal!="N") return 'Caracter diferente! Digite apenas "S" ou "N"';
    return true;
};
const defaultMsg = 'Deseja aceitar este valor (S/n): ';

var dexValue;
const dexQuestionId = 'dexOpt';
const dexQuestion = [
    {
        name: dexQuestionId,
        type: 'input',
        message: defaultMsg,
        validate: validation
    },
];

var strValue;
const strQuestionId = 'strOpt';
const strQuestion = [
    {
        name: strQuestionId,
        type: 'input',
        message: defaultMsg,
        validate: validation
    },
];

var conValue;
const conQuestionId = 'conOpt';
const conQuestion = [
    {
        name: conQuestionId,
        type: 'input',
        message: defaultMsg,
        validate: validation
    },
];

var intValue;
const intQuestionId = 'intOpt';
const intQuestion = [
    {
        name: intQuestionId,
        type: 'input',
        message: defaultMsg,
        validate: validation
    },
];

var wisValue;
const wisQuestionId = 'wisOpt';
const wisQuestion = [
    {
        name: wisQuestionId,
        type: 'input',
        message: defaultMsg,
        validate: validation
    },
];

var chaValue;
const chaQuestionId = 'chaOpt';
const chaQuestion = [
    {
        name: chaQuestionId,
        type: 'input',
        message: defaultMsg,
        validate: validation
    },
];

const max = 21;
const min = 10;
const getRandomAtr = () => (Math.floor(Math.random() * (max - min) + min));

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

const handleDex = async (dexval) => {
    const answer = await inquirer.prompt(dexQuestion);
    var temp = answer[dexQuestionId];
    temp = temp.toUpperCase();
    if (temp == '') temp="S";

    if (temp == "S") dexValue = dexval;
    else dexValue = getRandomAtr();
}

const getDex = async () => {
    var temp = getRandomAtr();
    console.log();
    console.log("------------ Destreza -----------");
    console.log("O valor randomizado para a sua destreza foi de: " + temp);
    await handleDex(temp);
    console.log("Sua destreza será salva com o valor de: " + dexValue);
};

const handleStr = async (strval) => {
    const answer = await inquirer.prompt(strQuestion);
    var temp = answer[strQuestionId];
    temp = temp.toUpperCase();
    if (temp == '') temp="S";

    if (temp == "S") strValue = strval;
    else strValue = getRandomAtr();
}

const getStr = async () => {
    var temp = getRandomAtr();
    console.log();
    console.log("------------- Força ------------");
    console.log("O valor randomizado para a sua força foi de: " + temp);
    await handleStr(temp);
    console.log("Sua força será salva com o valor de: " + strValue);
};

const handleCon = async (conval) => {
    const answer = await inquirer.prompt(conQuestion);
    var temp = answer[conQuestionId];
    temp = temp.toUpperCase();
    if (temp == '') temp="S";

    if (temp == "S") conValue = conval;
    else conValue = getRandomAtr();
}

const getCon = async () => {
    var temp = getRandomAtr();
    console.log();
    console.log("------------- Constituição ------------");
    console.log("O valor randomizado para a sua constituição foi de: " + temp);
    await handleCon(temp);
    console.log("Sua constituição será salva com o valor de: " + conValue);
};

const handleInt = async (intval) => {
    const answer = await inquirer.prompt(intQuestion);
    var temp = answer[intQuestionId];
    temp = temp.toUpperCase();
    if (temp == '') temp="S";

    if (temp == "S") intValue = intval;
    else intValue = getRandomAtr();
}

const getInt = async () => {
    var temp = getRandomAtr();
    console.log();
    console.log("------------- Inteligência ------------");
    console.log("O valor randomizado para a sua inteligência foi de: " + temp);
    await handleInt(temp);
    console.log("Sua inteligência será salva com o valor de: " + intValue);
};

const handleWis = async (wisval) => {
    const answer = await inquirer.prompt(wisQuestion);
    var temp = answer[wisQuestionId];
    temp = temp.toUpperCase();
    if (temp == '') temp="S";

    if (temp == "S") wisValue = wisval;
    else wisValue = getRandomAtr();
}

const getWis = async () => {
    var temp = getRandomAtr();
    console.log();
    console.log("------------- Sabedoria ------------");
    console.log("O valor randomizado para a sua sabedoria foi de: " + temp);
    await handleWis(temp);
    console.log("Sua sabedoria será salva com o valor de: " + wisValue);
};

const handleCha = async (chaval) => {
    const answer = await inquirer.prompt(chaQuestion);
    var temp = answer[chaQuestionId];
    temp = temp.toUpperCase();
    if (temp == '') temp="S";

    if (temp == "S") chaValue = chaval;
    else chaValue = getRandomAtr();
}

const getCha = async () => {
    var temp = getRandomAtr();
    console.log();
    console.log("------------- Carisma ------------");
    console.log("O valor randomizado para o seu carisma foi de: " + temp);
    await handleCha(temp);
    console.log("Seu carisma será salvo com o valor de: " + chaValue);
};

const createAttributes = async (charName, charRace, charClass) => {
    const characterName = charName;
    const characterRace = charRace;
    const characterClass = charClass;

    var charLife;
    if (charRace == 'Guerreiro') charLife = 32;
    if (charRace == 'Clerigo') charLife = 24;
    if (charRace == 'Mago') charLife = 16;

    buildTitle();
    console.log();
    console.log("---------------------------------");
    console.log('O nome do seu personagem é:    ' + characterName);
    console.log('A raça do seu personagem é:    ' + characterRace);
    console.log('A classe do seu personagem é:  ' + characterClass);
    console.log('A vida do seu personagem é de: ' + charLife);
    console.log("---------------------------------");
    console.log();
    console.log('Agora é necessário que você defina o valor de seus atributos.');
    console.log('Será randomizado um valor entre 10 e 20 (como se você estivesse rolando um d20),');
    console.log('você tem a opção de aceitar a rolagem ou então, caso prefira, "rolar" uma segunda vez.');
    await getDex();
    await getStr();
    await getCon();
    await getInt();
    await getWis();
    await getCha();
};

module.exports = createAttributes;