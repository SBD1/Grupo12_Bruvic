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


INSERT INTO public.habilidade_tipo(
	nome, tipo)
	VALUES ('Rajada mística', 'Magia'),
		   ('Toque arrepiante', 'Magia'),
		   ('Palavra curativa', 'Cura'),
		   ('Cura em massa', 'Cura'),
		   ('Perdição', 'Truque'),
		   ('Enfeitiçar pessoa', 'Truque'),
		   ('Ataque de oportunidade', 'Ataque'),
		   ('Soco sério', 'Ataque');

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
           