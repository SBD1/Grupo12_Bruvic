async function connect() {
    if (global.connection)
        return global.connection.connect();

    const { Pool } = require('pg');
    const pool = new Pool({
        connectionString: 'postgres://postgres:password@postgres:5432/sbd1'
    });

    //apenas testando a conexão
    const client = await pool.connect();

    const res = await client.query('SELECT NOW()');
    client.release();

    //guardando para usar sempre o mesmo
    global.connection = pool;
    return pool.connect();
}

const fs = require('fs');

async function executeSqlFile (fileSource, successMessage) {
    const scriptFile = fs.readFileSync(fileSource).toString();
    const client = await connect();
    client.query(scriptFile).then(() => {
        console.log(successMessage)
        process.exit(0);

    });
}

async function initDatabase (){
    executeSqlFile ('./src/db/ddl_script.sql', "banco de dados criado com sucesso.");
}

async function populateDatabase (){
    executeSqlFile ('./src/db/dml_script.sql', "banco de dados populado com sucesso.");
}



exports.connect = connect; 
exports.initDatabase = initDatabase;
exports.populateDatabase = populateDatabase;