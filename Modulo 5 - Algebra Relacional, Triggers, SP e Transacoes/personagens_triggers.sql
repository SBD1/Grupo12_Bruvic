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

    RETURN NEW;
END;
$cria_guerreiro$ LANGUAGE plpgsql;

-- DROP TRIGGER checa_guerreiro on Guerreiro;
CREATE TRIGGER checa_guerreiro
BEFORE INSERT ON Guerreiro
FOR EACH ROW EXECUTE PROCEDURE cria_guerreiro();