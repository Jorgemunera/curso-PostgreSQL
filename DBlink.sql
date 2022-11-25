--Lo primero para simular la conexion a una base de datos remota
--será crear una base de datos nueva en nuestro servidor
--despues creamos una tabla de clientes vip
--inseramos un dato y con esta tabla ahora si desde nuestra base
--de datos vamos hacer la coexion remota, y le damos desconectar
--a esta base de datos nueva que hemos creado(remota)
INSERT INTO public.vip(
	id, fecha)
	VALUES (50, '2010-01-01');
	
--Ahora desde nuestra base de datos, vamos hacer una consulta para 
--ver de nuestros pasajeros cual es el vip y que me traiga el vip

-- Para crear la extencion de la funcion DBlink en
--nuestra base de datos creamos la extencion
CREATE EXTENSION dblink;

SELECT * FROM
dblink ('dbname=remota 
	   port=5432 
	   host=127.0.0.1 
	   user=usuario_consulta 
	   password=lolo1992',
	   'SELECT id,fecha FROM vip')
	   AS datos_remotos (id integer, fecha date); 
	   
-- ahora vamos a cruzar nuestros datos locales con los remotos
--el cruce con la tabla se hace con la pablabra ON o con USING

SELECT * FROM pasajero
JOIN
dblink ('dbname=remota 
	   port=5432 
	   host=127.0.0.1 
	   user=usuario_consulta 
	   password=lolo1992',
	   'SELECT id,fecha FROM vip')
	   AS datos_remotos (id integer, fecha date)
-- Esta es una manera de hacerlo ON (pasajero.id=datos_remotos.id);
--USING se utiliza cuando tenemos columnas iguales de donde vamos hacer la union
USING (id);