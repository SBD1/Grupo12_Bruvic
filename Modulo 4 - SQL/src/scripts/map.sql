CREATE TABLE Mapa (
    id SERIAL PRIMARY KEY,
    largura INTEGER NOT NULL,
    altura INTEGER NOT NULL
);

CREATE TABLE Bloco (
    eixo_x INTEGER NOT NULL,
    eixo_y INTEGER NOT NULL,
    mapa INTEGER REFERENCES Mapa (id),
    tipo VARCHAR NOT NULL,
    spawn_item BOOLEAN,
    PRIMARY KEY (eixo_x, eixo_y, mapa)
);

CREATE TABLE Armadilha (
    acao BOOLEAN NOT NULL,
    eixo_x INTEGER NOT NULL,
    eixo_y INTEGER NOT NULL,
    mapa INTEGER NOT NULL,
    FOREIGN KEY (eixo_x, eixo_y, mapa) REFERENCES Bloco (eixo_x, eixo_y, mapa),
    PRIMARY KEY (eixo_x, eixo_y, mapa)
);

CREATE TABLE NPC (
    id SERIAL PRIMARY KEY,
    eixo_x INTEGER NOT NULL UNIQUE,
    eixo_y INTEGER NOT NULL UNIQUE,
    mapa INTEGER NOT NULL UNIQUE,
    tipo VARCHAR NOT NULL,
    vida INTEGER NOT NULL,
    dano INTEGER,
    FOREIGN KEY (eixo_x, eixo_y, mapa) REFERENCES Bloco (eixo_x, eixo_y, mapa)
);

CREATE TABLE Negociante (
    npc INTEGER PRIMARY KEY REFERENCES NPC (id),
);