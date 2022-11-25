SELECT id, COALESCE(nombre, 'no aplica'),fecha_nacimiento 
FROM public.pasajero
WHERE id=1;

SELECT NULLIF (0,0);

SELECT GREATEST (0,1,2,3,4,5,6,7);
SELECT LEAST (0,1,2,3,4,5,6,7);

SELECT id, nombre, fecha_nacimiento,
CASE
WHEN fecha_nacimiento > '2000-01-01'
THEN 'Pollos'
ELSE
'Veteranos'
END
FROM public.pasajero;

SELECT id, nombre, fecha_nacimiento,
CASE
WHEN nombre ILIKE 'g%' AND fecha_nacimiento > '2000-01-01'
THEN 'cumple'
ELSE
'no cumple'
END
FROM public.pasajero;