-- *********************
-- Trigger de Personagem
-- *********************
CREATE OR REPLACE FUNCTION cria_personagem() RETURNS trigger AS $cria_personagem$
BEGIN
    INSERT INTO public.definicaopersonagem(personagem) VALUES (new.id);
    RAISE NOTICE 'Personagem criado com sucesso!';
    RETURN NEW;
END;
$cria_personagem$ LANGUAGE plpgsql;

DROP TRIGGER cria_definicao_personagem on Personagem;
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

DROP TRIGGER exclui_definicao_personagem on Personagem;
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

    RAISE NOTICE 'Guerreiro Criado com sucesso!';
    RETURN NEW;
END;
$cria_guerreiro$ LANGUAGE plpgsql;

DROP TRIGGER checa_guerreiro on Guerreiro;
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

    RAISE NOTICE 'Mago Criado com sucesso!';
    RETURN NEW;
END;
$cria_mago$ LANGUAGE plpgsql;

DROP TRIGGER checa_mago on Mago;
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

    RAISE NOTICE 'Clerigo Criado com sucesso!';
    RETURN NEW;
END;
$cria_clerigo$ LANGUAGE plpgsql;

DROP TRIGGER checa_clerigo on Clerigo;
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

    RAISE NOTICE 'Humano Criado com sucesso!';
    RETURN NEW;
END;
$cria_humano$ LANGUAGE plpgsql;

DROP TRIGGER checa_humano on Humano;
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

    RAISE NOTICE 'Anão Criado com sucesso!';
    RETURN NEW;
END;
$cria_anao$ LANGUAGE plpgsql;

DROP TRIGGER checa_anao on Anao;
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

DROP TRIGGER checa_elfo on MeioElfo;
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

DROP TRIGGER checa_draconato on Draconato;
CREATE TRIGGER checa_draconato
BEFORE INSERT ON Draconato
FOR EACH ROW EXECUTE PROCEDURE cria_draconato();