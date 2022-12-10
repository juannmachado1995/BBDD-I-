/*-----------------------------------------------------------
Grupo 4
Codigo Camada: 1022TDBD1N2C4LAED0822PT
Integrantes:
	- Daniel Ramirez
    - Rodrigo Sánchez
    - Raul Eduardo Duarte
    - Iván Amarillo Lozada
-----------------------------------------------------------*/

-- punto 1
SELECT CONCAT(autores.nombre, ' ', autores.apellido) AS Nombre_Autor,
count(articulos.id) as cantidad_articulos
FROM articulos
LEFT JOIN autores ON autores.id = articulos.autores_id
GROUP BY Nombre_Autor
HAVING cantidad_articulos > 10;
-- 4 filas retornadas

-- punto 2
SELECT UPPER(CONCAT(autores.nombre, ' ', autores.apellido)) AS "Autor Sin Publicación"
FROM articulos
RIGHT JOIN autores ON autores.id = articulos.autores_id
WHERE articulos.id IS NULL;
-- 29 filas retornadas

-- punto 3
SELECT pais.nombre, ciudad.nombre, autores.nombre, autores.apellido, articulos.titulo, articulos.fechapublicacion
FROM articulos
LEFT JOIN autores ON autores.id = articulos.autores_id
LEFT JOIN ciudad ON ciudad.id = autores.ciudad_id
LEFT JOIN pais ON pais.id = ciudad.pais_id
WHERE pais.nombre = 'Chile' AND articulos.estadoart = 1;
-- 20 filas retornadas

-- punto 4
SELECT * FROM articulos
LEFT JOIN autores on autores.id = articulos.autores_id
where articulos.estadoart = 0 and autores.apellido like '_a%';
-- 9 filas retornadas

-- punto 5
select pais.nombre, count(autores.id) from autores
left join ciudad on autores.ciudad_id = ciudad.id
left join pais on ciudad.pais_id = pais.id
group by pais.nombre;
-- 4 filas retornadas

-- punto 6
select usuario.nombre, usuario.apellido, articulos.titulo, comentarios.Cometario, comentarios.Fecha from comentarios
left join articulos on articulos.id = comentarios.articulos_id
left join usuario on usuario.id = comentarios.usuario_id
where comentarios.Cometario like '%muy bueno%';
-- 3 filas retornadas

-- punto 7
select CONCAT(autores.nombre, ' ', autores.apellido) as autor,
especialidad.nombre
from autores
left join especialidad_x_autores exa on exa.autores_id = autores.id
left join especialidad on especialidad.id = exa.especialidad_id
where autores.apellido = 'Martín' and autores.nombre = 'Guillermina Lucia';
-- 4 filas retornadas

-- punto 8
select pais.nombre, count(autores.id) as autores_sin_especialidad
from autores
left join ciudad on ciudad.id = autores.ciudad_id
left join pais on ciudad.pais_id = pais.id
left join especialidad_x_autores on autores.id = especialidad_x_autores.autores_id
where especialidad_id is null
group by pais.nombre;
-- 3 filas retornadas

-- punto 9
select CONCAT(autores.nombre, ' ', autores.apellido) AS AUTOR, ciudad.nombre, pais.nombre, articulos.estadoart, count(articulos.id) AS TOTAL_ARTICULOS
from articulos
left join autores on autores.id = articulos.autores_id
left join ciudad on ciudad.id = autores.ciudad_id
left join pais on pais.id = ciudad.pais_id
where articulos.estadoart = 1
group by autores.nombre
ORDER BY TOTAL_ARTICULOS DESC
LIMIT 1 OFFSET 2;
-- 1 fila retornada

-- punto 10
select categorias.nombre_categoria as nombre_categoria, count(*) as cantidad_articulos_inactivos
from articulos
left join subcategorias on subcategorias.id = articulos.subcategorias_id
left join categorias on categorias.id = subcategorias.categorias_id
where categorias.estado_categoria = 0
group by nombre_categoria;
-- 3 filas retornadas

-- punto 11
select CONCAT(autores.nombre, ' ', autores.apellido) as autor,
case
	when count(*) = 1 then 'tiene solo un artículo publicado'
    when count(*) = 2 then 'tiene dos artículos publicados'
    when count(*) > 2 then 'tiene más de dos artículos publicados'
    when count(*) = 0 then 'no publicó ningún artículo'
end as articulos_publicados
from articulos
left join autores on autores.id = articulos.autores_id
group by autor;
-- 21 filas retornadas

-- punto 12
select articulos.id, count(recursos.id) as cantidad_recursos
from articulos
left join recursos on recursos.articulos_id = articulos.id
where articulos.estadoart = 1 and YEAR(fechapublicacion) = 2022
group by articulos.id;
-- 31 filas retornadas

-- punto 13
select autores.id, count(exa.especialidad_id) as cantidad_especialidades
from autores
left join especialidad_x_autores exa on exa.autores_id = autores.id
group by autores.id
having cantidad_especialidades = 3;
-- 3 filas retornadas

-- punto 14
select autores.usuario, autores.email, pais.nombre, articulos.estadoart, count(*) as cantidad_articulos_no_publicados
from articulos
left join autores on autores.id = articulos.autores_id
left join ciudad on ciudad.id = autores.ciudad_id
left join pais on pais.id = ciudad.pais_id
where articulos.estadoart = 0
group by autores.usuario, autores.email, pais.nombre, articulos.estadoart;
-- 14 filas retornadas

-- punto 15
select nombre, apellido, (year(now()) - year(fecha_nacimiento)) as edad,
case
	when (year(now()) - year(fecha_nacimiento)) <= 35 then 'semi-senior'
    when (year(now()) - year(fecha_nacimiento)) > 35 and (year(now()) - year(fecha_nacimiento)) <= 40 then 'senior'
    when (year(now()) - year(fecha_nacimiento)) > 40 then 'senior'
end as categoria
from usuario
order by categoria, edad;
-- 25 filas retornadas

-- punto 16
select usuario.email, comentarios.Cometario, ciudad.nombre
from comentarios
left join usuario on usuario.id = comentarios.usuario_id
left join ciudad on ciudad.id = usuario.ciudad_id
where (ciudad.nombre != 'Monroe - Buenos Aires') AND (YEAR(comentarios.Fecha) between 2019 and 2020)
order by comentarios.Fecha;
-- 5 filas retornadas

-- punto 17
select CONCAT(usuario.nombre, ' ', usuario.apellido) as nombre_usuario, pais.nombre, COUNT(comentarios.id) as cantidad_comentarios
from comentarios
left join usuario on usuario.id = comentarios.usuario_id
left join ciudad on ciudad.id = usuario.ciudad_id
left join pais on pais.id = ciudad.pais_id
group by nombre_usuario
order by cantidad_comentarios desc
limit 5;
-- 5 filas retornadas

-- punto 18
select articulos.titulo, articulos.fechalta, recursos.ruta, subcategorias.nombre_subcat from recursos
left join tiposrecursos on tiposrecursos.id = recursos.tiposrecursos_id
left join articulos on articulos.id = recursos.articulos_id
left join subcategorias on articulos.subcategorias_id = subcategorias.id
where recursos.ruta like '%.mp3' and MONTH(articulos.fechalta) = 10;
-- 1 fila retornada

-- punto 19
select CONCAT(usuario.nombre, ' ', usuario.apellido) as usuario, ciudad.nombre, pais.nombre, comentarios.Cometario from comentarios
left join usuario on usuario.id = comentarios.usuario_id
left join ciudad on ciudad.id = usuario.ciudad_id
left join pais on pais.id = ciudad.pais_id
where (year(NOW()) - YEAR(usuario.fecha_nacimiento)) between 36 and 40;
-- 16 filas retornadas

-- punto 20
select usuario.nombre, apellido, ciudad.nombre as ciudad, fecha_nacimiento from usuario
left join ciudad on ciudad.id = usuario.ciudad_id
where fecha_nacimiento > '1989-02-12' or fecha_nacimiento = '1979-12-17'
order by fecha_nacimiento;
-- 7 filas retornadas