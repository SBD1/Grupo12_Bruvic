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

-- DROP TRIGGER cria_definicao_personagem on Personagem;
CREATE TRIGGER cria_definicao_personagem
AFTER INSERT ON Personagem
FOR EACH ROW EXECUTE PROCEDURE cria_personagem();


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

    RAISE NOTICE 'Mago Criado com sucesso!';
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

    RAISE NOTICE 'Clerigo Criado com sucesso!';
    RETURN NEW;
END;
$cria_clerigo$ LANGUAGE plpgsql;

-- DROP TRIGGER checa_clerigo on Mago;
CREATE TRIGGER checa_clerigo
BEFORE INSERT ON Clerigo
FOR EACH ROW EXECUTE PROCEDURE cria_clerigo();