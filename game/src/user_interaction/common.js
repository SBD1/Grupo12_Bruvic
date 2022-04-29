const clear = require("clear");

const buildGameTitle = () => {
  clear();
  console.log();
  console.log();
  console.log(
    "▀█████████▄     ▄████████ ███    █▄   ▄█    █▄   ▄█   ▄████████"
  );
  console.log(
    "  ███    ███   ███    ███ ███    ███ ███    ███ ███  ███    ███"
  );
  console.log("  ███    ███   ███    ███ ███    ███ ███    ███ ███▌ ███    █▀");
  console.log(" ▄███▄▄▄██▀   ▄███▄▄▄▄██▀ ███    ███ ███    ███ ███▌ ███ ");
  console.log("▀▀███▀▀▀██▄  ▀▀███▀▀▀▀▀   ███    ███ ███    ███ ███▌ ███ ");
  console.log("  ███    ██▄ ▀███████████ ███    ███ ███    ███ ███  ███    █▄");
  console.log(
    "  ███    ███   ███    ███ ███    ███ ███    ███ ███  ███    ███"
  );
  console.log("▄█████████▀    ███    ███ ████████▀   ▀██████▀  █▀   ████████▀");
  console.log("               ███    ███");
  console.log();
  console.log();
  console.log();
};

const cleanScreen = () => {
  clear();
  console.log();
};

module.exports = { buildGameTitle, cleanScreen };
