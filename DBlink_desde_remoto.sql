SELECT * FROM vip
JOIN
dblink ('dbname=transporte 
	   port=5432 
	   host=127.0.0.1 
	   user=usuario_consulta 
	   password=lolo1992',
	   'SELECT id,nombre,direccion_residencia,fecha_nacimiento FROM pasajero')
	   AS datos_remotos (id integer, nombre varchar, direccion_residencia varchar, 
						 fecha_nacimiento date)
USING (id);