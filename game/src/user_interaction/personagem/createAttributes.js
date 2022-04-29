const inquirer = require('inquirer');
const PersonagensManager = require('../../models/personagens/personagens_manager');
const { buildGameTitle } = require('../common'); 

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

const contBuffQuestionId = 'contBuffOpt';
const contBuffQuestion = [
    {
        name: contBuffQuestionId,
        type: 'input',
        message: 'Tudo certo com os status!\nDigite qualquer tecla para continuar...',
        validate: function async ( value ) {
            return true;
        }
    },
];

const max = 21;
const min = 10;
const getRandomAtr = () => (Math.floor(Math.random() * (max - min) + min));



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
    console.log("O dado rolado para a sua destreza foi: " + dexValue);
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
    console.log("O dado rolado para a sua força foi: " + strValue);
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
    console.log("O dado rolado para a sua constituição foi: " + conValue);
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
    console.log("O dado rolado para a sua inteligência foi: " + intValue);
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
    console.log("O dado rolado para a sua sabedoria foi: " + wisValue);
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
    console.log("O dado rolado para o seu carisma foi: " + chaValue);
};

const createAttributes = async (charName, charClass, charRace) => {
    const characterName = charName;
    const characterRace = charRace;
    const characterClass = charClass;

    var buffDex = 0;
    var buffStr = 0;
    var buffCon = 0;
    var buffInt = 0;
    var buffWis = 0;
    var buffCha = 0;
    
    if (characterRace == 'Humano') {
        buffDex = 1;
        buffStr = 1;
        buffCon = 1;
        buffInt = 1;
        buffWis = 1;
        buffCha = 1;
    }
    if (characterRace == 'Anao') {
        buffStr = 3;
        buffCon = 3;
    }
    if (characterRace == 'MeioElfo') {
        buffDex = 3;
        buffWis = 3;
    }
    if (characterRace == 'Draconato') {
        buffInt = 3;
        buffCha = 3;
    }

    var charLife ;
    var moneyAmount;
    if (characterClass == 'Guerreiro') {
        charLife = 32;
        moneyAmount = 150;
    } 
    if (characterClass == 'Clerigo') {
        charLife = 24;
        moneyAmount = 200;
    }
    if (characterClass == 'Mago'){
        charLife = 16;
        moneyAmount = 250;
    } 

    buildGameTitle();
    console.log();
    console.log("---------------------------------");
    console.log('O nome do seu personagem é:        ' + characterName);
    console.log('A raça do seu personagem é:        ' + characterRace);
    console.log('A classe do seu personagem é:      ' + characterClass);
    console.log('A vida do seu personagem é de:     ' + charLife);
    console.log('Sua quantidade de moedas de ouro:  ' + moneyAmount);
    console.log("---------------------------------");
    console.log();
    console.log('Agora é necessário que você defina o valor de seus atributos.');
    console.log('Será randomizado um valor entre 10 e 20 (como se você estivesse rolando um d20),');
    console.log('você tem a opção de aceitar a rolagem ou então, caso prefira, "rolar" uma segunda vez.');
    await getDex();
    await getStr();
    await getCon();
    const armorClass = 10 + Math.floor((conValue - 10) / 2);
    console.log("E a sua classe de armadura é de:      " + armorClass);
    await getInt();
    await getWis();
    await getCha();

    console.log();
    console.log();
    console.log("----------------------------------------------");
    console.log('O nome do seu personagem é:            ' + characterName);
    console.log('A raça do seu personagem é:            ' + characterRace);
    console.log('A classe do seu personagem é:          ' + characterClass);
    console.log('A vida do seu personagem é de:         ' + charLife);
    console.log('A classe de armadura é de:             ' + armorClass);
    console.log('Sua quantidade de moedas de ouro:      ' + moneyAmount);
    console.log('A destreza do seu personagem é de:     ' + dexValue + ' + ' + buffDex);
    console.log('A força do seu personagem é de:        ' + strValue + ' + ' + buffStr);
    console.log('A constituição do seu personagem é de: ' + conValue + ' + ' + buffCon);
    console.log('A inteligência do seu personagem é de: ' + intValue + ' + ' + buffInt);
    console.log('A sabedoria do seu personagem é de:    ' + wisValue + ' + ' + buffWis);
    console.log('O carisma do seu personagem é de:      ' + chaValue + ' + ' + buffCha);
    console.log("----------------------------------------------");
    console.log();

    const values = {
        vida: charLife,
        experiencia: 0,
        nivel: 1,
        nome: charName,
        destreza: dexValue,
        forca: strValue,
        constituicao: conValue,
        carisma: chaValue,
        sabedoria: wisValue,
        inteligencia: intValue,
        classe_de_armadura: armorClass,
        montante: moneyAmount,
        raca: characterRace, 
        classe: characterClass,
    };

    await inquirer.prompt(contBuffQuestion);
    await PersonagensManager.savePersonagem(values);
   // chamar set de habilidades
};

module.exports = createAttributes;