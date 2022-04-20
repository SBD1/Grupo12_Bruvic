-- A transação a seguir realiza as operações por trás da venda de um item
-- de um negociante para um personagem. A execução desses passos de forma isolada
-- poderia causar inconsistência no banco de dados, logo estão dentro de uma transação
BEGIN TRANSACTION;
    do
    $$
    DECLARE
    item_r record;
    personagem_r record;
    capacidade_utilizada INTEGER;
    mochila_r record;
    
    BEGIN
        SELECT * into item_r from ITEM where nome = $1;
        SELECT * into personagem_r from PERSONAGEM where nome = $2;
        SELECT * into mochila_r from MOCHILA where id = 1;
        SELECT SUM(peso) INTO capacidade_utilizada FROM ITEM WHERE mochila = 1;

    IF (personagem_r.montante >= item_r.preco) AND (capacidade_utilizada <= mochila_r.capacidade) THEN
        UPDATE PERSONAGEM set montante = montante - item_r.preco where nome = personagem_r.nome;
        UPDATE NEGOCIANTE set montante = montante + item_r.preco where npc = 1;
        UPDATE ITEM set negociante = NULL, mochila = 1 where nome = item_r.nome;
    ELSE
        RAISE NOTICE 'Personagem não possui dinheiro ou espaço na mochila para realizar a compra do item';
    END IF;
    end;
    $$;
COMMIT;