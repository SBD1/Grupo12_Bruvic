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


-- A transação a seguir realiza as operações por trás da venda de um item
-- de um negociante para um personagem. A execução desses passos de forma isolada
-- poderia causar inconsistência no banco de dados, logo estão dentro de uma transação
BEGIN TRANSACTION;
    do
    $$
    DECLARE
    item_r record;
    personagem_r record;
    
    BEGIN
        SELECT * into item_r from ITEM where nome = 'faca mortifera';
        SELECT * into personagem_r from PERSONAGEM where nome = 'bolinha';

    IF personagem_r.montante >= item_r.preco THEN
        UPDATE PERSONAGEM set montante = montante - item_r.preco where nome = personagem_r.nome;
        UPDATE NEGOCIANTE set montante = montante + item_r.preco where npc = 1;
        UPDATE ITEM set negociante = NULL, mochila = 1 where nome = item_r.nome;
    ELSE
        RAISE NOTICE 'Personagem não possui dinheiro para realizar a compra do item';
    END IF;
    end;
    $$;
COMMIT;