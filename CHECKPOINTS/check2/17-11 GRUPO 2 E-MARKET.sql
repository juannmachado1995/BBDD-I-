/*Clientes
1) ¿Cuántos clientes existen?*/
SELECT  count(*) FROM clientes;
/*
2) ¿Cuántos clientes hay por ciudad?
*/
SELECT ciudad ,count(ciudad) FROM clientes
group by ciudad 
having count(ciudad) > 3;

/*Facturas
1) ¿Cuál es el total de transporte?*/
SELECT sum(transporte) from facturas;

/*
2) ¿Cuál es el total de transporte por EnvioVia (empresa de envío)?*/
SELECT enviovia , SUM(transporte) from facturas 
group by EnvioVia;
/*
3) Calcular la cantidad de facturas por cliente. Ordenar descendentemente por
cantidad de facturas.*/

SELECT ClienteID, count(*) FROM facturas 
group by ClienteID;

/*
4) Obtener el Top 5 de clientes de acuerdo a su cantidad de facturas.*/
SELECT ClienteID, count(*) FROM facturas 
group by ClienteID
order by count(FacturaID) desc
Limit 5;

/*
5) ¿Cuál es el país de envío menos frecuente de acuerdo a la cantidad de facturas?
*/
SELECT PaisEnvio , count(*) FROM facturas 
group by PaisEnvio Order by count(FacturaID) LIMIT 1;
/*
6) Se quiere otorgar un bono al empleado con más ventas. ¿Qué ID de empleado
realizó más operaciones de ventas?*/
SELECT EmpleadoID , count(FacturaID) From facturas 
group by EmpleadoID
Order by count(FacturaID) desc
Limit 1;

SELECT EmpleadoID,FacturaID FROM facturas
WHERE EmpleadoID = 4
ORDER BY EmpleadoID;