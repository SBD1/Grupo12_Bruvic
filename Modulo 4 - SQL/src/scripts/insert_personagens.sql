-- Inserção em personagens 
INSERT INTO public.personagem(
	id, vida, experiencia, nivel, nome, destreza, forca, constituicao, carisma, sabedoria, inteligencia, classe_de_armadura)
	VALUES (1, 18, 0, 1, 'bolinha', 16, 15, 10, 11, 18, 19, 17),
    (2, 22, 0, 1, 'ada', 11, 12, 19, 11, 17, 16, 11),
    (3, 19, 0, 1, 'kiteria', 18, 18, 10, 18, 10, 19, 14),
    (4, 25, 0, 1, 'alby', 15, 15, 19, 16, 14, 10, 20),
    (5, 21, 0, 1, 'cordeia', 12, 16, 20, 11, 15, 12, 13),
    (6, 23, 0, 1, 'thomas', 18, 15, 14, 13, 13, 13, 11);


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