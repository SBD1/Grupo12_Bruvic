const clear = require('clear');

const buildGameTitle = () => {
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

module.exports = {buildGameTitle};