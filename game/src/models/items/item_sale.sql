-- A transação a seguir realiza as operações por trás da venda de um item
-- de um negociante para um personagem. A execução desses passos de forma isolada
-- poderia causar inconsistência no banco de dados, logo estão dentro de uma transação
CREATE OR REPLACE FUNCTION vendeItem(nomeItem text, nomePersonagem text,  idMochila integer) RETURNs void AS
$BODY$
BEGIN
        raise notice 'Value: %', nomeItem;
        raise notice 'Value: %', nomePersonagem;
        raise notice 'Value: %', idMochila;
        DECLARE
        item_r record;
        personagem_r record;
        capacidade_utilizada INTEGER;
        mochila_r record;
        
        BEGIN
            SELECT * into item_r from ITEM where nome = nomeItem;
            SELECT * into personagem_r from PERSONAGEM where nome = nomePersonagem;
            SELECT * into mochila_r from MOCHILA where id = idMochila;
            SELECT COALESCE(SUM(peso),0) INTO capacidade_utilizada FROM ITEM WHERE mochila = idMochila;
            raise notice 'executou os selects ';
            raise notice 'Value: %', capacidade_utilizada;

        IF (personagem_r.montante >= item_r.preco) AND (capacidade_utilizada <= mochila_r.capacidade) THEN
            raise notice 'executou os updates';
            UPDATE PERSONAGEM set montante = montante - item_r.preco where nome = personagem_r.nome;
            UPDATE NEGOCIANTE set montante = montante + item_r.preco where npc = 1;
            UPDATE ITEM set negociante = NULL, mochila = 1 where nome = item_r.nome;
        ELSE
            RAISE NOTICE 'Personagem não possui dinheiro ou espaço na mochila para realizar a compra do item';
        END IF;
        end;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE SECURITY DEFINER
  COST 100;