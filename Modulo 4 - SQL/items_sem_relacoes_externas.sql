CREATE TABLE Item (
    nome VARCHAR NOT NULL,
    preco FLOAT NOT NULL,
    peso FLOAT NOT NULL,
    id SERIAL PRIMARY KEY,
    fk_npc_id INTEGER,
    fk_Bloco_posicao INTEGER,
    fk_Personagem_id INTEGER,
    fk_Mochila_fk_Item_id INTEGER
);

CREATE TABLE Bugiganga (
    descricao VARCHAR NOT NULL,
    funcao VARCHAR NOT NULL,
    fk_Item_id INTEGER PRIMARY KEY NOT NULL
);

CREATE TABLE Pocao (
    recuperacao FLOAT NOT NULL,
    fk_Item_id INTEGER PRIMARY KEY NOT NULL
);

CREATE TABLE Moeda (
    cambio FLOAT NOT NULL,
    fk_Item_id INTEGER PRIMARY KEY NOT NULL
);

CREATE TABLE Mochila (
    capacidade FLOAT,
    durabilidade FLOAT,
    fk_Item_id INTEGER PRIMARY KEY NOT NULL
);

CREATE TABLE Armadura (
    classe_de_armadura VARCHAR NOT NULL,
    durabilidade FLOAT NOT NULL,
    fk_Item_id INTEGER PRIMARY KEY NOT NULL
);

CREATE TABLE Arma (
    dano FLOAT NOT NULL,
    alcance INTEGER NOT NULL,
    durabilidade FLOAT NOT NULL,
    fk_Item_id INTEGER PRIMARY KEY NOT NULL
);

ALTER TABLE Item ADD CONSTRAINT FK_Item_5
    FOREIGN KEY (fk_Mochila_fk_Item_id)
    REFERENCES Mochila (fk_Item_id)
    ON DELETE CASCADE;
 
ALTER TABLE Bugiganga ADD CONSTRAINT FK_Bugiganga_2
    FOREIGN KEY (fk_Item_id)
    REFERENCES Item (id)
    ON DELETE CASCADE;
 
ALTER TABLE Pocao ADD CONSTRAINT FK_Pocao_2
    FOREIGN KEY (fk_Item_id)
    REFERENCES Item (id)
    ON DELETE CASCADE;
 
ALTER TABLE Moeda ADD CONSTRAINT FK_Moeda_2
    FOREIGN KEY (fk_Item_id)
    REFERENCES Item (id)
    ON DELETE CASCADE;
 
ALTER TABLE Mochila ADD CONSTRAINT FK_Mochila_2
    FOREIGN KEY (fk_Item_id)
    REFERENCES Item (id)
    ON DELETE CASCADE;
 
ALTER TABLE Armadura ADD CONSTRAINT FK_Armadura_2
    FOREIGN KEY (fk_Item_id)
    REFERENCES Item (id)
    ON DELETE CASCADE;
 
ALTER TABLE Arma ADD CONSTRAINT FK_Arma_2
    FOREIGN KEY (fk_Item_id)
    REFERENCES Item (id)
    ON DELETE CASCADE;
