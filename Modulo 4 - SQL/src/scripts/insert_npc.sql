INSERT INTO public.npc (
	eixo_x, eixo_y, mapa, tipo, vida)
	VALUES (1, 3, 1, 'negociante', 100), 
    (8, 5, 2, 'viajante', 100),  
    (10, 4, 3, 'negociante', 100);

INSERT INTO public.negociante (
	npc, montante)
	VALUES (1, 1000), 
    (3, 3000);  

INSERT INTO public.item(nome, preco, peso, negociante) 
    VALUES ('faca mortifera', 600, 1, 1);

INSERT INTO public.itemtipo(
	item, tipo)
	VALUES ('faca mortifera', 'arma');