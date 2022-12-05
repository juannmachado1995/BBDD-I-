-- Consigna - CheckPoint III
-- 1. Listar todos los autores que tengan más de diez artículos en nuestra base de datos. Mostrar apellido, nombre y la cantidad de artículos que posee.
select autores.apellido, autores.nombre, count(articulos.id) from autores
inner join articulos on articulos.autores_id = autores.id
group by autores.id
having count(articulos.id) > 10;

select autores.nombre, autores.apellido, count(articulos.id) CantArticulos
From autores 
INNER join articulos on articulos.autores_id = autores.id
group by autores.nombre
having CantArticulos > 10 ;

-- 2. Listar todos los autores que no tengan artículos publicados en el blog. Mostrar apellido y nombre en mayúsculas dentro de una misma columna denominada "Autor sin publicación".
select upper(concat(autores.apellido, ' ', autores.nombre)) as 'Autor sin publicación' from autores
left join articulos on articulos.autores_id = autores.id
where articulos.id is null;

SELECT CONCAT(UPPER(autores.nombre),UPPER(autores.apellido)) as "Autor Sin Publicacion",articulos.id publicaciones
FROM autores
LEFT JOIN articulos on articulos.autores_id = autores.id
having articulos.id IS NULL;

-- 3. Listar todos los autores que tengan al menos una publicación y que tengan como origen el país Chile. Se debe mostrar el apellido, nombre, título del artículo, fecha de la publicación del artículo, 
-- nombre de la ciudad y país.
select autores.apellido, autores.nombre, articulos.titulo, articulos.fechapublicacion, ciudad.nombre as Ciudad, pais.nombre as Pais from autores
inner join articulos on articulos.id = autores.id
left join ciudad on ciudad.id = autores.ciudad_id
left join pais on pais.id = ciudad.pais_id
where Pais.nombre = 'chile';

SELECT * FROM autores au
LEFT JOIN articulos ar on ar.autores_id = au.id
LEFT JOIN ciudad ci on ci.id = au.ciudad_id
left join pais on pais.id = ci.pais_id
HAVING pais.nombre = "chile";

-- 4. Listar los autores que tengan uno o más artículos que no se encuentren publicados es decir que el estado es igual a cero y que en la segunda letra de su apellido contenga una "a".
select autores.* from autores
inner join articulos on articulos.autores_id = autores.id
where articulos.estadoart = 0 and autores.apellido like '_a%'
group by autores.id;

SELECT autores.nombre, autores.apellido, articulos.estadoart from autores 
inner join articulos on articulos.autores_id = autores.id
Where autores.apellido like "_a%" and estadoart = 0
group by autores.nombre;

-- 5. Listar absolutamente todos los países y la cantidad de autores que tengan.
select pais.*, count(autores.id) as 'cantidad de autores' from pais
left join ciudad on ciudad.pais_id = pais.id
left join autores on ciudad_id = ciudad.id
group by pais.id; 

 SELECT count(autores.id) CantAutores, pais.nombre 
 FROM pais
 left join ciudad on ciudad.pais_id = pais.id
 LEFT join autores on autores.id = autores.ciudad_id
 group by pais.nombre;

-- 6. Queremos conocer los comentarios que contengan la palabra "muy bueno”, se pide el nombre y apellido del usuario, título del artículo, el comentario y la fecha de publicación del comentario.
select usuario.nombre, usuario.apellido, articulos.titulo, comentarios.Cometario, comentarios.Fecha from comentarios
left join usuario on usuario.id = comentarios.usuario_id
left join articulos on articulos.id = comentarios.articulos_id
where comentarios.Cometario like '%muy bueno%';

SELECT usuario.nombre, usuario.apellido, articulos.titulo, comentarios.cometario, comentarios.Fecha FROM comentarios
INNER JOIN usuario ON usuario.id = comentarios.usuario_id
INNER JOIN articulos ON articulos.id = comentarios.articulos_id
WHERE comentarios.cometario LIKE '%muy bueno%';

-- 7. Se necesita conocer todas las especialidades del autor Martin Guillermina Lucia.
select autores.*, especialidad.nombre as Especialidades from autores
left join especialidad_x_autores on especialidad_x_autores.autores_id = autores. id
left join especialidad on especialidad.id = especialidad_x_autores.especialidad_id
where autores.nombre like '%Guillermina%';

SELECT autores.nombre, autores.apellido, especialidad.nombre FROM autores
INNER JOIN especialidad_x_autores ON especialidad_x_autores.autores_id = autores.id
INNER JOIN especialidad ON especialidad_x_autores.especialidad_id = especialidad.id
WHERE  autores.nombre = 'Guillermina Lucia' and autores.apellido = 'Martín';

-- 8. Calcular la cantidad de autores por país que no tengan asignada una especialidad. Para este informe mostrar el nombre del país y la cantidad.
select pais.nombre, count(autores.id) from pais
inner join ciudad on ciudad.pais_id = pais.id
inner join autores on ciudad_id = ciudad.id
left join especialidad_x_autores on especialidad_x_autores.autores_id = autores.id
where especialidad_x_autores.especialidad_id is null 
group by pais.id; 

SELECT count(autores.id) as cantidadAutores, pais.nombre FROM autores
LEFT JOIN ciudad ON ciudad.id = autores.ciudad_id
RIGHT JOIN pais ON ciudad.pais_id = pais.id 
LEFT JOIN especialidad_x_autores ON especialidad_x_autores.autores_id = autores.id
LEFT JOIN especialidad ON especialidad_x_autores.especialidad_id = especialidad.id
WHERE especialidad.nombre IS NULL
GROUP BY pais.nombre;


-- 9. Se desea conocer el tercer autor que tenga más artículos publicados, el estado del mismo debe ser uno. Mostrar el nombre y apellido del autor, ciudad, país, estado de la publicación y la cantidad.
select autores.nombre, autores.apellido, ciudad.nombre as Ciudad, pais.nombre as Pais, articulos.estadoart as estado, count(articulos.id) as 'cantidad de articulos' from autores
inner join articulos on articulos.autores_id = autores.id
left join ciudad on ciudad.id = autores.ciudad_id
left join pais on pais.id = ciudad.pais_id
where articulos.estadoart = 1
group by autores.id
order by count(articulos.id) desc
limit 1
offset 2;

SELECT count(articulos.id) CantArticulos,autores.nombre, autores.apellido, ciudad.nombre, pais.nombre, articulos.estadoart 
FROM autores
INNER JOIN articulos ON articulos.autores_id = autores.id
LEFT JOIN ciudad ON ciudad.id = autores.ciudad_id
LEFT JOIN pais ON ciudad.pais_id = pais.id 
group by autores.nombre
having articulos.estadoart = 1
order by CantArticulos desc
LIMIT 1
OFFSET 2;

-- 10. Calcular la cantidad de artículos por categoría inactiva (estado es igual a cero). Mostrar el nombre de la categoría y la cantidad.
select categorias.nombre_categoria, count(articulos.id) as Cantidad from articulos
inner join subcategorias on subcategorias.id = articulos.subcategorias_id
inner join categorias on categorias.id = subcategorias.categorias_id
where categorias.estado_categoria = 0
group by categorias.nombre_categoria;

SELECT count(articulos.id) as 'cantidadArticulos' , categorias.nombre_categoria, articulos.estadoart 
FROM articulos 
INNER JOIN subcategorias ON subcategorias.id = articulos.subcategorias_id
INNER JOIN categorias ON subcategorias.categorias_id = categorias.id
WHERE articulos.estadoart = 0
GROUP BY categorias.nombre_categoria;

-- 11. Listar todos los autores según la cantidad de artículos publicados, los mensajes serán los siguientes:
-- ▪ "tiene solo un artículo publicado"
-- ▪ "tiene dos artículos publicados"
-- ▪ "tiene más de dos artículos publicados"
-- ▪ "no publicó ningún artículo"
-- Mostrar el nombre y apellido del autor, y el mensaje que corresponda.

select autores.nombre, autores.apellido, 
case 
when count(articulos.id) = 1 then "tiene solo un articulo publicados"
when count(articulos.id) = 2 then "tiene dos articulo publicados"
when count(articulos.id) > 2 then "tiene mas de dos articulos publicados"
when count(articulos.id) = 0 then "no publico ningun articulo"
end as articulosPublicados
from autores
inner join articulos on articulos.autores_id = autores.id
group by autores.id;

SELECT au.nombre, au.apellido,
case 
when count(ar.autores_id) = 1 then "tiene solo un articulo publicados"
when count(ar.autores_id) = 2 then "tiene dos articulos publicados"
when count(ar.autores_id) > 2 then "tiene mas de dos articulos publicados"
when count(ar.autores_id) = 0 then "no publico ningun articulo"
end as articulosPublicados
FROM autores au
left join articulos ar on ar.autores_id = au.id
group by au.nombre;

-- 12. Calcular la cantidad de recursos utilizados en los artículos publicados (estado igual a uno) en el año 2022.
select count(recursos.id) from articulos
left join recursos on recursos.articulos_id = articulos.id
where articulos.estadoart = 1 and year(articulos.fechapublicacion) = 2022;

SELECT count(re.id) as CantRecursos, year(ar.fechapublicacion), ar.estadoart
From articulos ar
inner join recursos re on re.articulos_id =  ar.id
where year(fechapublicacion) = 2022;

-- 13. Listar los autores que tengan solo asignadas 3 especialidades.
select autores.*,  count(especialidad_x_autores.especialidad_id) from autores
inner join especialidad_x_autores on especialidad_x_autores.autores_id = autores.id
group by autores.id
having count(especialidad_x_autores.especialidad_id) = 3;

select au.nombre, au.apellido, count(exa.especialidad_id) as CantEspecialidades
from autores au
inner join especialidad_x_autores exa on exa.autores_id = au.id
group by au.nombre
having CantEspecialidades = 3;

-- 14. Calcular la cantidad de artículos de cada uno de los autores que no fueron publicados, para este informe necesitamos mostrar el usuario, correo electrónico, país y estado del artículo y la cantidad.
-- 15. Listar todos los usuarios categorizados por edad. Las categorías son: 'junior' (hasta 35 años), 'semi-senior' (entre 36 a 40 años) y 'senior' (más de 40). Mostrar el apellido, nombre, edad,
--  categoría y ordenar de mayor a menor por categoría y edad.
-- 16. Listar de manera ordenada, los usuarios que no pertenezcan a la ciudad "Monroe - Buenos Aires" y que la fecha de alta del comentario se halle dentro del rango 2019 al 2020. 
-- Mostrar el email del usuario, comentario realizado y el nombre de la ciudad. Ordenar por fecha del comentario.
-- 17. Calcular la cantidad de comentarios que realizaron los usuarios. Solo mostrar los cinco primeros, como también el nombre, el apellido y país del usuario.
-- 18. Listar los recursos del tipo audio y que tengan formato MP3 que fueron utilizados por los artículos con fecha de alta en el mes de octubre. Para este informe mostrar el título y fecha de alta del artículo,
--  la ruta del recurso y la subcategoría.
-- 19. Listar todos los comentarios realizados por los usuarios que tengan entre 36 y 40 años. Mostrar nombre y apellido del usuario, ciudad, país y el comentario del mismo.
-- 20. Listar de manera ordenada y ascendente por fecha de nacimiento, el nombre , apellido , ciudad de los usuarios y que la fecha de nacimiento sea mayor que 1989-02-12 o igual a 1979-12-17