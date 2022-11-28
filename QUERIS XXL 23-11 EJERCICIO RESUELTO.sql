/* 
A - 10 primeros caracteres del nombre de la cancion en mayuscula
upper (substring(nombre,1,10))

B - años de antiguedad 
concat (timestampdiff(YEAR,publicada,NOW())," años"

C - Peso en KBytes en numero entero (sin decimales)
round (bytes/1024)   -> o sea dividir los bytes sobre 1024
 
D - Precio formateado con 3 decimales 
concat("$ ",format(precio_unitario,3))

E - Primer compositor de la cancion ()
case 
			when compositor is null or compositor = '' then '<sin compositor>'   --> Busca los compositores nulos o sin compositor 
            when compositor not like '%,%' then compositor	--> busca los compositores que no tiene una "coma" o sea son un solo compositor
            else left (compositor, locate (',',compositor) -1) --> busca los compositores que tienen "coma" , y nos devuelve todo lo que esta a su izquierda ya que tiene el left
		end															y el menos 1 al final es para que no nos muestre la coma, ese menos 1 va con el "locate"
*/

SELECT upper(substring(nombre,1,10)) AS NombreCancion , 
    -- concat (timestampdiff(YEAR,publicada,NOW())," años",
        round(bytes/1024) AS PESO,
        concat("$ ",format(precio_unitario,3)) AS PRECIO,
        case 
			when compositor is null or compositor = '' then '<sin compositor>'
            when compositor not like '%,%' then compositor
            else left (compositor, locate (',',compositor) -1)
		end AS COMPOSITOR
FROM canciones;