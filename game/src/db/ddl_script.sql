-- Arquivo habilidades.sql

CREATE TABLE IF NOT EXISTS Habilidade (
    nome VARCHAR PRIMARY KEY,
    descricao VARCHAR NOT NULL,  
    nivel INTEGER NOT NULL
); 

CREATE TABLE IF NOT EXISTS Habilidade_Tipo (
    nome VARCHAR PRIMARY KEY REFERENCES Habilidade (nome) ON DELETE CASCADE,
    tipo VARCHAR NOT NULL CHECK (tipo in ('Cura', 'Truque', 'Magia', ''))
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
    mapa INTEGER REFERENCES Mapa (id) ON DELETE CASCADE,
    tipo VARCHAR NOT NULL,
    spawn_item BOOLEAN,
    PRIMARY KEY (eixo_x, eixo_y, mapa)
);

CREATE TABLE IF NOT EXISTS Armadilha (
    acao BOOLEAN NOT NULL,
    eixo_x INTEGER NOT NULL,
    eixo_y INTEGER NOT NULL,
    mapa INTEGER NOT NULL,
    FOREIGN KEY (eixo_x, eixo_y, mapa) REFERENCES Bloco (eixo_x, eixo_y, mapa)
);

CREATE TABLE IF NOT EXISTS NPC (
    id SERIAL PRIMARY KEY,
    nome VARCHAR NOT NULL,
    eixo_x INTEGER NOT NULL,
    eixo_y INTEGER NOT NULL,
    mapa INTEGER NOT NULL,
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

CREATE TABLE IF NOT EXISTS PersonagemLocalizacao (
    personagem INTEGER REFERENCES Personagem (id),
    eixo_x INTEGER DEFAULT 0,
    eixo_y INTEGER DEFAULT 6,
    mapa INTEGER DEFAULT 1,
    FOREIGN KEY (eixo_x, eixo_y, mapa) REFERENCES Bloco (eixo_x, eixo_y, mapa)
);

CREATE TABLE IF NOT EXISTS Humano (
    personagem INTEGER PRIMARY KEY REFERENCES Personagem (id) ON DELETE CASCADE,
    bonus_destreza SMALLINT DEFAULT 1,
    bonus_forca SMALLINT DEFAULT 1,
    bonus_constituicao SMALLINT DEFAULT 1,
    bonus_carisma SMALLINT DEFAULT 1,
    bonus_sabedoria SMALLINT DEFAULT 1,
    bonus_inteligencia SMALLINT DEFAULT 1,
    CONSTRAINT checa_atributos_humano 
    CHECK (bonus_destreza + bonus_forca + bonus_constituicao + bonus_carisma + bonus_sabedoria + bonus_inteligencia = 6)
);

CREATE TABLE IF NOT EXISTS Anao (
    personagem INTEGER PRIMARY KEY REFERENCES Personagem (id) ON DELETE CASCADE,
    bonus_forca SMALLINT DEFAULT 3,
    bonus_constituicao SMALLINT DEFAULT 3,
    CONSTRAINT checa_atributos_anao 
    CHECK (bonus_forca + bonus_constituicao = 6)
);

CREATE TABLE IF NOT EXISTS MeioElfo (
    personagem INTEGER PRIMARY KEY REFERENCES Personagem (id) ON DELETE CASCADE,
    bonus_sabedoria SMALLINT DEFAULT 3,
    bonus_destreza SMALLINT DEFAULT 3,
    CONSTRAINT checa_atributos_meio_elfo 
    CHECK (bonus_sabedoria + bonus_destreza = 6)
);

CREATE TABLE IF NOT EXISTS Draconato (
    personagem INTEGER PRIMARY KEY REFERENCES Personagem (id) ON DELETE CASCADE,
    bonus_carisma SMALLINT DEFAULT 3,
    bonus_inteligencia SMALLINT DEFAULT 3,
    CONSTRAINT checa_atributos_draconato 
    CHECK (bonus_carisma + bonus_inteligencia = 6)
);

CREATE TABLE IF NOT EXISTS Guerreiro (
    personagem INTEGER PRIMARY KEY REFERENCES Personagem (id) ON DELETE CASCADE,
    bonus_classe_armadura SMALLINT DEFAULT 4,
    bonus_ataque SMALLINT DEFAULT 4,
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
    mago INTEGER REFERENCES Mago (personagem),
    magia VARCHAR REFERENCES Magia (habilidade),
    PRIMARY KEY (mago, magia)
);

CREATE TABLE IF NOT EXISTS ClerigoTruque (
   clerigo INTEGER REFERENCES Clerigo (personagem),
   truque VARCHAR REFERENCES Truque (habilidade),
   PRIMARY KEY (clerigo, truque)
);

CREATE TABLE IF NOT EXISTS ClerigoCura (
    clerigo INTEGER REFERENCES Clerigo (personagem),
    cura VARCHAR REFERENCES Cura (habilidade),
    PRIMARY KEY (clerigo, cura)
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

-- TRIGGERS


-- =====================================  CHECK HABILIDADE  ===========================================================================================

CREATE OR REPLACE FUNCTION cria_habilidade() RETURNS trigger AS $cria_habilidade$

BEGIN 
    INSERT INTO Public.Habilidade_Tipo(nome, tipo) VALUES (new.nome, '');
    RAISE NOTICE 'Habilidade criada com sucesso!';
    return new;
END;

$cria_habilidade$ LANGUAGE plpgsql;

CREATE TRIGGER cria_habilidade_trigger
AFTER INSERT ON Habilidade
FOR EACH ROW EXECUTE PROCEDURE cria_habilidade();

-- -- ======================================= CHECK CURA  ===========================================================================================

CREATE OR REPLACE FUNCTION cria_cura() RETURNS trigger AS $cria_cura$
DECLARE 
    truques INTEGER;
    magias INTEGER; 
BEGIN 
    truques := COUNT(*) FROM Truque WHERE habilidade = new.habilidade; 
    IF truques > 0 THEN 
        RAISE EXCEPTION 'Já existe um truque com essa referência de habilidade!';
        RETURN NULL;
    END IF; 
    
    magias := COUNT(*) FROM Magia WHERE habilidade = new.habilidade; 
    IF magias > 0 THEN
        RAISE EXCEPTION 'Já existe uma magia com essa referência de habilidade!'; 
        RETURN NULL;
    END IF;

    UPDATE Habilidade_Tipo 
    SET tipo = 'Cura'
    WHERE nome = new.habilidade;

    return new; 
END;

$cria_cura$ LANGUAGE plpgsql;

CREATE TRIGGER cria_cura_trigger
BEFORE INSERT ON Cura
FOR EACH ROW EXECUTE PROCEDURE cria_cura();


-- -- ======================================= CHECK TRUQUE  ===========================================================================================

CREATE OR REPLACE FUNCTION cria_truque() RETURNS trigger AS $cria_truque$
DECLARE 
    curas INTEGER;
    magias INTEGER; 
BEGIN 
    curas := COUNT(*) FROM Cura where habilidade = new.habilidade;
    IF curas > 0 THEN 
        RAISE EXCEPTION 'Já existe uma cura com essa referência de habilidade!';
        RETURN NULL;
    END IF; 
    
    magias := COUNT(*) FROM Magia WHERE habilidade = new.habilidade; 
    IF magias > 0 THEN
        RAISE EXCEPTION 'Já existe uma magia com essa referência de habilidade!'; 
        RETURN NULL;
    END IF;

    UPDATE Habilidade_Tipo 
    SET tipo = 'Truque'
    WHERE nome = new.habilidade;

    return new; 
END;

$cria_truque$ LANGUAGE plpgsql;

CREATE TRIGGER cria_truque_trigger
BEFORE INSERT ON Truque
FOR EACH ROW EXECUTE PROCEDURE cria_truque();

-- -- ======================================= CHECK MAGIA  ===========================================================================================


CREATE OR REPLACE FUNCTION cria_magia() RETURNS trigger AS $cria_magia$
DECLARE 
    curas INTEGER;
    truques INTEGER;
BEGIN 
    curas := COUNT(*) FROM Cura where habilidade = new.habilidade;
    IF curas > 0 THEN 
        RAISE EXCEPTION 'Já existe uma cura com essa referência de habilidade!';
        RETURN NULL;
    END IF; 
    
    truques := COUNT(*) FROM Truque WHERE habilidade = new.habilidade; 
    IF truques > 0 THEN 
        RAISE EXCEPTION 'Já existe um truque com essa referência de habilidade!';
        RETURN NULL;
    END IF; 

    UPDATE Habilidade_Tipo 
    SET tipo = 'Magia'
    WHERE nome = new.habilidade;

    return new; 
END;

$cria_magia$ LANGUAGE plpgsql;

CREATE TRIGGER cria_magia_trigger
BEFORE INSERT ON Magia
FOR EACH ROW EXECUTE PROCEDURE cria_magia();


-- *********************
-- Trigger de Personagem
-- *********************
CREATE OR REPLACE FUNCTION cria_personagem() RETURNS trigger AS $cria_personagem$
BEGIN
    INSERT INTO public.definicaopersonagem(personagem) VALUES (new.id);
    INSERT INTO public.PersonagemLocalizacao(personagem) VALUES (new.id);
    RAISE NOTICE 'Personagem criado com sucesso!';
    RETURN NEW;
END;
$cria_personagem$ LANGUAGE plpgsql;

-- DROP TRIGGER cria_definicao_personagem on Personagem;
CREATE TRIGGER cria_definicao_personagem
AFTER INSERT ON Personagem
FOR EACH ROW EXECUTE PROCEDURE cria_personagem();
------
CREATE OR REPLACE FUNCTION exclui_personagem() RETURNS trigger AS $exclui_personagem$
BEGIN
    DELETE FROM DefinicaoPersonagem WHERE Personagem = old.id;
    RAISE NOTICE 'Personagem excluído com sucesso!';
    RETURN OLD;
END;
$exclui_personagem$ LANGUAGE plpgsql;

-- DROP TRIGGER exclui_definicao_personagem on Personagem;
CREATE TRIGGER exclui_definicao_personagem
AFTER DELETE ON Personagem
FOR EACH ROW EXECUTE PROCEDURE exclui_personagem();


-- ********************
-- Trigger de Guerreiro
-- ********************
CREATE OR REPLACE FUNCTION cria_guerreiro() RETURNS trigger AS $cria_guerreiro$
DECLARE
    personagens INTEGER;
    magos INTEGER;
    clerigos INTEGER;
BEGIN
    personagens := COUNT(*) FROM Personagem WHERE id = new.personagem;
    IF personagens < 1 THEN
        RAISE EXCEPTION 'Não existe personagem com este identificador na tabela!';
        RETURN NULL;
    END IF;

    magos := COUNT(*) FROM Mago WHERE personagem = new.personagem;
    IF magos > 0 THEN
        RAISE EXCEPTION 'Já existe um mago cadastrado que referencia este personagem!';
        RETURN NULL;
    END IF;

    clerigos := COUNT(*) FROM Clerigo WHERE personagem = new.personagem;
    IF clerigos > 0 THEN
        RAISE EXCEPTION 'Já existe um clérigo cadastrado que referencia este personagem!';
        RETURN NULL;
    END IF;

    UPDATE Personagem 
    SET classe_de_armadura = classe_de_armadura + new.bonus_classe_armadura
    WHERE id = new.personagem;

    UPDATE Definicaopersonagem
    SET classe = 'Guerreiro'
    WHERE personagem = new.personagem;

    RAISE NOTICE 'Guerreiro criado com sucesso!';
    RETURN NEW;
END;
$cria_guerreiro$ LANGUAGE plpgsql;

-- DROP TRIGGER checa_guerreiro on Guerreiro;
CREATE TRIGGER checa_guerreiro
BEFORE INSERT ON Guerreiro
FOR EACH ROW EXECUTE PROCEDURE cria_guerreiro();


-- ********************
-- Trigger de Mago
-- ********************
CREATE OR REPLACE FUNCTION cria_mago() RETURNS trigger AS $cria_mago$
DECLARE
    personagens INTEGER;
    guerreiros INTEGER;
    clerigos INTEGER;
BEGIN
    personagens := COUNT(*) FROM Personagem WHERE id = new.personagem;
    IF personagens < 1 THEN
        RAISE EXCEPTION 'Não existe personagem com este identificador na tabela!';
        RETURN NULL;
    END IF;

    guerreiros := COUNT(*) FROM Guerreiro WHERE personagem = new.personagem;
    IF guerreiros > 0 THEN
        RAISE EXCEPTION 'Já existe um guerreiro cadastrado que referencia este personagem!';
        RETURN NULL;
    END IF;

    clerigos := COUNT(*) FROM Clerigo WHERE personagem = new.personagem;
    IF clerigos > 0 THEN
        RAISE EXCEPTION 'Já existe um clérigo cadastrado que referencia este personagem!';
        RETURN NULL;
    END IF;

    UPDATE Definicaopersonagem
    SET classe = 'Mago'
    WHERE personagem = new.personagem;

    RAISE NOTICE 'Mago criado com sucesso!';
    RETURN NEW;
END;
$cria_mago$ LANGUAGE plpgsql;

-- DROP TRIGGER checa_mago on Mago;
CREATE TRIGGER checa_mago
BEFORE INSERT ON Mago
FOR EACH ROW EXECUTE PROCEDURE cria_mago();


-- ********************
-- Trigger de Clerigo
-- ********************
CREATE OR REPLACE FUNCTION cria_clerigo() RETURNS trigger AS $cria_clerigo$
DECLARE
    personagens INTEGER;
    guerreiros INTEGER;
    magos INTEGER;
BEGIN
    personagens := COUNT(*) FROM Personagem WHERE id = new.personagem;
    IF personagens < 1 THEN
        RAISE EXCEPTION 'Não existe personagem com este identificador na tabela!';
        RETURN NULL;
    END IF;

    guerreiros := COUNT(*) FROM Guerreiro WHERE personagem = new.personagem;
    IF guerreiros > 0 THEN
        RAISE EXCEPTION 'Já existe um guerreiro cadastrado que referencia este personagem!';
        RETURN NULL;
    END IF;

    magos := COUNT(*) FROM Mago WHERE personagem = new.personagem;
    IF magos > 0 THEN
        RAISE EXCEPTION 'Já existe um mago cadastrado que referencia este personagem!';
        RETURN NULL;
    END IF;

    UPDATE Definicaopersonagem
    SET classe = 'Clerigo'
    WHERE personagem = new.personagem;

    RAISE NOTICE 'Clerigo criado com sucesso!';
    RETURN NEW;
END;
$cria_clerigo$ LANGUAGE plpgsql;

-- DROP TRIGGER checa_clerigo on Clerigo;
CREATE TRIGGER checa_clerigo
BEFORE INSERT ON Clerigo
FOR EACH ROW EXECUTE PROCEDURE cria_clerigo();


-- ********************
-- Trigger de Humano
-- ********************
CREATE OR REPLACE FUNCTION cria_humano() RETURNS trigger AS $cria_humano$
DECLARE
    personagens INTEGER;
    anoes INTEGER;
    elfos INTEGER;
    draconatos INTEGER;
BEGIN
    personagens := COUNT(*) FROM Personagem WHERE id = new.personagem;
    IF personagens < 1 THEN
        RAISE EXCEPTION 'Não existe personagem com este identificador na tabela!';
        RETURN NULL;
    END IF;

    anoes := COUNT(*) FROM Anao WHERE personagem = new.personagem;
    IF anoes > 0 THEN
        RAISE EXCEPTION 'Já existe um anão cadastrado que referencia este personagem!';
        RETURN NULL;
    END IF;

    elfos := COUNT(*) FROM MeioElfo WHERE personagem = new.personagem;
    IF elfos > 0 THEN
        RAISE EXCEPTION 'Já existe um meio elfo cadastrado que referencia este personagem!';
        RETURN NULL;
    END IF;

    draconatos := COUNT(*) FROM Draconato WHERE personagem = new.personagem;
    IF draconatos > 0 THEN
        RAISE EXCEPTION 'Já existe um draconato cadastrado que referencia este personagem!';
        RETURN NULL;
    END IF;

    UPDATE Personagem 
    SET destreza = destreza + new.bonus_destreza, 
    forca = forca + new.bonus_forca,
    constituicao = constituicao + new.bonus_constituicao,
    carisma = carisma + new.bonus_carisma,
    sabedoria = sabedoria + new.bonus_sabedoria,
    inteligencia = inteligencia + new.bonus_inteligencia
    WHERE id = new.personagem;

    UPDATE Definicaopersonagem
    SET raca = 'Humano'
    WHERE personagem = new.personagem;

    RAISE NOTICE 'Humano criado com sucesso!';
    RETURN NEW;
END;
$cria_humano$ LANGUAGE plpgsql;

-- DROP TRIGGER checa_humano on Humano;
CREATE TRIGGER checa_humano
BEFORE INSERT ON Humano
FOR EACH ROW EXECUTE PROCEDURE cria_humano();


-- ********************
-- Trigger de Anão
-- ********************
CREATE OR REPLACE FUNCTION cria_anao() RETURNS trigger AS $cria_anao$
DECLARE
    personagens INTEGER;
    humanos INTEGER;
    elfos INTEGER;
    draconatos INTEGER;
BEGIN
    personagens := COUNT(*) FROM Personagem WHERE id = new.personagem;
    IF personagens < 1 THEN
        RAISE EXCEPTION 'Não existe personagem com este identificador na tabela!';
        RETURN NULL;
    END IF;

    humanos := COUNT(*) FROM Humano WHERE personagem = new.personagem;
    IF humanos > 0 THEN
        RAISE EXCEPTION 'Já existe um humano cadastrado que referencia este personagem!';
        RETURN NULL;
    END IF;

    elfos := COUNT(*) FROM MeioElfo WHERE personagem = new.personagem;
    IF elfos > 0 THEN
        RAISE EXCEPTION 'Já existe um meio elfo cadastrado que referencia este personagem!';
        RETURN NULL;
    END IF;

    draconatos := COUNT(*) FROM Draconato WHERE personagem = new.personagem;
    IF draconatos > 0 THEN
        RAISE EXCEPTION 'Já existe um draconato cadastrado que referencia este personagem!';
        RETURN NULL;
    END IF;

    UPDATE Personagem 
    SET forca = forca + new.bonus_forca,
    constituicao = constituicao + new.bonus_constituicao
    WHERE id = new.personagem;

    UPDATE Definicaopersonagem
    SET raca = 'Anao'
    WHERE personagem = new.personagem;

    RAISE NOTICE 'Anão criado com sucesso!';
    RETURN NEW;
END;
$cria_anao$ LANGUAGE plpgsql;

-- DROP TRIGGER checa_anao on Anao;
CREATE TRIGGER checa_anao
BEFORE INSERT ON Anao
FOR EACH ROW EXECUTE PROCEDURE cria_anao();


-- ********************
-- Trigger de Meio Elfo
-- ********************
CREATE OR REPLACE FUNCTION cria_elfo() RETURNS trigger AS $cria_elfo$
DECLARE
    personagens INTEGER;
    humanos INTEGER;
    anoes INTEGER;
    draconatos INTEGER;
BEGIN
    personagens := COUNT(*) FROM Personagem WHERE id = new.personagem;
    IF personagens < 1 THEN
        RAISE EXCEPTION 'Não existe personagem com este identificador na tabela!';
        RETURN NULL;
    END IF;

    humanos := COUNT(*) FROM Humano WHERE personagem = new.personagem;
    IF humanos > 0 THEN
        RAISE EXCEPTION 'Já existe um humano cadastrado que referencia este personagem!';
        RETURN NULL;
    END IF;

    anoes := COUNT(*) FROM Anao WHERE personagem = new.personagem;
    IF anoes > 0 THEN
        RAISE EXCEPTION 'Já existe um anão cadastrado que referencia este personagem!';
        RETURN NULL;
    END IF;

    draconatos := COUNT(*) FROM Draconato WHERE personagem = new.personagem;
    IF draconatos > 0 THEN
        RAISE EXCEPTION 'Já existe um draconato cadastrado que referencia este personagem!';
        RETURN NULL;
    END IF;

    UPDATE Personagem 
    SET destreza = destreza + new.bonus_destreza, 
    sabedoria = sabedoria + new.bonus_sabedoria
    WHERE id = new.personagem;

    UPDATE Definicaopersonagem
    SET raca = 'Meio Elfo'
    WHERE personagem = new.personagem;

    RAISE NOTICE 'Meio Elfo criado com sucesso!';
    RETURN NEW;
END;
$cria_elfo$ LANGUAGE plpgsql;

-- DROP TRIGGER checa_elfo on MeioElfo;
CREATE TRIGGER checa_elfo
BEFORE INSERT ON MeioElfo
FOR EACH ROW EXECUTE PROCEDURE cria_elfo();


-- ********************
-- Trigger de Draconato
-- ********************
CREATE OR REPLACE FUNCTION cria_draconato() RETURNS trigger AS $cria_draconato$
DECLARE
    personagens INTEGER;
    humanos INTEGER;
    anoes INTEGER;
    elfos INTEGER;
BEGIN
    personagens := COUNT(*) FROM Personagem WHERE id = new.personagem;
    IF personagens < 1 THEN
        RAISE EXCEPTION 'Não existe personagem com este identificador na tabela!';
        RETURN NULL;
    END IF;

    humanos := COUNT(*) FROM Humano WHERE personagem = new.personagem;
    IF humanos > 0 THEN
        RAISE EXCEPTION 'Já existe um humano cadastrado que referencia este personagem!';
        RETURN NULL;
    END IF;

    anoes := COUNT(*) FROM Anao WHERE personagem = new.personagem;
    IF anoes > 0 THEN
        RAISE EXCEPTION 'Já existe um anão cadastrado que referencia este personagem!';
        RETURN NULL;
    END IF;

    elfos := COUNT(*) FROM MeioElfo WHERE personagem = new.personagem;
    IF elfos > 0 THEN
        RAISE EXCEPTION 'Já existe um meio elfo cadastrado que referencia este personagem!';
        RETURN NULL;
    END IF;

    UPDATE Personagem 
    SET carisma = carisma + new.bonus_carisma,
    inteligencia = inteligencia + new.bonus_inteligencia
    WHERE id = new.personagem;

    UPDATE Definicaopersonagem
    SET raca = 'Draconato'
    WHERE personagem = new.personagem;

    RAISE NOTICE 'Draconato criado com sucesso!';
    RETURN NEW;
END;
$cria_draconato$ LANGUAGE plpgsql;

-- DROP TRIGGER checa_draconato on Draconato;
CREATE TRIGGER checa_draconato
BEFORE INSERT ON Draconato
FOR EACH ROW EXECUTE PROCEDURE cria_draconato();


-- Trigger DefinicaoPersonagem

CREATE OR REPLACE FUNCTION on_definicao_personagem() RETURNS trigger AS $on_definicao_personagem$

BEGIN
 IF new.raca = 'Anao' THEN
    INSERT INTO Anao(personagem) VALUES (new.personagem);
 END IF;
 
 IF new.raca = 'Humano' THEN
    INSERT INTO Humano(personagem) VALUES (new.personagem);
 END IF;

 IF new.raca = 'MeioElfo' THEN
    INSERT INTO MeioElfo(personagem) VALUES (new.personagem);
 END IF;

 IF new.raca = 'Draconato' THEN
    INSERT INTO Draconato(personagem) VALUES (new.personagem);
 END IF;

 IF new.classe = 'Mago' THEN
    INSERT INTO Mago(personagem) VALUES (new.personagem);
 END IF;

 IF new.classe = 'Clerigo' THEN
    INSERT INTO Clerigo(personagem) VALUES (new.personagem);
 END IF;

 IF new.classe = 'Guerreiro' THEN
    INSERT INTO Guerreiro(personagem) VALUES (new.personagem);
 END IF;
 RETURN NULL; 
END;
$on_definicao_personagem$ LANGUAGE plpgsql;

-- DROP TRIGGER on_definicao_personagem on DefinicaoPersonagem;
CREATE TRIGGER on_definicao_personagem
AFTER INSERT ON DefinicaoPersonagem
FOR EACH ROW EXECUTE PROCEDURE on_definicao_personagem();




-- *********************
-- Trigger de Item
-- *********************

-- O trigger é acionado em todo UPDATE da tabela Item
-- caso a mochila tenha mudado, é porque houve uma venda, 
-- que deve ser registrada na tabela VENDA

CREATE OR REPLACE FUNCTION cria_venda() RETURNS trigger AS $cria_venda$
DECLARE
    mochila_personagem character varying(255);
BEGIN
    IF OLD.mochila != NEW.mochila THEN
        SELECT mochila.personagem into mochila_personagem from MOCHILA where id = NEW.mochila;
        INSERT INTO VENDA
        VALUES(OLD.negociante, OLD.nome, mochila_personagem, OLD.preco);
    END IF;
    RETURN NULL;
END;
$cria_venda$ LANGUAGE plpgsql;
-- DROP TRIGGER cria_venda ON Item;

CREATE TRIGGER cria_venda
AFTER UPDATE ON Item
FOR EACH ROW EXECUTE PROCEDURE cria_venda();


-- trigger de statement no momento da deleção de um item
CREATE OR REPLACE FUNCTION statement_remove_item() RETURNS trigger AS $statement_remove_item$
BEGIN
    RAISE NOTICE 'Item removido da mochila, ele não poderá ser resgatado';
    RETURN OLD;
END;
$statement_remove_item$ LANGUAGE plpgsql;

CREATE TRIGGER statement_remove_item
BEFORE DELETE ON ITEM
FOR EACH ROW EXECUTE PROCEDURE statement_remove_item();


-- trigger do statement no momento de inserir ou atualizar um item em uma mochila
CREATE OR REPLACE FUNCTION statement_insert_item() RETURNS trigger AS $statement_insert_item$
BEGIN
    RAISE NOTICE 'Um item foi inserido na mochila.';
    RETURN NEW;
END;
$statement_insert_item$ LANGUAGE plpgsql;

CREATE TRIGGER statement_insert_item
BEFORE INSERT OR UPDATE ON ITEM
FOR EACH ROW EXECUTE PROCEDURE statement_insert_item();
