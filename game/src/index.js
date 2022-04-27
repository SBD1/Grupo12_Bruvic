

// require('./db/db_config').connect().then(async (client) => {
//     ItemsManager.get("adaga").then((res) => {
//         console.log("terminou de executar:");
//         console.log(res);
//     });

//     const NegociantesManager = require("./models/negociantes/negociantes_manager");
//     NegociantesManager.getAll().then((res) => {
//         console.log("terminou de executar O GET ALL:");
//         console.log(res);
//     });
// });
const { buildMenu } = require('./user_interaction/menu/mainMenu');

buildMenu();
