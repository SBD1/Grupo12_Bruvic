require('./db/db_config').connect(); 

const ItemsManager = require("./models/items/items_manager");

ItemsManager.get("adaga").then((res)=>{
    console.log("terminou de executar:");
    console.log(res);
})