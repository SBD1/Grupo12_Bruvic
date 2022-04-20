
async function connect() {
    if (global.connection)
        return global.connection.connect();

    const { Pool } = require('pg');
    const pool = new Pool({
        connectionString: 'postgres://postgres:password@postgres:5432/sbd1'
    });

    //apenas testando a conexão
    const client = await pool.connect();
    console.log("Criou pool de conexões no PostgreSQL!");

    const res = await client.query('SELECT NOW()');
    console.log(res.rows[0]);
    client.release();

    //guardando para usar sempre o mesmo
    global.connection = pool;
    return pool.connect();
}

const fs = require('fs');

async function initDatabase (){
    console.log("entrou no init miseravi")
    const ddlScript = fs.readFileSync('./src/db/ddl_script.sql').toString();
    const client = await connect();
    client.query(ddlScript).then(() => {
        console.log("banco de dados populado com sucesso.")
        process.exit(0)

    });
}


exports.connect = connect; 
exports.initDatabase = initDatabase;