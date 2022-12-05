/*Where
1. Mostrar los nombre de los productos que tengan cualquier combinación de
‘mountain bike’
Tablas: Product
Campos: Name*/

SELECT Name
FROM product
where name like "%mountain bike%";

/*
2. Mostrar las personas cuyo nombre empiece con la letra “y”
Tablas: Contact
Campos: FirstName*/

SELECT FirstName 
From contact
where FirstName like "y%";

/*
Order by
1. Mostrar cinco productos más caros y su nombre ordenado en forma alfabética
Tablas: Product
Campos: Name, ListPrice*/

SELECT Name, listPrice
From product 
ORDER BY  product.listPrice desc , product.Name asc
limit 5
;

/*Operadores & joins
1. Mostrar el nombre concatenado con el apellido de las personas cuyo apellido sea
johnson
Tablas: Contact
Campos: FirstName, LastName*/

SELECT concat (firstname , " " , lastname) as NOMBRE
from contact 
where lastname like "johnson";


/*
2. Mostrar todos los productos cuyo precio sea inferior a 150$ de color rojo o cuyo
precio sea mayor a 500$ de color negro
Tablas: Product
Campos: ListPrice, Color*/

SELECT listprice , color 
FROM product
where ListPrice < 150 and color = "red" or listprice > 500 and color = "black";

/*
Funciones de agregación
1. Mostrar la fecha más reciente de venta
Tablas: SalesOrderHeader
Campos: OrderDate*/

SELECT MAX(orderDate)
from salesorderheader;

/*
2. Mostrar el precio más barato de todas las bicicletas
Tablas: Product
Campos: ListPrice, Name*/

SELECT min(listPrice) , name 
from product ;

/*
Group by
1. Mostrar los productos y la cantidad total vendida de cada uno de ellos
Tablas: SalesOrderDetail
Campos: ProductID, OrderQty
*/

SELECT productID , count(OrderQty)
FROM salesorderdetail
group by ProductID;

/*
Having
1. Mostrar la cantidad de facturas que vendieron más de 20 unidades.
Tablas: Sales.SalesOrderDetail
Campos: SalesOrderID, OrderQty*/

SELECT salesOrderID , count(OrderQty)
From salesorderdetail
group by SalesOrderID
having count(OrderQty) > 20;


/*
Joins
1. Mostrar el código de logueo, número de territorio y sueldo básico de los
vendedores
Tablas: Employee, SalesPerson
Campos: LoginID, TerritoryID, Bonus, BusinessEntityID*/
SELECT employee.LoginID , SalesPerson.TerritoryId, salesperson.Bonus , employee.businessEn



/*
2. Mostrar los productos que sean ruedas
Tablas: Product, ProductSubcategory
Campos: Name, ProductSubcategoryID */

SELECT  product.productsubcategoryID , product.Name
FROM product
inner Join productsubcategory 
on productsubcategory.ProductSubcategoryID = product.ProductSubcategoryID
where product.name like "%wheel%";



/*
3. Mostrar los nombres de los productos que no son bicicletas
Tablas: Product, ProductSubcategory
Campos: Name, ProductSubcategoryID
*/
SELECT  product.productsubcategoryID , product.Name
FROM product
inner Join productsubcategory 
on productsubcategory.ProductSubcategoryID = product.ProductSubcategoryID
where product.name Not like "%bike%";

