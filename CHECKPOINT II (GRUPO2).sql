set sql_mode= 'ONLY_FULL_GROUP_BY';

/*1. Listar todos los autores cuyo nombre comience con la letra "A". Se debe mostrar
id como "Número de Autor", apellido, nombre y su correo electrónico.*/

SELECT id AS "Numero de autor" , apellido , nombre , email FROM autores where nombre like "A%";

/*
2. Mostrar el nombre, apellido y el password del usuario con teléfono
"5492645661478".*/

SELECT nombre , apellido , password FROM usuario WHERE telefono_movil = "5492645661478";

/*
3. Calcular la cantidad de artículos o posts que se encuentran inactivos (donde el
estado es igual a cero) en nuestro blog. El Reporte debe tener dos columnas
"Estado" y "Cantidad de Artículos".*/

SELECT estadoart , count(*) AS "Cantidad de Articulos" FROM articulos WHERE estadoart = 0;
/*
4. Listar los recursos utilizados con números 8, 16, 29, 35.*/

SELECT * FROM recursos Where articulos_id in (8,16,29,35);

/*
5. Se requiere saber cuál es la fecha de publicación del primer artículo de
DH-Noticias, para este informe se requiere dos columnas con la fecha de
publicación y el título del artículo.*/
SELECT fechapublicacion , titulo FROM articulos order by fechapublicacion limit 1 ;
/*
6. Listar los nombres y la ubicación de todos los recursos del tipo audio que se
utilizaron en los artículos publicados.*/

SELECT nombre_recurso , ruta FROM recursos WHERE tiposrecursos_id = 1;

/*
7. Listar de manera ordenada y ascendente por fecha de nacimiento, los usuarios
que no sean oriundos de la ciudad "Las Condes-Santiago" y que la fecha de
nacimiento sea mayor que 3/9/1989 o igual a 7/11/1986.*/

SELECT * FROM usuario WHERE ciudad_id != 6 AND fecha_nacimiento > "1989-09-03" OR fecha_nacimiento = "1986-11-07" ORDER BY fecha_nacimiento;

/*
8. Listar los artículos de Deportes, específicamente de la subcategoría futbol y que
la fecha de alta sea mayor que 5/09/21 o igual a 25/06/21. Ordenar por fecha de
alta.*/

SELECT * FROM articulos where subcategorias_id = 1 and fechalta > "2021-09-05" or "2021-06-25" ORDER BY fechalta;

/*
9. Listar todos los comentarios del mes de octubre que contengan la palabra
"Gracias", para este reporte necesitamos mostrar la fecha de publicación y el
comentario.*/

SELECT Fecha , Cometario FROM comentarios where Cometario like "%Gracias%" ;

/*
10. Mostrar el título y contenido del último artículo publicado por el autor
"Guillermina Lucia Martín".*/
SELECT titulo , contenido , fechapublicacion FROM articulos WHERE autores_id = 13 ORDER BY fechapublicacion LIMIT 1;

/*
11. Listar los comentarios registrados entre 14/07/21 al 15/08/21 y ordenarlas por
fecha teniendo en cuenta un orden de más antigua a reciente.*/
SELECT cometario FROM comentarios WHERE Fecha between "2021-07-14" and "2021-08-15" order by Fecha desc;

/*
12. Listar todos los autores cuyo nombre termine con los caracteres "ia". Se debe
mostrar el apellido, nombre y teléfono móvil.*/

SELECT nombre , apellido , telefono_movil FROM autores WHERE nombre LIKE "%ia";

/*
13. Calcular el total de artículos publicados en el año 2021 en DH-noticias.*/
SELECT id, count(*) FROM articulos WHERE fechapublicacion between "2021-01-01" and "2021-12-31";

/*
14. Mostrar el quinto artículo publicado más antiguo durante el año 2022.*/
SELECT * FROM articulos WHERE fechapublicacion > "2022-01-01" LIMIT 1 OFFSET 5;

/*
15. La fecha de publicación del primer post que se realizó en DH-Noticias fue el
"2019-03-03" , lo que necesitamos calcular es cuantos días transcurrieron hasta
el día de hoy.*/
/*
16. Mostrar todas las ciudades que contengan una palabra de cinco caracteres, pero
el tercer carácter debe ser igual a "n".
17. Modificar el tipo de categoría "Cultura y Arte" a solo "Cultura".
18. Listar el nombre de todas las categorías inactivas (el estado de la categoría es
igual a cero) en nuestro blog
19. Agregar al usuario Aznar Ricardo Omar cuyo usuario es rica28, contraseña
az123, proveniente de la ciudad de 'Las Heras - Mendoza’, fecha de nacimiento
5/1/1980, teléfono móvil +542645667714 y el correo electrónico es
pal1980sj@gmail.com.
20. Eliminar el registro de la categoría número ocho
Se solicita
● Generar una consulta SQL por cada uno de los puntos de la consigna.
● Armar un solo documento (.sql) que contenga todos los puntos de la consigna y
las correspondientes consultas SQL. El mismo deberá:
○ Tener como nombre de archivo: CheckPointII_Numero_Grupo
○ En el inicio de la primera hoja del documento deberá incluir el código de
la camada, número de grupo y los nombres de todos los integrantes.
○ Debajo de cada consulta SQL, se debe escribir de forma comentada el
número de la cantidad de registros que devuelve.
*/