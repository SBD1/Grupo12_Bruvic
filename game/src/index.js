require('./db/db_config').connect().then(async (client) => {
    const ItemsManager = require("./models/items/items_manager");
    ItemsManager.get("adaga").then((res) => {
        console.log("terminou de executar:");
        console.log(res);
    });

    const NegociantesManager = require("./models/negociantes/negociantes_manager");
    NegociantesManager.getAll().then((res) => {
        console.log("terminou de executar O GET ALL:");
        console.log(res);
    });
});

