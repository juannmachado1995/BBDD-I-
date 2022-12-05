-- Camada 7 
-- Integrantes: Martín Lobos, Santiago Sanchez Abraham, Martín Dellugo y Mariano Colombres

-- 1 Listar todas las reservas de hoteles realizadas en la ciudad de Nápoles
SELECT 
    hotelesxreserva.idReserva,
    hoteles.nombre as 'Nombre del hotel', 
    hoteles.ciudad as 'Ciudad del hotel'
FROM
    hotelesxreserva
JOIN
    hoteles ON hoteles.idhotel = hotelesxreserva.idHotel
JOIN
    reservas ON reservas.idreserva = hotelesxreserva.idReserva
WHERE
    hoteles.ciudad LIKE 'Napoles';
-- Consulta 1 Devuelve 6 registros
    
-- 2. Listar el número de pago (idpago), el precio, la cantidad de cuotas de todas las
-- reservas realizadas con tarjeta de crédito.
SELECT 
    pagos.idpago AS 'Numero de pago',
    pagos.precioTotal as 'Precio Total',
    pagos.cantidadCuotas as 'Cantidad de cuotas'
FROM
    pagos
JOIN
    metodospago ON metodospago.idmetodospago = pagos.idMetodosPago
WHERE
    metodospago.nombre LIKE 'Tarjeta de Crédito';
-- Consulta 2 Devuelve 19 registros 

-- 3. Listar la cantidad de reservas realizadas de acuerdo al método de pago.
SELECT 
    metodospago.nombre AS 'Metodo de pago',
    COUNT(reservas.idreserva) AS 'Cantidad de reservas'
FROM
    reservas
JOIN
    pagos ON pagos.idpago = reservas.idPago
JOIN
    metodospago ON metodospago.idmetodospago = pagos.idMetodosPago
GROUP BY metodospago.nombre;
-- Consulta 3 devuelve 3 registros

-- 4. Listar las reservas de los clientes cuyo pago lo hicieron a través de tarjeta de
-- crédito, se pide mostrar el nombre, apellido, país y el método de pago.
SELECT
	clientes.nombres,
    clientes.apellidos,
    paises.nombre as 'Pais',
    metodospago.nombre
FROM
    reservas
JOIN
    pagos ON pagos.idpago = reservas.idPago
JOIN
    metodospago ON metodospago.idmetodospago = pagos.idMetodosPago
JOIN 
	clientes on clientes.idcliente=reservas.idCliente
JOIN 
	paises on paises.idpais=clientes.idPais
WHERE
    metodospago.nombre LIKE 'Tarjeta de Crédito';
-- Consulta 4 devuelve 19 registros

-- 5. Listar la cantidad de reservas de hoteles por país, se necesita mostrar el nombre
-- del país y la cantidad.
SELECT 
	paises.nombre as Pais,
    count(hotelesxreserva.idReserva) as 'Cantidad de reservas'
FROM 
	hotelesxreserva
JOIN
	hoteles on hoteles.idhotel=hotelesxreserva.idHotel
JOIN
	paises on paises.idpais=hoteles.idPais
group by paises.nombre;
-- Consulta 5 devuelve 8 registros

-- 6. Listar el nombre, apellido, número de pasaporte,ciudad y nombre del país de los
-- clientes de origen Peruano.
SELECT 
    clientes.nombres as Nombres,
    clientes.apellidos as Apellidos,
    clientes.numeroPasaporte as 'Número de pasaporte',
    clientes.ciudad as 'Ciudad del cliente',
    paises.nombre as Pais
FROM
    clientes
JOIN
    paises ON paises.idpais = clientes.idPais
WHERE
    paises.nombre like 'Perú';
-- Consultas 6 Devuelve  5 columnas

-- 7. Listar la cantidad de reservas realizadas de acuerdo al método de pago y el
-- nombre completo del cliente.
SELECT
	clientes.idcliente,
	concat(clientes.nombres, ' ', clientes.apellidos) as nombreCompleto,
    metodospago.nombre as metodoDePago,
    count(reservas.idreserva) as 'Cantidad de reservas'
FROM
    reservas
JOIN
    pagos ON pagos.idpago = reservas.idPago
JOIN
    metodospago ON metodospago.idmetodospago = pagos.idMetodosPago
JOIN 
	clientes on clientes.idcliente=reservas.idCliente
group by clientes.idcliente,nombreCompleto,metodoDePago;
-- Consulta 7 Devuelve 51 registros

-- 8. Mostrar la cantidad de clientes por país, se necesita visualizar el nombre del
-- país y la cantidad de clientes.
SELECT 
    paises.nombre as Pais,
    count(clientes.idcliente) as cantidadDeClientes
FROM
    clientes
JOIN
    paises ON paises.idpais = clientes.idPais
group by paises.nombre;
-- Consulta 8 devuelve 11 registros

-- 9. Listar todas las reservas de hotel, se pide mostrar el nombre del hotel,dirección,
-- ciudad, el país, el tipo de pensión y que tengan como tipo de hospedaje 'Media
-- pensión'.
SELECT 
   hoteles.nombre as 'Nombre del Hotel', 
   hoteles.ciudad as Ciudad,
   hoteles.direccion as 'Dirección',
   paises.nombre as Pais,
   tiposhospedaje.nombre as 'Tipo de Hospedaje'
FROM
    hotelesxreserva
JOIN
    hoteles ON hoteles.idhotel = hotelesxreserva.idHotel
JOIN 
	paises on paises.idpais=hoteles.idPais
JOIN
	tiposhospedaje on tiposhospedaje.idtiposhospedaje=hotelesxreserva.idTiposHospedaje
WHERE
    tiposhospedaje.nombre like 'Media Pensión ';
-- Consulta 9 devuelve 22 registros.

-- 10. Mostrar por cada método de pago el monto total obtenido,se pide visualizar el
-- nombre del método de pago y el total.
SELECT
	 metodospago.nombre as 'Metodo de pago',
     sum(pagos.precioTotal) as 'Monto total'
FROM
	pagos
JOIN
    metodospago ON metodospago.idmetodospago = pagos.idMetodosPago
GROUP BY metodospago.nombre;
-- Consulta 10 devuelve 3 registros

-- 11. Mostrar la suma de los pagos realizados en la sucursal de Mendoza, llamar al
-- resultado “TOTAL MENDOZA”.
SELECT 
    sum(pagos.precioTotal) AS 'TOTAL MENDOZA'
FROM
	reservas
JOIN
	pagos ON pagos.idpago = reservas.idPago
JOIN
	sucursales on sucursales.idSucursal=reservas.idSucursal
where sucursales.ciudad like 'Mendoza';
-- Consulta 11 devuelve 1 registro


-- 12. Listar todos los clientes que no han realizado reservas.
SELECT 
    clientes.idcliente, 
    clientes.nombres, 
    clientes.apellidos
FROM
    dhespegar.reservas
RIGHT JOIN
    clientes ON reservas.idCliente = clientes.idcliente
WHERE
    reservas.idreserva IS NULL;
-- Consulta 12 devuelve 33 registros

-- 13. Listar todas las reservas de vuelos realizadas donde el origen sea Chile y el
-- destino Ecuador, mostrar el id Reserva, id Vuelo, fecha de partida, fecha de
-- llegada, fecha de la reserva
SELECT 
    reservas.idreserva,
    vuelos.idvuelo,
    vuelos.fechaPartida,
    vuelos.fechaLlegada,
    reservas.fechaRegistro as 'Fecha de reserva'
FROM
    reservas
JOIN
    vuelosxreserva ON vuelosxreserva.idReserva = reservas.idreserva
JOIN
    vuelos ON vuelos.idvuelo = vuelosxreserva.idVuelo
WHERE
    vuelos.origen LIKE 'CHILE' AND vuelos.destino LIKE 'ECUADOR';
-- Consulta 13 devuelve 3 registros

-- 14. Listar el nombre y cantidad de habitaciones de aquellos hoteles que tengan de
-- 30 a 70 habitaciones pertenecientes al país Argentina.
SELECT 
	hoteles.nombre as 'Nombre del Hotel',
    hoteles.cantidadHabitaciones as 'Cantidad de habitaciones'
FROM
	hoteles
JOIN
	paises on paises.idpais=hoteles.idPais
where 
	paises.nombre like 'Argentina' and hoteles.cantidadhabitaciones between 30 and 70;
-- Consulta 14 devuelve 3 registros

-- 15. Listar el top 10 de hoteles más utilizados y la cantidad de reservas en las que ha
-- sido reservado.
SELECT 
	hoteles.nombre as 'Nombre del Hotel',
    count(hotelesxreserva.idReserva) as cantidadReservas
FROM
	hoteles
join hotelesxreserva on hotelesxreserva.idHotel=hoteles.idhotel
group by hoteles.nombre
order by cantidadReservas DESC
limit 10;
-- Consulta 15 devuelve 10 registros

-- 16. Listar los clientes (nombre y apellido) y cuáles han sido los medios de pago que
-- han utilizado, esta lista deberá estar ordenada por apellidos de manera
-- ascendente.
SELECT
    DISTINCT clientes.nombres, 
    clientes.apellidos,
    metodospago.nombre as metodoDePago
FROM
    reservas
JOIN
    pagos ON pagos.idpago = reservas.idPago
JOIN
    metodospago ON metodospago.idmetodospago = pagos.idMetodosPago
JOIN 
	clientes on clientes.idcliente=reservas.idCliente
ORDER BY clientes.apellidos ASC;
-- Consulta 16 devuelve 51 registros 

-- 17. Listar la cantidad de reservas que se realizaron para los vuelos que el origen ha
-- sido de Argentina o Colombia, en el horario de las 18hs. Mostrar la cantidad de
-- vuelos y país de origen.
SELECT 
	vuelos.origen,
    count(vuelosxreserva.idReserva) as cantidadVuelos
FROM
    vuelosxreserva
JOIN
    vuelos ON vuelos.idvuelo = vuelosxreserva.idVuelo
JOIN
	reservas on reservas.idreserva=vuelosxreserva.idReserva
WHERE
    (vuelos.origen LIKE 'ARGENTINA' or  vuelos.origen LIKE 'COLOMBIA') and hour(reservas.fechaRegistro)=18
group by vuelos.origen;
-- Consulta 17 devuelve 2 registros

-- 18. Mostrar los totales de ventas de sucursales por países y ordenarlas de mayor a
-- menor.
SELECT 
	paises.nombre as Pais,
    sucursales.idSucursal,
    count(idreserva) as 'Cantidad de Ventas'
FROM 
	sucursales
join 
	paises on paises.idpais=sucursales.idPais
join
	reservas on reservas.idSucursal=sucursales.idSucursal
group by 
	pais,sucursales.idSucursal
order by 
	`Cantidad de Ventas` DESC;
-- Consulta 18 devuelve 6 registros

-- 19. Mostrar los países que no tienen clientes asignados ordenados por los que
-- empiezan por Z primero.
SELECT 
    paises.nombre
FROM
    paises
        LEFT JOIN
    clientes ON clientes.idPais = paises.idpais
WHERE
    clientes.idPais IS NULL
ORDER BY 
	paises.nombre DESC;
-- Consulta 19 devuelve 19 registros

-- 20. Generar un listado con los hoteles que tuvieron más de 2 reservas realizadas.
-- Mostrar el nombre del hotel y la cantidad.
SELECT 
    hoteles.nombre,
    COUNT(hotelesxreserva.idReserva) AS 'Cantidad de reservas'
FROM
    hotelesxreserva
JOIN
    hoteles ON hoteles.idhotel = hotelesxreserva.idHotel
GROUP BY 
	hoteles.nombre
HAVING 
	`Cantidad de reservas` > 2;
-- Consulta 20 Devuelve 4 registros