CREATE TABLE Habilidade (
    nome VARCHAR PRIMARY KEY,
    descricao VARCHAR NOT NULL,  
    nivel INTEGER NOT NULL
); 

CREATE TABLE Habilidade_Tipo (
    nome VARCHAR PRIMARY KEY REFERENCES Habilidade (nome) ON DELETE CASCADE,
    tipo VARCHAR NOT NULL CHECK (tipo in ('Ataque', 'Cura', 'Truque', 'Magia', ''))
); 

CREATE TABLE Ataque (
    habilidade VARCHAR PRIMARY KEY REFERENCES Habilidade (nome) ON DELETE CASCADE,
    dano INTEGER NOT NULL
); 

CREATE TABLE Cura (
    habilidade VARCHAR PRIMARY KEY REFERENCES Habilidade (nome) ON DELETE CASCADE,
    recuperacao INTEGER NOT NULL
); 

CREATE TABLE Truque (
    habilidade VARCHAR PRIMARY KEY REFERENCES Habilidade (nome) ON DELETE CASCADE,
    stun INTEGER NOT NULL
); 

CREATE TABLE Magia (
    habilidade VARCHAR PRIMARY KEY REFERENCES Habilidade (nome) ON DELETE CASCADE,
    modificador INTEGER NOT NULL
); 