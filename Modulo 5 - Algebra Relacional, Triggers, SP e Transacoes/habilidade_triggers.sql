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


-- ======================================= CHECK ATAQUE  ===========================================================================================

CREATE OR REPLACE FUNCTION cria_ataque() RETURNS trigger AS $cria_ataque$
DECLARE 
    curas INTEGER;
    truques INTEGER;
    magias INTEGER; 
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
    
    magias := COUNT(*) FROM Magia WHERE habilidade = new.habilidade; 
    IF magias > 0 THEN
        RAISE EXCEPTION 'Já existe uma magia com essa referência de habilidade!'; 
        RETURN NULL;
    END IF;

    UPDATE Habilidade_Tipo 
    SET tipo = 'Ataque'
    WHERE nome = new.habilidade;

    return new; 
END;

$cria_ataque$ LANGUAGE plpgsql;
CREATE TRIGGER cria_ataque_trigger
BEFORE INSERT ON Ataque
FOR EACH ROW EXECUTE PROCEDURE cria_ataque();

-- ======================================= CHECK CURA  ===========================================================================================

CREATE OR REPLACE FUNCTION cria_cura() RETURNS trigger AS $cria_cura$
DECLARE 
    ataques INTEGER;
    truques INTEGER;
    magias INTEGER; 
BEGIN 
    ataques := COUNT(*) FROM Ataque where habilidade = new.habilidade;
    IF ataques > 0 THEN 
        RAISE EXCEPTION 'Já existe um ataque com essa referência de habilidade!';
        RETURN NULL;
    END IF; 

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


-- ======================================= CHECK TRUQUE  ===========================================================================================

CREATE OR REPLACE FUNCTION cria_truque() RETURNS trigger AS $cria_truque$
DECLARE 
    ataques INTEGER;
    curas INTEGER;
    magias INTEGER; 
BEGIN 
    ataques := COUNT(*) FROM Ataque where habilidade = new.habilidade;
    IF ataques > 0 THEN 
        RAISE EXCEPTION 'Já existe um ataque com essa referência de habilidade!';
        RETURN NULL;
    END IF; 

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

-- ======================================= CHECK MAGIA  ===========================================================================================


CREATE OR REPLACE FUNCTION cria_magia() RETURNS trigger AS $cria_magia$
DECLARE 
    ataques INTEGER;
    curas INTEGER;
    truques INTEGER;
BEGIN 
    ataques := COUNT(*) FROM Ataque where habilidade = new.habilidade;
    IF ataques > 0 THEN 
        RAISE EXCEPTION 'Já existe um ataque com essa referência de habilidade!';
        RETURN NULL;
    END IF; 

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