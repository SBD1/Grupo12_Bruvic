-- Arquivo habilidades.sql

CREATE TABLE IF NOT EXISTS Habilidade (
    nome VARCHAR PRIMARY KEY,
    descricao VARCHAR NOT NULL,  
    nivel INTEGER NOT NULL
); 

CREATE TABLE IF NOT EXISTS Habilidade_Tipo (
    nome VARCHAR PRIMARY KEY REFERENCES Habilidade (nome) ON DELETE CASCADE,
    tipo VARCHAR NOT NULL CHECK (tipo in ('Ataque', 'Cura', 'Truque', 'Magia', ''))
); 

CREATE TABLE IF NOT EXISTS Ataque (
    habilidade VARCHAR PRIMARY KEY REFERENCES Habilidade (nome) ON DELETE CASCADE,
    dano INTEGER NOT NULL
); 

CREATE TABLE IF NOT EXISTS Cura (
    habilidade VARCHAR PRIMARY KEY REFERENCES Habilidade (nome) ON DELETE CASCADE,
    recuperacao INTEGER NOT NULL
); 

CREATE TABLE IF NOT EXISTS Truque (
    habilidade VARCHAR PRIMARY KEY REFERENCES Habilidade (nome) ON DELETE CASCADE,
    stun INTEGER NOT NULL
); 

CREATE TABLE IF NOT EXISTS Magia (
    habilidade VARCHAR PRIMARY KEY REFERENCES Habilidade (nome) ON DELETE CASCADE,
    modificador INTEGER NOT NULL
); 

-- Arquivo mapa.sql
CREATE TABLE IF NOT EXISTS Mapa (
    id SERIAL PRIMARY KEY,
    largura INTEGER NOT NULL,
    altura INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Bloco (
    eixo_x INTEGER NOT NULL,
    eixo_y INTEGER NOT NULL,
    mapa INTEGER REFERENCES Mapa (id),
    tipo VARCHAR NOT NULL,
    spawn_item BOOLEAN,
    PRIMARY KEY (eixo_x, eixo_y, mapa)
);

CREATE TABLE IF NOT EXISTS Armadilha (
    acao BOOLEAN NOT NULL,
    eixo_x INTEGER NOT NULL,
    eixo_y INTEGER NOT NULL,
    mapa INTEGER NOT NULL,
    FOREIGN KEY (eixo_x, eixo_y, mapa) REFERENCES Bloco (eixo_x, eixo_y, mapa),
    PRIMARY KEY (eixo_x, eixo_y, mapa)
);

CREATE TABLE IF NOT EXISTS NPC (
    id SERIAL PRIMARY KEY,
    eixo_x INTEGER NOT NULL UNIQUE,
    eixo_y INTEGER NOT NULL UNIQUE,
    mapa INTEGER NOT NULL UNIQUE,
    tipo VARCHAR NOT NULL,
    vida INTEGER NOT NULL,
    dano INTEGER,
    FOREIGN KEY (eixo_x, eixo_y, mapa) REFERENCES Bloco (eixo_x, eixo_y, mapa)
);

CREATE TABLE IF NOT EXISTS Negociante (
    npc INTEGER PRIMARY KEY REFERENCES NPC (id), 
    montante FLOAT NOT NULL
);

-- Arquivo personagens.sql


CREATE TABLE IF NOT EXISTS Personagem (
    id SERIAL PRIMARY KEY,
    vida SMALLINT NOT NULL ,
    experiencia INTEGER,
    nivel SMALLINT,
    nome VARCHAR NOT NULL,
    destreza SMALLINT NOT NULL,
    forca SMALLINT NOT NULL,
    constituicao SMALLINT NOT NULL,
    carisma SMALLINT NOT NULL,
    sabedoria SMALLINT NOT NULL,
    inteligencia SMALLINT NOT NULL,
    classe_de_armadura SMALLINT,
    montante FLOAT NOT NULL
);

CREATE TABLE IF NOT EXISTS Humano (
    personagem INTEGER PRIMARY KEY REFERENCES Personagem (id) ON DELETE CASCADE,
    bonus_destreza SMALLINT,
    bonus_forca SMALLINT,
    bonus_constituicao SMALLINT,
    bonus_carisma SMALLINT,
    bonus_sabedoria SMALLINT,
    bonus_inteligencia SMALLINT,
    CONSTRAINT checa_atributos_humano 
    CHECK (bonus_destreza + bonus_forca + bonus_constituicao + bonus_carisma + bonus_sabedoria + bonus_inteligencia = 6)
);

CREATE TABLE IF NOT EXISTS Anao (
    personagem INTEGER PRIMARY KEY REFERENCES Personagem (id) ON DELETE CASCADE,
    bonus_forca SMALLINT,
    bonus_constituicao SMALLINT,
    CONSTRAINT checa_atributos_anao 
    CHECK (bonus_forca + bonus_constituicao = 6)
);

CREATE TABLE IF NOT EXISTS MeioElfo (
    personagem INTEGER PRIMARY KEY REFERENCES Personagem (id) ON DELETE CASCADE,
    bonus_sabedoria SMALLINT,
    bonus_destreza SMALLINT,
    CONSTRAINT checa_atributos_meio_elfo 
    CHECK (bonus_sabedoria + bonus_destreza = 6)
);

CREATE TABLE IF NOT EXISTS Draconato (
    personagem INTEGER PRIMARY KEY REFERENCES Personagem (id) ON DELETE CASCADE,
    bonus_carisma SMALLINT,
    bonus_inteligencia SMALLINT,
    CONSTRAINT checa_atributos_draconato 
    CHECK (bonus_carisma + bonus_inteligencia = 6)
);

CREATE TABLE IF NOT EXISTS Guerreiro (
    personagem INTEGER PRIMARY KEY REFERENCES Personagem (id) ON DELETE CASCADE,
    bonus_classe_armadura SMALLINT,
    bonus_ataque SMALLINT,
    CONSTRAINT checa_atributos_guerreiro 
    CHECK (bonus_classe_armadura + bonus_ataque = 8)
);

CREATE TABLE IF NOT EXISTS Mago (
    personagem INTEGER PRIMARY KEY REFERENCES Personagem (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Clerigo (
    personagem INTEGER PRIMARY KEY REFERENCES Personagem (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS MagoMagia (
    mago INTEGER PRIMARY KEY REFERENCES Mago (personagem),
    magia VARCHAR REFERENCES Magia (habilidade)
);

CREATE TABLE IF NOT EXISTS ClerigoTruque (
   clerigo INTEGER REFERENCES Clerigo (personagem),
   truque VARCHAR REFERENCES Truque (habilidade)
);

CREATE TABLE IF NOT EXISTS ClerigoCura (
    clerigo INTEGER REFERENCES Clerigo (personagem),
    cura VARCHAR REFERENCES Cura (habilidade)
);

CREATE TABLE IF NOT EXISTS DefinicaoPersonagem(
    personagem INTEGER REFERENCES Personagem (id),
    raca VARCHAR,
    classe VARCHAR
);


-- Arquivo items.sql

CREATE TABLE IF NOT EXISTS Mochila (
    id SERIAL PRIMARY KEY,
    capacidade FLOAT NOT NULL,
    personagem INTEGER REFERENCES Personagem (id)
);

CREATE TABLE IF NOT EXISTS Item (
    nome VARCHAR PRIMARY KEY,
    preco INTEGER NOT NULL,
    peso FLOAT NOT NULL,
    eixo_x INTEGER,
    eixo_y INTEGER,
    mapa INTEGER,
    mochila INTEGER REFERENCES Mochila (id),
    negociante INTEGER REFERENCES Negociante (npc),
    FOREIGN KEY (eixo_x, eixo_y, mapa) REFERENCES Bloco (eixo_x, eixo_y, mapa)
);

CREATE TABLE IF NOT EXISTS ItemTipo (
    item VARCHAR PRIMARY KEY REFERENCES Item (nome),
    tipo VARCHAR
);

CREATE TABLE IF NOT EXISTS Bugiganga (
    item_tipo VARCHAR PRIMARY KEY REFERENCES ItemTipo (item),
    descricao VARCHAR(231) NOT NULL,
    funcao VARCHAR,
    eh_item_historia BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS Moeda (
    item_tipo VARCHAR PRIMARY KEY REFERENCES ItemTipo (item)
);

CREATE TABLE IF NOT EXISTS Pocao (
    item_tipo VARCHAR PRIMARY KEY REFERENCES ItemTipo (item),
    recuperacao INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Equipamento (
    item_tipo VARCHAR PRIMARY KEY REFERENCES ItemTipo (item),
    durabilidade INTEGER NOT NULL,
    classe_de_armadura INTEGER,
    dano INTEGER,
    eh_armadura BOOLEAN NOT NULL,
    eh_arma BOOLEAN NOT NULL,
    CONSTRAINT valida_equipamento
    CHECK ((eh_arma=TRUE AND eh_armadura=FALSE AND classe_de_armadura=0) OR (eh_arma=FALSE AND eh_armadura=TRUE AND dano=0))
);

CREATE TABLE IF NOT EXISTS Venda (
    negociante INTEGER REFERENCES Negociante (npc),
    item VARCHAR REFERENCES Item (nome),
    personagem INTEGER REFERENCES Personagem (id),
    valor INTEGER NOT NULL,
    PRIMARY KEY (negociante, item, personagem)
);

CREATE TABLE IF NOT EXISTS Antecedente (
    nome VARCHAR PRIMARY KEY,
    descricao VARCHAR(231) NOT NULL,
    item_1 VARCHAR REFERENCES Item (nome),
    item_2 VARCHAR REFERENCES Item (nome),
    item_3 VARCHAR REFERENCES Item (nome),
    item_4 VARCHAR REFERENCES Item (nome),
    item_5 VARCHAR REFERENCES Item (nome),
    item_6 VARCHAR REFERENCES Item (nome),
    item_7 VARCHAR REFERENCES Item (nome),
    item_8 VARCHAR REFERENCES Item (nome),
    item_9 VARCHAR REFERENCES Item (nome),
    item_10 VARCHAR REFERENCES Item (nome)
);

