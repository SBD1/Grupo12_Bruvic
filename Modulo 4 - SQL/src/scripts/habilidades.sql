CREATE TABLE Habilidade (
    nome VARCHAR PRIMARY KEY,
    descricao VARCHAR NOT NULL,  
    nivel INTEGER NOT NULL
); 

CREATE TABLE Habilidade_Tipo (
    nome VARCHAR PRIMARY KEY REFERENCES Habilidade (nome),
    tipo VARCHAR NOT NULL UNIQUE CHECK (tipo in ('Ataque', 'Cura', 'Truque', 'Magia'))
); 

CREATE TABLE Ataque (
    habilidade VARCHAR PRIMARY KEY REFERENCES Habilidade (nome),
    dano INTEGER NOT NULL
); 

CREATE TABLE Cura (
    habilidade VARCHAR PRIMARY KEY REFERENCES Habilidade (nome),
    recuparacao INTEGER NOT NULL
); 

CREATE TABLE Truque (
    habilidade VARCHAR PRIMARY KEY REFERENCES Habilidade (nome),
    stun INTEGER NOT NULL
); 

CREATE TABLE Magia (
    habilidade VARCHAR PRIMARY KEY REFERENCES Habilidade (nome),
    modificador INTEGER NOT NULL
); 