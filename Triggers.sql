--Creamos nuestra funcion que va a modificarla tabla que creeamos con el disparador
CREATE OR REPLACE FUNCTION public.mipl4(
	)
    RETURNS integer
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
	rec record;
	contador integer :=0;
BEGIN
	FOR rec IN SELECT * FROM pasajero LOOP
	RAISE NOTICE 'UN PASAJERO SE LLAMA %', rec.nombre;
	contador := contador +1;
	END LOOP;
	--lo que queremos modificar con mi funcion
	INSERT INTO conteo_pasajeros (total, tiempo_cuando_sehizo)
	VALUES (contador, now());
	RAISE NOTICE 'Conteo es %', contador;
	RETURN contador;
END
$BODY$;

	
SELECT mipl4();

--vamos a eliminar un pasajero y a volver a ejecutar nuestra funcion para ver que si este funcionando el contador
DELETE FROM pasajero 
WHERE id=4;

--ahora vamos a crear nuestro trigger, y para esto debemos cambiar el return a trigger pero como la funcion no se puede actualizar, vamos a crear otra y a eliminar la pasada
CREATE OR REPLACE FUNCTION public.mipl5(
	)
    RETURNS TRIGGER
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
	rec record;
	contador integer :=0;
BEGIN
	FOR rec IN SELECT * FROM pasajero LOOP
	contador := contador +1;
	END LOOP;
	INSERT INTO conteo_pasajeros (total, tiempo_cuando_sehizo)
	VALUES (contador, now());
END
$BODY$;

--Vamos a adjuntar el trigger a la tabla

CREATE TRIGGER mitrigger
AFTER INSERT
ON pasajero
FOR EACH ROW
EXECUTE PROCEDURE mipl5();

--ahora vamos a insertar un pasajero para ver como funciona mi trigger

INSERT INTO pasajero (nombre, direccion_residencia, fecha_nacimiento) VALUES('nombre trigger', 'direccion', '2000-01-01');

--despues volvemos a ver nuestra tabla conteo_pasajeros para ver si el disparador trigger funciono cuando inserte un pasajero
SELECT * FROM conteo_pasajeros;

--vamos a insertar otro pasajero y a evaluar nuevamente
INSERT INTO pasajero (nombre, direccion_residencia, fecha_nacimiento) VALUES('Jorge Munera', 'el troncal', '1992-11-29');
SELECT * FROM conteo_pasajeros;