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
	VALUES (?, ?, ?);

INSERT INTO public.armadura(
	classe_de_armadura, durabilidade, fk_item_id)
	VALUES (?, ?, 5);

-- inserção de bugiganga
INSERT INTO public.item(
	nome, preco, peso)
	VALUES (?, ?, ?);

INSERT INTO public.bugiganga(
	descricao, funcao, fk_item_id)
	VALUES (?, ?, 6);

-- inserção de mochilas

INSERT INTO public.item(
	nome, preco, peso)
	VALUES (?, ?, ?);

INSERT INTO public.mochila(
	capacidade, durabilidade, fk_item_id)
	VALUES (?, ?, 7);

-- inserção de moedas
INSERT INTO public.item(
	nome, preco, peso)
	VALUES (?, ?, ?);

INSERT INTO public.moeda(
	cambio, fk_item_id)
	VALUES (?, 7);

-- inserção pocao

INSERT INTO public.item(
	nome, preco, peso)
	VALUES (?, ?, ?);

INSERT INTO public.pocao(
	recuperacao, fk_item_id)
	VALUES (?, 8);