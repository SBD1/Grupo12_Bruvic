CREATE TABLE Personagem (
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
    classe_de_armadura SMALLINT
);

CREATE TABLE Humano (
    personagem INTEGER PRIMARY KEY REFERENCES Personagem (id),
    bonus_destreza SMALLINT,
    bonus_forca SMALLINT,
    bonus_constituicao SMALLINT,
    bonus_carisma SMALLINT,
    bonus_sabedoria SMALLINT,
    bonus_inteligencia SMALLINT,
    CONSTRAINT checa_atributos_humano 
    CHECK (bonus_destreza + bonus_forca + bonus_constituicao + bonus_carisma + bonus_sabedoria + bonus_inteligencia = 6)
);

CREATE TABLE Anao (
    personagem INTEGER PRIMARY KEY REFERENCES Personagem (id),
    bonus_forca SMALLINT,
    bonus_constituicao SMALLINT,
    CONSTRAINT checa_atributos_anao 
    CHECK (bonus_forca + bonus_constituicao = 6)
);

CREATE TABLE MeioElfo (
    personagem INTEGER PRIMARY KEY REFERENCES Personagem (id),
    bonus_sabedoria SMALLINT,
    bonus_destreza SMALLINT,
    CONSTRAINT checa_atributos_meio_elfo 
    CHECK (bonus_sabedoria + bonus_destreza = 6)
);

CREATE TABLE Draconato (
    personagem INTEGER PRIMARY KEY REFERENCES Personagem (id),
    bonus_carisma SMALLINT,
    bonus_inteligencia SMALLINT,
    CONSTRAINT checa_atributos_draconato 
    CHECK (bonus_carisma + bonus_inteligencia = 6)
);

CREATE TABLE Guerreiro (
    personagem INTEGER PRIMARY KEY REFERENCES Personagem (id),
    bonus_classe_armadura SMALLINT,
    bonus_ataque SMALLINT,
    CONSTRAINT checa_atributos_guerreiro 
    CHECK (bonus_classe_armadura + bonus_ataque = 8)
);

CREATE TABLE Mago (
    personagem INTEGER PRIMARY KEY REFERENCES Personagem (id)
);

CREATE TABLE Clerigo (
    personagem INTEGER PRIMARY KEY REFERENCES Personagem (id)
);

CREATE TABLE MagoMagia (
    mago INTEGER PRIMARY KEY REFERENCES Mago (personagem),
    magia VARCHAR REFERENCES Magia (habilidade)
);

CREATE TABLE ClerigoTruque (
   clerigo INTEGER REFERENCES Clerigo (personagem),
   truque VARCHAR REFERENCES Truque (habilidade)
);

CREATE TABLE ClerigoCura (
    clerigo INTEGER REFERENCES Clerigo (personagem),
    cura VARCHAR REFERENCES Cura (habilidade)
);

CREATE TABLE DefinicaoPersonagem(
    personagem INTEGER REFERENCES Personagem (id),
    raca VARCHAR NOT NULL,
    classe VACHAR NOT NULL
);