INSERT INTO public.estacion(
	id, nombre, direccion)
	VALUES (1, 'nombre', 'direccion')
	ON CONFLICT DO NOTHING;

INSERT INTO public.estacion(
	id, nombre, direccion)
	VALUES (1, 'nombre', 'direccion')
	ON CONFLICT(id) DO UPDATE SET nombre='nombre', direccion='direccion';

INSERT INTO public.estacion(
	nombre, direccion)
	VALUES ('nueva estacion', 'direccion nueva')
	RETURNING *;

SELECT nombre
	FROM public.pasajero
	WHERE nombre ILIKE 'o%'
	
SELECT nombre
	FROM public.pasajero
	WHERE nombre LIKE 'o%'

SELECT *
	FROM public.tren
	WHERE modelo IS NOT NULL;
	
