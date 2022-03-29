CREATE TABLE Item (
    nome VARCHAR PRIMARY KEY,
    preco INTEGER NOT NULL,
    peso FLOAT NOT NULL,
    eixo_x INTEGER,
    eixo_y INTEGER,
    mochila INTEGER REFERENCES Mochila (id),
    negociante INTEGER REFERENCES Negociante (npc),
    FOREIGN KEY (eixo_x, eixo_y) REFERENCES Bloco (eixo_x, eixo_y)
);

CREATE TABLE ItemTipo (
    item VARCHAR PRIMARY KEY REFERENCES Item (nome),
    tipo VARCHAR
);

CREATE TABLE Bugiganga (
    item_tipo VARCHAR PRIMARY KEY REFERENCES ItemTipo (item),
    descricao VARCHAR(231) NOT NULL,
    funcao VARCHAR,
    eh_item_historia BOOLEAN NOT NULL
);

CREATE TABLE Moeda (
    item_tipo VARCHAR PRIMARY KEY REFERENCES ItemTipo (item)
);

CREATE TABLE Pocao (
    item_tipo VARCHAR PRIMARY KEY REFERENCES ItemTipo (item),
    recuperacao INTEGER NOT NULL
);

CREATE TABLE Equipamento (
    item_tipo VARCHAR PRIMARY KEY REFERENCES ItemTipo (item),
    durabilidade INTEGER NOT NULL,
    classe_de_armadura INTEGER,
    dano INTEGER,
    eh_armadura BOOLEAN NOT NULL,
    eh_arma BOOLEAN NOT NULL,
    CONSTRAINT valida_equipamento
    CHECK ((eh_arma=TRUE AND eh_armadura=FALSE AND classe_de_armadura=0) OR (eh_arma=FALSE AND eh_armadura=TRUE AND dano=0))
);

CREATE TABLE Venda (
    negociante INTEGER REFERENCES Negociante (npc),
    item VARCHAR REFERENCES Item (nome),
    personagem INTEGER REFERENCES Personagem (id),
    valor INTEGER NOT NULL,
    PRIMARY KEY (negociante, item, personagem)
);

CREATE TABLE Mochila (
    id SERIAL PRIMARY KEY,
    capacidade FLOAT NOT NULL,
    personagem INTEGER REFERENCES Personagem (id)
);

CREATE TABLE Antecedente (
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
)