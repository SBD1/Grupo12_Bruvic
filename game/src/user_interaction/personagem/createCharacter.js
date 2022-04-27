const clear = require('clear');
const rl = require('readline');

readline = rl.createInterface({
    input: process.stdin,
    output: process.stdout
});

var characterName;

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

const getCharacterName = () => {
    readline.question("Qual vai ser o nome do personagem:  ", function(answer) {
        characterName = answer;
        console.log(characterName);
    });
};

const createNewCharacter = async () => {
    buildTitle();
    console.log("----- Criação de personagem -----");
    console.log();
    await getCharacterName();
    console.log('Oh no');
};

module.exports = createNewCharacter;