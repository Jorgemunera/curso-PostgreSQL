--Los PL se componen de nombres de funciones, declaraciones y bloques de codigo
--un bloque de codigo se ejecuta con la palabra DO
DO $$
DECLARE
	rec record;
	contador integer :=0;
BEGIN
	FOR rec IN SELECT * FROM pasajero LOOP
	RAISE NOTICE 'UN PASAJERO SE LLAMA %', rec.nombre;
	RAISE NOTICE 'Conteo %', contador+1;
	contador := contador +1;
	END LOOP;
	RAISE NOTICE 'Conteo es %', contador;
END
$$

--Para poder encapsular y meter en una funcion que se pueda utilizar hacemos lo siguiente
CREATE FUNCTION miPl() 
	RETURNS void
	AS $$
DECLARE
	rec record;
	contador integer :=0;
BEGIN
	FOR rec IN SELECT * FROM pasajero LOOP
	RAISE NOTICE 'UN PASAJERO SE LLAMA %', rec.nombre;
	RAISE NOTICE 'Conteo %', contador+1;
	contador := contador +1;
	END LOOP;
	RAISE NOTICE 'Conteo es %', contador;
END
$$
LANGUAGE PLPGSQL;

--Para llamar la funcion
SELECT miPl();

--Si queremos usar nuestra PL para que retorne valores
--para actualizar nuestra funcion OR REPLACE, si el tipo de datos no es actualizable no va a dejar actualizar
CREATE FUNCTION miPl2() 
	RETURNS integer
	AS $$
DECLARE
	rec record;
	contador integer :=0;
BEGIN
	FOR rec IN SELECT * FROM pasajero LOOP
	RAISE NOTICE 'UN PASAJERO SE LLAMA %', rec.nombre;
	RAISE NOTICE 'Conteo %', contador+1;
	contador := contador +1;
	END LOOP;
	RAISE NOTICE 'Conteo es %', contador;
	RETURN contador;
END
$$
LANGUAGE PLPGSQL;

SELECT mipl2();