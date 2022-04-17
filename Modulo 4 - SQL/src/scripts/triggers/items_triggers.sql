-- O trigger é acionado em todo UPDATE da tabela Item
-- caso a mochila tenha mudado, é porque houve uma venda, 
-- que deve ser registrada na tabela VENDA

CREATE OR REPLACE FUNCTION cria_venda() RETURNS trigger AS $cria_venda$
DECLARE
    mochila_personagem character varying(255);
BEGIN
    IF OLD.mochila != NEW.mochila THEN
        select mochila.personagem into mochila_personagem from MOCHILA where id = NEW.mochila;
        INSERT INTO VENDA
        VALUES(OLD.negociante, OLD.nome, mochila_personagem, OLD.preco);
    END IF;
    RETURN NULL;
END;
$cria_venda$ LANGUAGE plpgsql;
DROP TRIGGER cria_venda ON Item;
CREATE TRIGGER cria_venda
AFTER UPDATE ON Item
FOR EACH ROW EXECUTE PROCEDURE cria_venda();