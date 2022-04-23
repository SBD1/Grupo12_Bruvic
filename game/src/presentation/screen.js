var readline = require('readline');

var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout

});

const cleanScreen = () => console.clear();

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
    console.log("1) Novo jogo");
    console.log("2) Carregar jogo salvo");
    console.log("3) Sair do jogo");
};

const getOption = () => {
    rl.question("Selecione a opção:  ", function(answer) {
        console.log(answer);
        rl.close();
     });
};

const buildMenu = () => {
    cleanScreen();
    logTab();
    buildGameTitle();
    logTab(3);
    buildMenuOptions();
    logTab();
    getOption();
};

buildMenu();