-- inserção de armas

INSERT INTO public.item(
	nome, preco, peso)
	VALUES ('adaga', 2, 0.5), 
    ('machadinha', 5, 1), 
    ('tridente', 5, 2), 
	('mochila', 10, 1),
    ('besta pesada', 50, 4.5);

INSERT INTO public.itemtipo(
	item, tipo)
	VALUES ('adaga', 'arma'),
	('machadinha', 'arma'),
	('tridente', 'arma'),
	('besta pesada', 'arma');

INSERT INTO public.equipamento(
	dano, durabilidade, item_tipo, eh_arma, eh_armadura)
	VALUES (10, 150, 'adaga', TRUE, FALSE),
    (15,  200, 'machadinha', TRUE, FALSE),
    (200,  500, 'tridente', TRUE, FALSE),
    (300,  500, 'besta pesada', TRUE, FALSE);

-- inserção de armaduras

INSERT INTO public.item(
	nome, preco, peso)
	VALUES ('couro', 10, 5),
	('peitoral', 400, 10),
	('cota de malha', 75, 27.5);

INSERT INTO public.itemtipo(
	item, tipo)
	VALUES ('couro', 'armadura'),
	('peitoral', 'armadura'),
	('cota de malha', 'armadura');

INSERT INTO public.equipamento(
	classe_de_armadura, durabilidade, item_tipo, eh_arma, eh_armadura)
	VALUES (11, 5, 'couro', FALSE, TRUE),
	(14, 15, 'peitoral', FALSE, TRUE),
	(16, 40, 'cota de malha', FALSE, TRUE);

-- inserção de bugiganga

INSERT INTO public.item(
	nome, preco, peso)
	VALUES ('mão de goblin', 2, 0.25),
	('apito', 1, 0.004),
	('chave velha', 1, 0.002);

INSERT INTO public.itemtipo(
	item, tipo)
	VALUES ('mão de goblin', 'bugiganga'),
	('apito', 'bugiganga'),
	('chave velha', 'bugiganga');

INSERT INTO public.bugiganga(
	descricao, funcao, item_tipo, eh_item_historia)
	VALUES ('mão de goblin mumificada', 'obter proteção', 'mão de goblin', FALSE),
	('apito feito de madeira dourada', 'aviso sonoro', 'apito', TRUE),
	('chave velha', NULL, 'chave velha', FALSE);

-- inserção de mochilas

INSERT INTO public.mochila(
	id, capacidade, personagem)
	VALUES (1, 13, 1);

-- inserção de moedas

INSERT INTO public.item(
	nome, preco, peso)
	VALUES ('moeda de ouro', 5, 0.1),
	('moeda de prata', 2, 0.01),
	('moeda de cobre', 1, 0.001);

INSERT INTO public.itemtipo(
	item, tipo)
	VALUES ('moeda de ouro', 'moeda'),
	('moeda de prata', 'moeda'),
	('moeda de cobre', 'moeda');

INSERT INTO public.moeda(
	item_tipo)
	VALUES ('moeda de ouro'),
	('moeda de prata'),
	('moeda de cobre');

-- inserção pocao

INSERT INTO public.item(
	nome, preco, peso)
	VALUES ('poção de cura', 3, 0.05),
	('poção da energia', 2, 0.05),
	('poção de força', 2, 0.05);

INSERT INTO public.itemtipo(
	item, tipo)
	VALUES ('poção de cura', 'poção'),
	('poção da energia', 'poção'),
	('poção de força', 'poção');

INSERT INTO public.pocao(
	recuperacao, item_tipo)
	VALUES (100, 'poção de cura'),
	(7, 'poção da energia'),
	(5, 'poção de força');

-- antecedente

INSERT INTO public.antecedente(
	nome, descricao, item_1, item_2, item_3, item_4, item_5, item_6, item_7, item_8, item_9, item_10)
	VALUES ('Elfo explorador', 'elfo encubido de passar adiante os ensinamentos que possui', 'moeda de ouro', 'moeda de ouro', 'moeda de prata', 'moeda de prata', 'moeda de cobre', 'moeda de cobre', 'mochila', 'machadinha', 'apito', 'peitoral');