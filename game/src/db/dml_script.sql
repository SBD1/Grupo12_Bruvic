-- Insert Habilidades

INSERT INTO public.habilidade(
	nome, descricao, nivel)
	VALUES ('Rajada mística', 'Um feixe de energia crepitante vai em direção a uma criatura dentro do alcance. Realize uma jogada de ataque à distância com magia contra o alvo.', 1), -- Magia
		   ('Toque arrepiante', 'Você cria uma mão esquelética fantasmagórica no espaço de uma criatura, dentro do alcance.', 1),-- Magia
		   ('Palavra curativa', 'Você cria uma mão esquelética fantasmagórica no espaço de uma criatura, dentro do alcance.
Uma criatura, à sua escolha, que você possa ver dentro do alcance recupera uma quantidade de pontos de vida.', 1), -- Cura 
		   ('Cura em massa', 'À medida que você brada palavras de restauração, até seis criaturas, à sua escolha, que você possa ver, dentro do alcance, recuperam uma quantidade de pontos de vida', 1), -- Cura
		   ('Perdição', ' Até três criaturas, à sua escolha, que você possa ver dentro do alcance, devem realizar um teste de resistência de Carisma, se o alvo falhar, ele tem desvantagens em ataque e resistência.', 1), -- Truque
		   ('Enfeitiçar pessoa', 'Você tenta enfeitiçar um humanoide que você possa ver dentro do alcance. Ele deve realizar um teste de resistência de Sabedoria, se ele falhar, ele obedece as suas ordens durante um tempo.', 1), -- Truque
		   ('Ataque de oportunidade', 'Um Ataque de Oportunidade “interrompe” o fluxo do combate; seu personagem aproveita um lapso de defesa de seu oponente e dá um tabefe nele antes que ele venha a agir.', 1), -- Ataque 
		   ('Soco sério', 'Da série mortalmente séria, o soco sério mata qualquer inimigo instantaneamente', 1); -- Ataque 


--INSERT INTO public.habilidade_tipo(
--	nome, tipo)
--	VALUES ('Rajada mística', 'Magia'),
--		   ('Toque arrepiante', 'Magia'),
--		   ('Palavra curativa', 'Cura'),
--		   ('Cura em massa', 'Cura'),
--		   ('Perdição', 'Truque'),
--		   ('Enfeitiçar pessoa', 'Truque'),
--		   ('Ataque de oportunidade', 'Ataque'),
--		   ('Soco sério', 'Ataque');

INSERT INTO public.ataque(
	habilidade, dano)
	VALUES ('Ataque de oportunidade', 8),
		   ('Soco sério', 42);

INSERT INTO public.cura(
	habilidade, recuperacao)
	VALUES ('Palavra curativa', 8),
		   ('Cura em massa', 4);

INSERT INTO public.magia(
	habilidade, modificador)
	VALUES ('Rajada mística', 12),
		   ('Toque arrepiante', 8);


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
	('mochila', 10, 1),
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
           