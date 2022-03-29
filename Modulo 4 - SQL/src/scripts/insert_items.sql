-- inserção de armas

INSERT INTO public.item(
	nome, preco, peso)
	VALUES ('adaga', 2, 0.5), 
    ('machadinha', 5, 1), 
    ('tridente', 5, 2), 
    ('besta pesada', 50, 4.5);


INSERT INTO public.arma(
	dano, alcance, durabilidade, fk_item_id)
	VALUES (10, 3, 150, 1),
    (15, 6, 200, 2),
    (200, 30, 500, 3),
    (300, 100, 500, 4);

-- inserção de armaduras

INSERT INTO public.item(
	nome, preco, peso)
	VALUES ("couro", 10, 5),
	("peitoral", 400, 10),
	("cota de malha", 75, 27.5);

INSERT INTO public.armadura(
	classe_de_armadura, durabilidade, fk_item_id)
	VALUES ("11 modificador de des", 5, 5),
	("14 modificador de des", 15, 6),
	("16", 40, 7);

-- inserção de bugiganga

INSERT INTO public.item(
	nome, preco, peso)
	VALUES ("mão de goblin", 2, 0.25),
	("apito", 1, 0.004),
	("chave velha", 0.5, 0.002);

INSERT INTO public.bugiganga(
	descricao, funcao, fk_item_id)
	VALUES ("mão de goblin mumificada", "obter proteção", 8),
	("apito feito de madeira dourada", "aviso sonoro", 9),
	("chave velha", "abrir algum baú", 10);

-- inserção de mochilas

INSERT INTO public.item(
	nome, preco, peso)
	VALUES ("mochila", 2, 2.5);

INSERT INTO public.mochila(
	capacidade, durabilidade, fk_item_id)
	VALUES (13, 200, 11);

-- inserção de moedas

INSERT INTO public.item(
	nome, preco, peso)
	VALUES ("moeda de ouro", 1, 0.01),
	("moeda de prata", 0.1, 0.01),
	("moeda de cobre", 0.01, 0.01);

INSERT INTO public.moeda(
	cambio, fk_item_id)
	VALUES (1, 12);

-- inserção pocao

INSERT INTO public.item(
	nome, preco, peso)
	VALUES ("poção de cura", 3, 0.05),
	("poção da energia", 2, 0.05),
	("poção de força", 2, 0.05);

INSERT INTO public.pocao(
	recuperacao, fk_item_id)
	VALUES (100, 13),
	(7, 14),
	(5, 15);