BEGIN;

INSERT INTO public.estacion(
	nombre, direccion)
	VALUES ('estacion transaccion', 'direccion');

INSERT INTO public.tren(
	modelo, capacidad)
	VALUES ('modelo transaccion', 123);

--Si colocamos commit escritode una vez se ejecuta y hace
--la insercion, si no se escribe el commit se deja la
--transaccion abierta
--COMMIT;

--Si hacemos rollback todo lo que hacemos se deshace osea
--que no hace la insercion
--ROLLBACK;

COMMIT;

--Ahora vamos a ejecutar la misma transaccion pero haremos que
--sea erronea

BEGIN;

INSERT INTO public.tren(
	modelo, capacidad)
	VALUES ('modelo transaccion 2', 124);
	
INSERT INTO public.estacion(
	id, nombre, direccion)
	VALUES (100, 'estacion transaccion 2', 'direccion 2');

--como la transaccion va a fallar porque la estacion 100 ya
--existe, a pesar de que le hagamos commit se ejecutara un 
--rollback
--si esto mismo lo ejecutamos fuera del bloque de begin y commit
--lo que pasaria normalmente es que se inserta el tren y la estacion no
COMMIT;

