-- Insert Habilidades

INSERT INTO public.habilidade(
	nome, descricao, nivel)
	VALUES ('Rajada mística', 'Um feixe de energia crepitante vai em direção a uma criatura dentro do alcance. Realize uma jogada de ataque à distância com magia contra o alvo.', 1), -- Magia
		   ('Toque arrepiante', 'Você cria uma mão esquelética fantasmagórica no espaço de uma criatura, dentro do alcance.', 1),-- Magia
		   ('Palavra curativa', 'Você cria uma mão esquelética fantasmagórica no espaço de uma criatura, dentro do alcance.
Uma criatura, à sua escolha, que você possa ver dentro do alcance recupera uma quantidade de pontos de vida.', 1), -- Cura 
		   ('Cura em massa', 'À medida que você brada palavras de restauração, até seis criaturas, à sua escolha, que você possa ver, dentro do alcance, recuperam uma quantidade de pontos de vida', 1), -- Cura
		   ('Perdição', ' Até três criaturas, à sua escolha, que você possa ver dentro do alcance, devem realizar um teste de resistência de Carisma, se o alvo falhar, ele tem desvantagens em ataque e resistência.', 1), -- Truque
		   ('Enfeitiçar pessoa', 'Você tenta enfeitiçar um humanoide que você possa ver dentro do alcance. Ele deve realizar um teste de resistência de Sabedoria, se ele falhar, ele obedece as suas ordens durante um tempo.', 1); -- Truque 


INSERT INTO public.cura(
	habilidade, recuperacao)
	VALUES ('Palavra curativa', 8),
		   ('Cura em massa', 4);

INSERT INTO public.magia(
	habilidade, modificador)
	VALUES ('Rajada mística', 12),
		   ('Toque arrepiante', 8);

INSERT INTO public.truque(
	habilidade, stun)
	VALUES ('Enfeitiçar pessoa', 7),
		   ('Perdição', 9);


-- Insert mapa

INSERT INTO public.mapa (
	largura, altura)
	VALUES (15, 15), 
    (20, 25), 
    (10, 5);


INSERT INTO public.bloco (
	eixo_x, eixo_y, mapa, tipo)
	VALUES (1, 3, 1, 'cordilheira'), 
    (8, 5, 2, 'floresta'), 
    (10, 4, 3, 'praia'),
	(7, 2, 1, 'cordilheira');

-- Insert npc

INSERT INTO public.npc (
	eixo_x, eixo_y, mapa, tipo, vida, nome)
	VALUES (1, 3, 1, 'negociante', 100, 'Vendedor de armas'), 
    (8, 5, 2, 'viajante', 100, 'Viajante das Brisas'),  
    (10, 4, 3, 'negociante', 100, 'Dono de Bar'),
	(7, 2, 1, 'negociante', 100, 'Vendedor de armaduras');

INSERT INTO public.negociante (
	npc, montante)
	VALUES (1, 1000), 
    (3, 3000), 
	(4, 5000);  

INSERT INTO public.item(nome, preco, peso, negociante) 
    VALUES ('faca mortifera', 600, 1, 1),
	('espada flamejante', 700, 2, 1),
	('garapa envenenada', 10, 0.1, 3),
	('garapa', 5, 0.1, 3),
	('manopla mágica', 1000, 5, 1);

INSERT INTO public.itemtipo(
	item, tipo)
	VALUES ('faca mortifera', 'arma'),
	('espada flamejante', 'arma'),
	('garapa envenenada', 'poção'),
	('garapa', 'poção'),
	('manopla mágica', 'arma');


-- Insert personagem

-- Inserção em personagens 
INSERT INTO public.personagem(
	id, vida, experiencia, nivel, nome, destreza, forca, constituicao, carisma, sabedoria, inteligencia, classe_de_armadura, montante)
	VALUES (1, 18, 0, 1, 'bolinha', 16, 15, 10, 11, 18, 19, 17, 1000),
    (2, 22, 0, 1, 'ada', 11, 12, 19, 11, 17, 16, 11, 900),
    (3, 19, 0, 1, 'kiteria', 18, 18, 10, 18, 10, 19, 14, 800),
    (4, 25, 0, 1, 'alby', 15, 15, 19, 16, 14, 10, 20, 800),
    (5, 21, 0, 1, 'cordeia', 12, 16, 20, 11, 15, 12, 13, 700),
    (6, 23, 0, 1, 'thomas', 18, 15, 14, 13, 13, 13, 11, 700);


-- Inserção de anoes
INSERT INTO public.anao(
	personagem, bonus_forca, bonus_constituicao)
	VALUES (1, 4, 2),
    (6, 1, 5);

-- Inserção de humanos
INSERT INTO public.humano(
	personagem, bonus_destreza, bonus_forca, bonus_constituicao, bonus_carisma, bonus_sabedoria, bonus_inteligencia)
	VALUES (3, 1, 1, 2, 0, 1, 1);

-- Inserção de draconatos
INSERT INTO public.draconato(
	personagem, bonus_carisma, bonus_inteligencia)
	VALUES (2, 3, 3),
    (5, 2, 4);

-- Inserção de meio elfos
INSERT INTO public.meioelfo(
	personagem, bonus_sabedoria, bonus_destreza)
	VALUES (4, 0, 6);


-- Inserção de guerreiros
INSERT INTO public.guerreiro(
	personagem, bonus_classe_armadura, bonus_ataque)
	VALUES (3, 5, 3),
    (5, 4, 4);

-- Inserção de magos
INSERT INTO public.mago(
	personagem)
	VALUES (2), (6);

-- Inserção de clérigos
INSERT INTO public.clerigo(
	personagem)
	VALUES (1), (4);


-- Inserção na definição de personagens
INSERT INTO public.definicaopersonagem(
	personagem, raca, classe)
	VALUES (1, 'Anao', 'Clerigo'),
    (2, 'Draconato', 'Mago'),
    (3, 'Humano', 'Guerreiro'),
    (4, 'MeioElfo', 'Clerigo'),
    (5, 'Draconato', 'Guerreiro'),
    (6, 'Anao', 'Mago');


-- Insert items

-- inserção de armas

INSERT INTO public.item(
	nome, preco, peso, negociante)
	VALUES ('adaga', 2, 0.5, 1), 
    ('machadinha', 5, 1, 1), 
    ('tridente', 5, 2, 1), 
	('mochila', 10, 3, NULL),
    ('besta pesada', 50, 4.5, 1);

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
	nome, preco, peso, negociante)
	VALUES ('couro', 10, 5, 4),
	('peitoral', 400, 10, 4),
	('cota de malha', 75, 27.5, 4);

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
	nome, preco, peso, negociante)
	VALUES ('mão de goblin', 2, 0.25, 4),
	('apito', 1, 0.004, 4),
	('chave velha', 1, 0.002, 4);

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

-- inserção do mapa

INSERT INTO public.mapa(
	id, largura, altura)
	VALUES (1, 48, 11),
	(2, 48, 11),
	(3, 48, 11),
	(4, 48, 11);

-- inserção mapa 1 

INSERT INTO public.bloco(
	eixo_y, eixo_x, mapa, tipo, spawn_item)
	VALUES (0, 0, 1, "wall", FALSE),
	(0, 1, 1, "wall", FALSE),
	(0, 2, 1, "wall", FALSE),
	(0, 3, 1, "wall", FALSE),
	(0, 4, 1, "wall", FALSE),
	(0, 5, 1, "wall", FALSE),
	(0, 6, 1, "wall", FALSE),
	(0, 7, 1, "wall", FALSE),
	(0, 8, 1, "wall", FALSE),
	(0, 9, 1, "wall", FALSE),
	(0, 10, 1, "wall", FALSE),
	(0, 11, 1, "wall", FALSE),
	(0, 12, 1, "wall", FALSE),
	(0, 13, 1, "wall", FALSE),
	(0, 14, 1, "wall", FALSE),
	(0, 15, 1, "wall", FALSE),
	(0, 16, 1, "wall", FALSE),
	(0, 17, 1, "wall", FALSE),
	(0, 18, 1, "wall", FALSE),
	(0, 19, 1, "wall", FALSE),
	(0, 20, 1, "wall", FALSE),
	(0, 21, 1, "wall", FALSE),
	(0, 22, 1, "wall", FALSE),
	(0, 23, 1, "wall", FALSE),
	(0, 24, 1, "wall", FALSE),
	(0, 25, 1, "wall", FALSE),
	(0, 26, 1, "wall", FALSE),
	(0, 27, 1, "wall", FALSE),
	(0, 28, 1, "wall", FALSE),
	(0, 29, 1, "wall", FALSE),
	(0, 30, 1, "wall", FALSE),
	(0, 31, 1, "wall", FALSE),
	(0, 32, 1, "wall", FALSE),
	(0, 33, 1, "wall", FALSE),
	(0, 34, 1, "wall", FALSE),
	(0, 35, 1, "wall", FALSE),
	(0, 36, 1, "wall", FALSE),
	(0, 37, 1, "wall", FALSE),
	(0, 38, 1, "wall", FALSE),
	(0, 39, 1, "wall", FALSE),
	(0, 41, 1, "wall", FALSE),
	(0, 42, 1, "wall", FALSE),
	(0, 43, 1, "wall", FALSE),
	(0, 44, 1, "wall", FALSE),
	(0, 45, 1, "wall", FALSE),
	(0, 46, 1, "wall", FALSE),
	(0, 47, 1, "wall", FALSE),
	(0, 48, 1, "wall", FALSE);

INSERT INTO public.bloco(
	eixo_y, eixo_x, mapa, tipo, spawn_item)
	VALUES (1, 0, 1, "wall", FALSE),
	(1, 1, 1, "wall", FALSE),
	(1, 2, 1, "wall", FALSE),
	(1, 3, 1, "npc", FALSE),
	(1, 4, 1, "floor", FALSE),
	(1, 5, 1, "floor", FALSE),
	(1, 6, 1, "floor", FALSE),
	(1, 7, 1, "floor", FALSE),
	(1, 8, 1, "floor", FALSE),
	(1, 9, 1, "floor", FALSE),
	(1, 10, 1, "wall", FALSE),
	(1, 11, 1, "wall", FALSE),
	(1, 12, 1, "floor", FALSE),
	(1, 13, 1, "floor", FALSE),
	(1, 14, 1, "floor", FALSE),
	(1, 15, 1, "floor", FALSE),
	(1, 16, 1, "floor", FALSE),
	(1, 17, 1, "floor", FALSE),
	(1, 18, 1, "floor", FALSE),
	(1, 19, 1, "floor", FALSE),
	(1, 20, 1, "chest", FALSE),
	(1, 21, 1, "wall", FALSE),
	(1, 22, 1, "wall", FALSE),
	(1, 23, 1, "floor", FALSE),
	(1, 24, 1, "floor", FALSE),
	(1, 25, 1, "floor", FALSE),
	(1, 26, 1, "floor", FALSE),
	(1, 27, 1, "floor", FALSE),
	(1, 28, 1, "floor", FALSE),
	(1, 29, 1, "floor", FALSE),
	(1, 30, 1, "npc", FALSE),
	(1, 31, 1, "floor", FALSE),
	(1, 32, 1, "floor", FALSE),
	(1, 33, 1, "wall", FALSE),
	(1, 34, 1, "wall", FALSE),
	(1, 35, 1, "floor", FALSE),
	(1, 36, 1, "floor", FALSE),
	(1, 37, 1, "floor", FALSE),
	(1, 38, 1, "floor", FALSE),
	(1, 39, 1, "floor", FALSE),
	(1, 41, 1, "floor", FALSE),
	(1, 42, 1, "floor", FALSE),
	(1, 43, 1, "floor", FALSE),
	(1, 44, 1, "door", FALSE),
	(1, 45, 1, "floor", FALSE),
	(1, 46, 1, "chest", FALSE),
	(1, 47, 1, "wall", FALSE),
	(1, 48, 1, "wall", FALSE);

INSERT INTO public.bloco(
	eixo_y, eixo_x, mapa, tipo, spawn_item)
	VALUES (2, 0, 1, "wall", FALSE),
	(2, 1, 1, "wall", FALSE),
	(2, 2, 1, "floor", FALSE),
	(2, 3, 1, "floor", FALSE),
	(2, 4, 1, "floor", FALSE),
	(2, 5, 1, "floor", FALSE),
	(2, 6, 1, "floor", FALSE),
	(2, 7, 1, "floor", FALSE),
	(2, 8, 1, "floor", FALSE),
	(2, 9, 1, "floor", FALSE),
	(2, 10, 1, "floor", FALSE),
	(2, 11, 1, "floor", FALSE),
	(2, 12, 1, "floor", FALSE),
	(2, 13, 1, "floor", FALSE),
	(2, 14, 1, "floor", FALSE),
	(2, 15, 1, "floor", FALSE),
	(2, 16, 1, "floor", FALSE),
	(2, 17, 1, "floor", FALSE),
	(2, 18, 1, "floor", FALSE),
	(2, 19, 1, "floor", FALSE),
	(2, 20, 1, "floor", FALSE),
	(2, 21, 1, "floor", FALSE),
	(2, 22, 1, "wall", FALSE),
	(2, 23, 1, "wall", FALSE),
	(2, 24, 1, "wall", FALSE),
	(2, 25, 1, "wall", FALSE),
	(2, 26, 1, "wall", FALSE),
	(2, 27, 1, "wall", FALSE),
	(2, 28, 1, "wall", FALSE),
	(2, 29, 1, "wall", FALSE),
	(2, 30, 1, "floor", FALSE),
	(2, 31, 1, "floor", FALSE),
	(2, 32, 1, "floor", FALSE),
	(2, 33, 1, "floor", FALSE),
	(2, 34, 1, "floor", FALSE),
	(2, 35, 1, "floor", FALSE),
	(2, 36, 1, "floor", FALSE),
	(2, 37, 1, "trap", FALSE),
	(2, 38, 1, "floor", FALSE),
	(2, 39, 1, "floor", FALSE),
	(2, 41, 1, "floor", FALSE),
	(2, 42, 1, "floor", FALSE),
	(2, 43, 1, "floor", FALSE),
	(2, 44, 1, "floor", FALSE),
	(2, 45, 1, "floor", FALSE),
	(2, 46, 1, "wall", FALSE),
	(2, 47, 1, "wall", FALSE),
	(2, 48, 1, "wall", FALSE);

INSERT INTO public.bloco(
	eixo_y, eixo_x, mapa, tipo, spawn_item)
	VALUES (3, 0, 1, "wall", FALSE),
	(3, 1, 1, "wall", FALSE),
	(3, 2, 1, "floor", FALSE),
	(3, 3, 1, "floor", FALSE),
	(3, 4, 1, "floor", FALSE),
	(3, 5, 1, "floor", FALSE),
	(3, 6, 1, "floor", FALSE),
	(3, 7, 1, "trap", FALSE),
	(3, 8, 1, "floor", FALSE),
	(3, 9, 1, "floor", FALSE),
	(3, 10, 1, "floor", FALSE),
	(3, 11, 1, "floor", FALSE),
	(3, 12, 1, "floor", FALSE),
	(3, 13, 1, "wall", FALSE),
	(3, 14, 1, "wall", FALSE),
	(3, 15, 1, "floor", FALSE),
	(3, 16, 1, "floor", FALSE),
	(3, 17, 1, "floor", FALSE),
	(3, 18, 1, "floor", FALSE),
	(3, 19, 1, "floor", FALSE),
	(3, 20, 1, "floor", FALSE),
	(3, 21, 1, "floor", FALSE),
	(3, 22, 1, "floor", FALSE),
	(3, 23, 1, "floor", FALSE),
	(3, 24, 1, "floor", FALSE),
	(3, 25, 1, "npc", FALSE),
	(3, 26, 1, "floor", FALSE),
	(3, 27, 1, "floor", FALSE),
	(3, 28, 1, "wall", FALSE),
	(3, 29, 1, "wall", FALSE),
	(3, 30, 1, "wall", FALSE),
	(3, 31, 1, "wall", FALSE),
	(3, 32, 1, "wall", FALSE),
	(3, 33, 1, "trap", FALSE),
	(3, 34, 1, "floor", FALSE),
	(3, 35, 1, "floor", FALSE),
	(3, 36, 1, "floor", FALSE),
	(3, 37, 1, "floor", FALSE),
	(3, 38, 1, "floor", FALSE),
	(3, 39, 1, "floor", FALSE),
	(3, 41, 1, "floor", FALSE),
	(3, 42, 1, "floor", FALSE),
	(3, 43, 1, "floor", FALSE),
	(3, 44, 1, "floor", FALSE),
	(3, 45, 1, "floor", FALSE),
	(3, 46, 1, "wall", FALSE),
	(3, 47, 1, "wall", FALSE),
	(3, 48, 1, "wall", FALSE);

INSERT INTO public.bloco(
	eixo_y, eixo_x, mapa, tipo, spawn_item)
	VALUES (4, 0, 1, "wall", FALSE),
	(4, 1, 1, "wall", FALSE),
	(4, 2, 1, "floor", FALSE),
	(4, 3, 1, "floor", FALSE),
	(4, 4, 1, "floor", FALSE),
	(4, 5, 1, "floor", FALSE),
	(4, 6, 1, "floor", FALSE),
	(4, 7, 1, "floor", FALSE),
	(4, 8, 1, "floor", FALSE),
	(4, 9, 1, "floor", FALSE),
	(4, 10, 1, "floor", FALSE),
	(4, 11, 1, "floor", FALSE),
	(4, 12, 1, "floor", FALSE),
	(4, 13, 1, "wall", FALSE),
	(4, 14, 1, "wall", FALSE),
	(4, 15, 1, "chest", FALSE),
	(4, 16, 1, "floor", FALSE),
	(4, 17, 1, "floor", FALSE),
	(4, 18, 1, "floor", FALSE),
	(4, 19, 1, "floor", FALSE),
	(4, 20, 1, "floor", FALSE),
	(4, 21, 1, "floor", FALSE),
	(4, 22, 1, "floor", FALSE),
	(4, 23, 1, "floor", FALSE),
	(4, 24, 1, "floor", FALSE),
	(4, 25, 1, "floor", FALSE),
	(4, 26, 1, "floor", FALSE),
	(4, 27, 1, "floor", FALSE),
	(4, 28, 1, "wall", FALSE),
	(4, 29, 1, "wall", FALSE),
	(4, 30, 1, "chest", FALSE),
	(4, 31, 1, "floor", FALSE),
	(4, 32, 1, "wall", FALSE),
	(4, 33, 1, "wall", FALSE),
	(4, 34, 1, "wall", FALSE),
	(4, 35, 1, "wall", FALSE),
	(4, 36, 1, "wall", FALSE),
	(4, 37, 1, "door", FALSE),
	(4, 38, 1, "door", FALSE),
	(4, 39, 1, "door", FALSE),
	(4, 41, 1, "wall", FALSE),
	(4, 42, 1, "wall", FALSE),
	(4, 43, 1, "wall", FALSE),
	(4, 44, 1, "wall", FALSE),
	(4, 45, 1, "wall", FALSE),
	(4, 46, 1, "wall", FALSE),
	(4, 47, 1, "wall", FALSE),
	(4, 48, 1, "wall", FALSE);

INSERT INTO public.bloco(
	eixo_y, eixo_x, mapa, tipo, spawn_item)
	VALUES (5, 0, 1, "floor", FALSE),
	(5, 1, 1, "floor", FALSE),
	(5, 2, 1, "floor", FALSE),
	(5, 3, 1, "floor", FALSE),
	(5, 4, 1, "floor", FALSE),
	(5, 5, 1, "floor", FALSE),
	(5, 6, 1, "floor", FALSE),
	(5, 7, 1, "floor", FALSE),
	(5, 8, 1, "floor", FALSE),
	(5, 9, 1, "floor", FALSE),
	(5, 10, 1, "floor", FALSE),
	(5, 11, 1, "floor", FALSE),
	(5, 12, 1, "floor", FALSE),
	(5, 13, 1, "trap", FALSE),
	(5, 14, 1, "floor", FALSE),
	(5, 15, 1, "floor", FALSE),
	(5, 16, 1, "floor", FALSE),
	(5, 17, 1, "floor", FALSE),
	(5, 18, 1, "floor", FALSE),
	(5, 19, 1, "floor", FALSE),
	(5, 20, 1, "floor", FALSE),
	(5, 21, 1, "floor", FALSE),
	(5, 22, 1, "floor", FALSE),
	(5, 23, 1, "floor", FALSE),
	(5, 24, 1, "trap", FALSE),
	(5, 25, 1, "floor", FALSE),
	(5, 26, 1, "floor", FALSE),
	(5, 27, 1, "floor", FALSE),
	(5, 28, 1, "floor", FALSE),
	(5, 29, 1, "floor", FALSE),
	(5, 30, 1, "floor", FALSE),
	(5, 31, 1, "floor", FALSE),
	(5, 32, 1, "floor", FALSE),
	(5, 33, 1, "npc", FALSE),
	(5, 34, 1, "floor", FALSE),
	(5, 35, 1, "floor", FALSE),
	(5, 36, 1, "floor", FALSE),
	(5, 37, 1, "floor", FALSE),
	(5, 38, 1, "floor", FALSE),
	(5, 39, 1, "floor", FALSE),
	(5, 41, 1, "floor", FALSE),
	(5, 42, 1, "floor", FALSE),
	(5, 43, 1, "trap", FALSE),
	(5, 44, 1, "floor", FALSE),
	(5, 45, 1, "floor", FALSE),
	(5, 46, 1, "floor", FALSE),
	(5, 47, 1, "floor", FALSE),
	(5, 48, 1, "door", FALSE);

INSERT INTO public.bloco(
	eixo_y, eixo_x, mapa, tipo, spawn_item)
	VALUES (6, 0, 1, "character", FALSE),
	(6, 1, 1, "floor", FALSE),
	(6, 2, 1, "floor", FALSE),
	(6, 3, 1, "floor", FALSE),
	(6, 4, 1, "floor", FALSE),
	(6, 5, 1, "floor", FALSE),
	(6, 6, 1, "floor", FALSE),
	(6, 7, 1, "floor", FALSE),
	(6, 8, 1, "floor", FALSE),
	(6, 9, 1, "floor", FALSE),
	(6, 10, 1, "floor", FALSE),
	(6, 11, 1, "floor", FALSE),
	(6, 12, 1, "floor", FALSE),
	(6, 13, 1, "trap", FALSE),
	(6, 14, 1, "floor", FALSE),
	(6, 15, 1, "floor", FALSE),
	(6, 16, 1, "floor", FALSE),
	(6, 17, 1, "floor", FALSE),
	(6, 18, 1, "floor", FALSE),
	(6, 19, 1, "floor", FALSE),
	(6, 20, 1, "floor", FALSE),
	(6, 21, 1, "floor", FALSE),
	(6, 22, 1, "floor", FALSE),
	(6, 23, 1, "floor", FALSE),
	(6, 24, 1, "floor", FALSE),
	(6, 25, 1, "floor", FALSE),
	(6, 26, 1, "floor", FALSE),
	(6, 27, 1, "floor", FALSE),
	(6, 28, 1, "trap", FALSE),
	(6, 29, 1, "floor", FALSE),
	(6, 30, 1, "floor", FALSE),
	(6, 31, 1, "floor", FALSE),
	(6, 32, 1, "floor", FALSE),
	(6, 33, 1, "floor", FALSE),
	(6, 34, 1, "floor", FALSE),
	(6, 35, 1, "floor", FALSE),
	(6, 36, 1, "floor", FALSE),
	(6, 37, 1, "floor", FALSE),
	(6, 38, 1, "floor", FALSE),
	(6, 39, 1, "floor", FALSE),
	(6, 41, 1, "floor", FALSE),
	(6, 42, 1, "floor", FALSE),
	(6, 43, 1, "floor", FALSE),
	(6, 44, 1, "floor", FALSE),
	(6, 45, 1, "floor", FALSE),
	(6, 46, 1, "floor", FALSE),
	(6, 47, 1, "floor", FALSE),
	(6, 48, 1, "door", FALSE);

INSERT INTO public.bloco(
	eixo_y, eixo_x, mapa, tipo, spawn_item)
	VALUES (7, 0, 1, "floor", FALSE),
	(7, 1, 1, "floor", FALSE),
	(7, 2, 1, "floor", FALSE),
	(7, 3, 1, "floor", FALSE),
	(7, 4, 1, "floor", FALSE),
	(7, 5, 1, "floor", FALSE),
	(7, 6, 1, "floor", FALSE),
	(7, 7, 1, "floor", FALSE),
	(7, 8, 1, "floor", FALSE),
	(7, 9, 1, "floor", FALSE),
	(7, 10, 1, "floor", FALSE),
	(7, 11, 1, "floor", FALSE),
	(7, 12, 1, "floor", FALSE),
	(7, 13, 1, "wall", FALSE),
	(7, 14, 1, "wall", FALSE),
	(7, 15, 1, "chest", FALSE),
	(7, 16, 1, "floor", FALSE),
	(7, 17, 1, "floor", FALSE),
	(7, 18, 1, "floor", FALSE),
	(7, 19, 1, "floor", FALSE),
	(7, 20, 1, "floor", FALSE),
	(7, 21, 1, "floor", FALSE),
	(7, 22, 1, "floor", FALSE),
	(7, 23, 1, "floor", FALSE),
	(7, 24, 1, "floor", FALSE),
	(7, 25, 1, "floor", FALSE),
	(7, 26, 1, "floor", FALSE),
	(7, 27, 1, "npc", FALSE),
	(7, 28, 1, "wall", FALSE),
	(7, 29, 1, "wall", FALSE),
	(7, 30, 1, "npc", FALSE),
	(7, 31, 1, "floor", FALSE),
	(7, 32, 1, "floor", FALSE),
	(7, 33, 1, "floor", FALSE),
	(7, 34, 1, "floor", FALSE),
	(7, 35, 1, "floor", FALSE),
	(7, 36, 1, "floor", FALSE),
	(7, 37, 1, "floor", FALSE),
	(7, 38, 1, "floor", FALSE),
	(7, 39, 1, "floor", FALSE),
	(7, 41, 1, "floor", FALSE),
	(7, 42, 1, "floor", FALSE),
	(7, 43, 1, "floor", FALSE),
	(7, 44, 1, "floor", FALSE),
	(7, 45, 1, "floor", FALSE),
	(7, 46, 1, "floor", FALSE),
	(7, 47, 1, "floor", FALSE),
	(7, 48, 1, "door", FALSE);

INSERT INTO public.bloco(
	eixo_y, eixo_x, mapa, tipo, spawn_item)
	VALUES (8, 0, 1, "wall", FALSE),
	(8, 1, 1, "wall", FALSE),
	(8, 2, 1, "floor", FALSE),
	(8, 3, 1, "floor", FALSE),
	(8, 4, 1, "floor", FALSE),
	(8, 5, 1, "floor", FALSE),
	(8, 6, 1, "floor", FALSE),
	(8, 7, 1, "floor", FALSE),
	(8, 8, 1, "floor", FALSE),
	(8, 9, 1, "floor", FALSE),
	(8, 10, 1, "floor", FALSE),
	(8, 11, 1, "floor", FALSE),
	(8, 12, 1, "floor", FALSE),
	(8, 13, 1, "wall", FALSE),
	(8, 14, 1, "wall", FALSE),
	(8, 15, 1, "floor", FALSE),
	(8, 16, 1, "floor", FALSE),
	(8, 17, 1, "floor", FALSE),
	(8, 18, 1, "floor", FALSE),
	(8, 19, 1, "floor", FALSE),
	(8, 20, 1, "floor", FALSE),
	(8, 21, 1, "trap", FALSE),
	(8, 22, 1, "floor", FALSE),
	(8, 23, 1, "floor", FALSE),
	(8, 24, 1, "floor", FALSE),
	(8, 25, 1, "floor", FALSE),
	(8, 26, 1, "floor", FALSE),
	(8, 27, 1, "floor", FALSE),
	(8, 28, 1, "wall", FALSE),
	(8, 29, 1, "wall", FALSE),
	(8, 30, 1, "floor", FALSE),
	(8, 31, 1, "floor", FALSE),
	(8, 32, 1, "floor", FALSE),
	(8, 33, 1, "floor", FALSE),
	(8, 34, 1, "floor", FALSE),
	(8, 35, 1, "floor", FALSE),
	(8, 36, 1, "floor", FALSE),
	(8, 37, 1, "floor", FALSE),
	(8, 38, 1, "floor", FALSE),
	(8, 39, 1, "floor", FALSE),
	(8, 41, 1, "floor", FALSE),
	(8, 42, 1, "floor", FALSE),
	(8, 43, 1, "floor", FALSE),
	(8, 44, 1, "floor", FALSE),
	(8, 45, 1, "floor", FALSE),
	(8, 46, 1, "wall", FALSE),
	(8, 47, 1, "wall", FALSE),
	(8, 48, 1, "wall", FALSE);

INSERT INTO public.bloco(
	eixo_y, eixo_x, mapa, tipo, spawn_item)
	VALUES (9, 0, 1, "wall", FALSE),
	(9, 1, 1, "wall", FALSE),
	(9, 2, 1, "floor", FALSE),
	(9, 3, 1, "floor", FALSE),
	(9, 4, 1, "floor", FALSE),
	(9, 5, 1, "floor", FALSE),
	(9, 6, 1, "trap", FALSE),
	(9, 7, 1, "floor", FALSE),
	(9, 8, 1, "floor", FALSE),
	(9, 9, 1, "floor", FALSE),
	(9, 10, 1, "wall", FALSE),
	(9, 11, 1, "floor", FALSE),
	(9, 12, 1, "floor", FALSE),
	(9, 13, 1, "floor", FALSE),
	(9, 14, 1, "floor", FALSE),
	(9, 15, 1, "floor", FALSE),
	(9, 16, 1, "floor", FALSE),
	(9, 17, 1, "floor", FALSE),
	(9, 18, 1, "floor", FALSE),
	(9, 19, 1, "floor", FALSE),
	(9, 20, 1, "floor", FALSE),
	(9, 21, 1, "floor", FALSE),
	(9, 22, 1, "floor", FALSE),
	(9, 23, 1, "floor", FALSE),
	(9, 24, 1, "floor", FALSE),
	(9, 25, 1, "floor", FALSE),
	(9, 26, 1, "floor", FALSE),
	(9, 27, 1, "floor", FALSE),
	(9, 28, 1, "floor", FALSE),
	(9, 29, 1, "floor", FALSE),
	(9, 30, 1, "floor", FALSE),
	(9, 31, 1, "floor", FALSE),
	(9, 32, 1, "floor", FALSE),
	(9, 33, 1, "floor", FALSE),
	(9, 34, 1, "floor", FALSE),
	(9, 35, 1, "floor", FALSE),
	(9, 36, 1, "floor", FALSE),
	(9, 37, 1, "floor", FALSE),
	(9, 38, 1, "floor", FALSE),
	(9, 39, 1, "floor", FALSE),
	(9, 41, 1, "floor", FALSE),
	(9, 42, 1, "floor", FALSE),
	(9, 43, 1, "floor", FALSE),
	(9, 44, 1, "floor", FALSE),
	(9, 45, 1, "wall", FALSE),
	(9, 46, 1, "wall", FALSE),
	(9, 47, 1, "wall", FALSE),
	(9, 48, 1, "wall", FALSE);

INSERT INTO public.bloco(
	eixo_y, eixo_x, mapa, tipo, spawn_item)
	VALUES (10, 0, 1, "wall", FALSE),
	(10, 1, 1, "wall", FALSE),
	(10, 2, 1, "wall", FALSE),
	(10, 3, 1, "floor", FALSE),
	(10, 4, 1, "floor", FALSE),
	(10, 5, 1, "floor", FALSE),
	(10, 6, 1, "floor", FALSE),
	(10, 7, 1, "floor", FALSE),
	(10, 8, 1, "floor", FALSE),
	(10, 9, 1, "floor", FALSE),
	(10, 10, 1, "wall", FALSE),
	(10, 11, 1, "wall", FALSE),
	(10, 12, 1, "floor", FALSE),
	(10, 13, 1, "floor", FALSE),
	(10, 14, 1, "floor", FALSE),
	(10, 15, 1, "floor", FALSE),
	(10, 16, 1, "floor", FALSE),
	(10, 17, 1, "floor", FALSE),
	(10, 18, 1, "floor", FALSE),
	(10, 19, 1, "floor", FALSE),
	(10, 20, 1, "floor", FALSE),
	(10, 21, 1, "wall", FALSE),
	(10, 22, 1, "wall", FALSE),
	(10, 23, 1, "floor", FALSE),
	(10, 24, 1, "floor", FALSE),
	(10, 25, 1, "floor", FALSE),
	(10, 26, 1, "floor", FALSE),
	(10, 27, 1, "floor", FALSE),
	(10, 28, 1, "floor", FALSE),
	(10, 29, 1, "floor", FALSE),
	(10, 30, 1, "trap", FALSE),
	(10, 31, 1, "floor", FALSE),
	(10, 32, 1, "floor", FALSE),
	(10, 33, 1, "wall", FALSE),
	(10, 34, 1, "wall", FALSE),
	(10, 35, 1, "floor", FALSE),
	(10, 36, 1, "floor", FALSE),
	(10, 37, 1, "floor", FALSE),
	(10, 38, 1, "floor", FALSE),
	(10, 39, 1, "floor", FALSE),
	(10, 41, 1, "floor", FALSE),
	(10, 42, 1, "floor", FALSE),
	(10, 43, 1, "floor", FALSE),
	(10, 44, 1, "wall", FALSE),
	(10, 45, 1, "wall", FALSE),
	(10, 46, 1, "wall", FALSE),
	(10, 47, 1, "wall", FALSE),
	(10, 48, 1, "wall", FALSE);

INSERT INTO public.bloco(
	eixo_y, eixo_x, mapa, tipo, spawn_item)
	VALUES (11, 0, 1, "wall", FALSE),
	(11, 1, 1, "wall", FALSE),
	(11, 2, 1, "wall", FALSE),
	(11, 3, 1, "wall", FALSE),
	(11, 4, 1, "wall", FALSE),
	(11, 5, 1, "wall", FALSE),
	(11, 6, 1, "wall", FALSE),
	(11, 7, 1, "wall", FALSE),
	(11, 8, 1, "wall", FALSE),
	(11, 9, 1, "wall", FALSE),
	(11, 10, 1, "wall", FALSE),
	(11, 11, 1, "wall", FALSE),
	(11, 12, 1, "wall", FALSE),
	(11, 13, 1, "wall", FALSE),
	(11, 14, 1, "wall", FALSE),
	(11, 15, 1, "wall", FALSE),
	(11, 16, 1, "wall", FALSE),
	(11, 17, 1, "wall", FALSE),
	(11, 18, 1, "wall", FALSE),
	(11, 19, 1, "wall", FALSE),
	(11, 20, 1, "wall", FALSE),
	(11, 21, 1, "wall", FALSE),
	(11, 22, 1, "wall", FALSE),
	(11, 23, 1, "wall", FALSE),
	(11, 24, 1, "wall", FALSE),
	(11, 25, 1, "wall", FALSE),
	(11, 26, 1, "wall", FALSE),
	(11, 27, 1, "wall", FALSE),
	(11, 28, 1, "wall", FALSE),
	(11, 29, 1, "wall", FALSE),
	(11, 30, 1, "wall", FALSE),
	(11, 31, 1, "wall", FALSE),
	(11, 32, 1, "wall", FALSE),
	(11, 33, 1, "wall", FALSE),
	(11, 34, 1, "wall", FALSE),
	(11, 35, 1, "wall", FALSE),
	(11, 36, 1, "wall", FALSE),
	(11, 37, 1, "wall", FALSE),
	(11, 38, 1, "wall", FALSE),
	(11, 39, 1, "wall", FALSE),
	(11, 41, 1, "wall", FALSE),
	(11, 42, 1, "wall", FALSE),
	(11, 43, 1, "wall", FALSE),
	(11, 44, 1, "wall", FALSE),
	(11, 45, 1, "wall", FALSE),
	(11, 46, 1, "wall", FALSE),
	(11, 47, 1, "wall", FALSE),
	(11, 48, 1, "wall", FALSE);