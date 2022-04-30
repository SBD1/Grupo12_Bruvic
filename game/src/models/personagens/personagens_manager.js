const db = require("../../db/db_config");
const Personagem = require("./personagem");
const HabilidadeManager = require("../habilidade/habilidade_manager");
const PersonagemLocalizacao = require("./personagemLocalizacao");

module.exports = class PersonagensManager {
  static async getAllPersonagem() {
    const client = await db.connect();
    const querySelectByName = `SELECT DISTINCT * from DefinicaoPersonagem def LEFT JOIN Personagem personagem  ON personagem.id = def.personagem;`;
    const response = await client.query(querySelectByName);
    const personagens_promise = response.rows.map(async (personagem_info) => {
      const personagem = new Personagem(
        personagem_info.id,
        personagem_info.vida,
        personagem_info.nome,
        personagem_info.destreza,
        personagem_info.forca,
        personagem_info.constituicao,
        personagem_info.carisma,
        personagem_info.sabedoria,
        personagem_info.inteligencia,
        personagem_info.montante,
        personagem_info.raca,
        personagem_info.classe,
        personagem_info.classe_de_armadura,
        personagem_info.experiencia,
        personagem_info.nivel
      );
      const mochila = await client.query(
        `SELECT * FROM MOCHILA WHERE personagem = ${personagem_info.id}`
      );
      const mochila_info = mochila.rows[0];
      if (mochila_info) {
        personagem.setMochilaInfo(mochila_info.capacidade, mochila_info.id);
      }

      if (personagem.classe === "Clerigo") {
        const cura = await client.query(
          `SELECT * FROM ClerigoCura WHERE clerigo = ${personagem.id}`
        );
        const cura_info_promisses = cura.rows.map((cura_info) =>
          HabilidadeManager.getByName(cura_info.cura)
        );
        const cura_info = await Promise.all(cura_info_promisses);
        if (cura_info && cura_info.length > 0) {
          personagem.habilidades = [...personagem.habilidades, ...cura_info];
        }

        const truque = await client.query(
          `SELECT * FROM ClerigoTruque WHERE clerigo = ${personagem.id}`
        );
        const truque_info_promisses = truque.rows.map((truque_info) =>
          HabilidadeManager.getByName(truque_info.truque)
        );
        const truque_info = await Promise.all(truque_info_promisses);
        if (truque_info && truque_info.length > 0) {
          personagem.habilidades = [...personagem.habilidades, ...truque_info];
        }
      }

      if (personagem.classe === "Mago") {
        const magia = await client.query(
          `SELECT * FROM MagoMagia WHERE mago = ${personagem.id}`
        );
        const magia_info_promisses = magia.rows.map((magia_info) =>
          HabilidadeManager.getByName(magia_info.magia)
        );
        const magia_info = await Promise.all(magia_info_promisses);
        if (magia_info && magia_info.length > 0) {
          personagem.habilidades = [...personagem.habilidades, ...magia_info];
        }
      }
      return personagem;
    });
    const personagens = await Promise.all(personagens_promise);
    client.release();
    return personagens;
  }

  static async getById(id) {
    const client = await db.connect();
    const querySelectByName = `SELECT DISTINCT * from DefinicaoPersonagem def LEFT JOIN Personagem personagem  ON personagem.id = def.personagem WHERE personagem.id = ${id};`;

    const response = await client.query(querySelectByName);
    const personagem_info = response.rows[0];

    if (!personagem_info) {
      client.release();
      return;
    }

    const personagem = new Personagem(
      personagem_info.id,
      personagem_info.vida,
      personagem_info.nome,
      personagem_info.destreza,
      personagem_info.forca,
      personagem_info.constituicao,
      personagem_info.carisma,
      personagem_info.sabedoria,
      personagem_info.inteligencia,
      personagem_info.montante,
      personagem_info.raca,
      personagem_info.classe,
      personagem_info.classe_de_armadura,
      personagem_info.experiencia,
      personagem_info.nivel
    );

    const mochila = await client.query(
      `SELECT * FROM MOCHILA WHERE personagem = ${personagem_info.id}`
    );
    const mochila_info = mochila.rows[0];
    if (mochila_info) {
      personagem.setMochilaInfo(mochila_info.capacidade, mochila_info.id);
    }

    if (personagem.classe === "Clerigo") {
      const cura = await client.query(
        `SELECT * FROM ClerigoCura WHERE clerigo = ${personagem.id}`
      );
      const cura_info_promisses = cura.rows.map((cura_info) =>
        HabilidadeManager.getByName(cura_info.cura)
      );
      const cura_info = await Promise.all(cura_info_promisses);
      if (cura_info && cura_info.length > 0) {
        personagem.habilidades = [...personagem.habilidades, ...cura_info];
      }

      const truque = await client.query(
        `SELECT * FROM ClerigoTruque WHERE clerigo = ${personagem.id}`
      );
      const truque_info_promisses = truque.rows.map((truque_info) =>
        HabilidadeManager.getByName(truque_info.truque)
      );
      const truque_info = await Promise.all(truque_info_promisses);
      if (truque_info && truque_info.length > 0) {
        personagem.habilidades = [...personagem.habilidades, ...truque_info];
      }
    }

    if (personagem.classe === "Mago") {
      const magia = await client.query(
        `SELECT * FROM MagoMagia WHERE mago = ${personagem.id}`
      );
      const magia_info_promisses = magia.rows.map((magia_info) =>
        HabilidadeManager.getByName(magia_info.magia)
      );
      const magia_info = await Promise.all(magia_info_promisses);
      if (magia_info && magia_info.length > 0) {
        personagem.habilidades = [...personagem.habilidades, ...magia_info];
      }
    }

    client.release();
    return personagem;
  }

  static async addHabiliadesToPersonagem(personagem, habilidade) {
    const client = await db.connect();

    if (!personagem.classe || !habilidade.tipo) return;

    let query;
    if (personagem.classe === "Clerigo" && habilidade.tipo === "Cura") {
      query = "ClerigoCura(clerigo, cura)";
    }

    if (personagem.classe === "Clerigo" && habilidade.tipo === "Truque") {
      query = "ClerigoTruque(clerigo, truque)";
    }

    if (personagem.classe === "Mago" && habilidade.tipo === "Magia") {
      query = "MagoMagia(mago, magia)";
    }
    const result = await client.query(
      `INSERT INTO ${query} VALUES (${personagem.id}, '${habilidade.nome}');`
    );
    console.log(result);
    client.release();
    personagem.setNewHabilidade(habilidade);
    return personagem;
  }

  static async savePersonagem(values) {
    const client = await db.connect();
    const {
      vida,
      experiencia,
      nivel,
      nome,
      destreza,
      forca,
      constituicao,
      carisma,
      sabedoria,
      inteligencia,
      classe_de_armadura,
      montante,
    } = values;
    const id = Math.floor(Math.random() * 1000000);
    const saveQuery = `INSERT INTO Personagem(
                                                    id,
                                                    vida,
                                                    experiencia,
                                                    nivel,
                                                    nome,
                                                    destreza,
                                                    forca,
                                                    constituicao,
                                                    carisma,
                                                    sabedoria,
                                                    inteligencia,
                                                    classe_de_armadura,
                                                    montante) 
                                                    VALUES                                                   
                                                    (
                                                     ${id},
                                                     ${vida},
                                                     ${experiencia},
                                                     ${nivel},
                                                     '${nome}',
                                                     ${destreza},
                                                     ${forca},
                                                     ${constituicao},
                                                     ${carisma},
                                                     ${sabedoria},
                                                     ${inteligencia},
                                                     ${classe_de_armadura},
                                                     ${montante});`;

    await client.query(saveQuery);

    client.release();

    const { raca, classe } = values;
    const saveDefinicaoPersonagemQuery = `INSERT INTO DefinicaoPersonagem(personagem, raca, classe) VALUES (${id}, '${raca}','${classe}')`;
    await client.query(saveDefinicaoPersonagemQuery);
    return new Personagem(
      id,
      vida,
      nome,
      destreza,
      forca,
      constituicao,
      carisma,
      sabedoria,
      inteligencia,
      montante,
      raca,
      classe,
      classe_de_armadura,
      experiencia,
      nivel
    );
  }

  static async getPersonagemLocalizacao(personagem) {
    const client = await db.connect();
    const queryText = `SELECT * FROM PersonagemLocalizacao WHERE personagem = ${personagem.id};`;
    const queryResult = await client.query(queryText);
    const personagemLocalizacao = queryResult.rows[0];
    client.release();
    return new PersonagemLocalizacao(
      personagemLocalizacao.personagem,
      personagemLocalizacao.eixo_x,
      personagemLocalizacao.eixo_y,
      personagemLocalizacao.mapa
    );
  }

  static async updatePersonagemLocalizacao(personagem) {
    const client = await db.connect();
    const queryText = `UPDATE PersonagemLocalizacao SET eixo_y = ${personagem.eixo_y}, eixo_x = ${personagem.eixo_x} WHERE personagem = ${personagem.personagem};`;
    await client.query(queryText);
    client.release();
  }
};
