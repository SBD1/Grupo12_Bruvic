INSERT INTO public.mapa (
	largura, altura)
	VALUES (15, 15), 
    (20, 25), 
    (10, 5);


INSERT INTO public.bloco (
	eixo_x, eixo_y, mapa, tipo)
	VALUES (1, 3, 1, 'cordilheira'), 
    (8, 5, 2, 'floresta'), 
    (10, 4, 3, 'praia');