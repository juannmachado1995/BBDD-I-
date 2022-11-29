SELECT p.* , count(axp.artista_id) CantidadActores
FROM pelicula p
inner Join artista_x_pelicula axp on p.id = axp.pelicula_id
group by p.titulo
having CantidadActores > 1
;

select a.* , count(axp.pelicula_id) CantidadPeliculas
from artista a
inner join artista_x_pelicula axp on a.id = axp.artista_id
group by a.nombre
having CantidadPeliculas > 1 ;

select * from pelicula;

/*Obtener los artistas que han actuado en una o más películas.*/
SELECT artista.nombre, pelicula.titulo FROM artista 
INNER JOIN artista_x_pelicula ON artista.id = artista_x_pelicula.artista_id
INNER JOIN pelicula ON pelicula.id = artista_x_pelicula.pelicula_id;

/*Obtener las películas donde han participado más de un artista según nuestra
base de datos.*/
SELECT pelicula.titulo, count(artista_x_pelicula.artista_id) cantidadActores FROM pelicula
INNER JOIN artista_x_pelicula ON artista_x_pelicula.pelicula_id = pelicula.id
group by pelicula.titulo
having cantidadActores > 1
;

/*Obtener aquellos artistas que han actuado en alguna película, incluso
aquellos que aún no lo han hecho, según nuestra base de datos.*/

select * from artista a 
inner join artista_x_pelicula axp on axp.artista_id = a.id
group by a.nombre;

--  RESOLUCION LUISINA 
SELECT pelicula.titulo, artista.nombre FROM pelicula
RIGHT JOIN artista_x_pelicula ON artista_x_pelicula.pelicula_id = pelicula.id
RIGHT JOIN artista ON artista.id = artista_x_pelicula.artista_id;

/*Obtener las películas que no se le han asignado artistas en nuestra base de
datos.*/
-- LUISINA
SELECT pelicula.titulo FROM pelicula
LEFT JOIN artista_x_pelicula ON artista_x_pelicula.pelicula_id = pelicula.id
LEFT JOIN artista ON artista_x_pelicula.artista_id = artista.id
WHERE artista.nombre IS NULL;

SELECT pelicula.titulo FROM pelicula
LEFT JOIN artista_x_pelicula ON artista_x_pelicula.pelicula_id = pelicula.id
WHERE artista_x_pelicula.pelicula_id IS NULL;

/*Obtener aquellos artistas que no han actuado en alguna película, según
nuestra base de datos.*/
-- LUISINA
SELECT artista.nombre, pelicula.titulo FROM artista
LEFT JOIN artista_x_pelicula ON artista_x_pelicula.artista_id = artista.id
LEFT JOIN pelicula ON artista_x_pelicula.pelicula_id = pelicula.id
WHERE pelicula.titulo IS NULL;

SELECT * FROM artista a
LEFT JOIN artista_x_pelicula axp on axp.artista_id = a.id
WHERE axp.artista_id IS NULL;

/*Obtener aquellos artistas que han actuado en dos o más películas según
nuestra base de datos.*/
SELECT artista.nombre, count(artista_x_pelicula.pelicula_id) cantidadPeliculas 
FROM artista
INNER JOIN artista_x_pelicula ON artista_x_pelicula.artista_id = artista.id
GROUP BY artista.nombre
HAVING cantidadPeliculas >= 2;

/*Obtener aquellas películas que tengan asignado uno o más artistas, incluso
aquellas que aún no le han asignado un artista en nuestra base de datos.*/
-- LUISINA
SELECT pelicula.titulo, artista.nombre, count(artista_x_pelicula.artista_id) cantidadArtistas 
FROM pelicula
LEFT JOIN artista_x_pelicula ON artista_x_pelicula.pelicula_id = pelicula.id
LEFT JOIN artista ON artista_x_pelicula.artista_id =artista.id
group by artista.id;


