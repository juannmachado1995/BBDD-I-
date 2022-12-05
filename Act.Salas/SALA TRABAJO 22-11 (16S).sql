/*
1. Listar todas las categorías junto con información de sus productos. Incluir todas
las categorías aunque no tengan productos.*/







/*
2. Listar la información de contacto de los clientes que no hayan comprado nunca
en emarket.*/

select facturas.FacturaID, contacto
from clientes 
left join facturas
on facturas.clienteID is null; 

/*
3. Realizar un listado de productos. Para cada uno indicar su nombre, categoría, y
la información de contacto de su proveedor. Tener en cuenta que puede haber
productos para los cuales no se indicó quién es el proveedor.*/

select ProductoID,productos.ProductoNombre,productos.CategoriaID,productos.ProveedorID,proveedores.Contacto
from proveedores
right join productos
on proveedores.ProveedorID = productos.ProveedorID;

/*


/*
5. Para cada cliente, indicar la última factura de compra. Incluir a los clientes que
nunca hayan comprado en e-market.
6. Todas las facturas tienen una empresa de correo asociada (enviovia). Generar un
listado con todas las empresas de correo, y la cantidad de facturas
correspondientes. Realizar la consulta utilizando RIGHT JOIN.
*/