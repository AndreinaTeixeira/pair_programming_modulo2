use tienda;

/*Realiza una consulta SELECT que obtenga los nombres, teléfonos y direcciones de todas las empresas cliente de la tabla customers.*/

SELECT customer_name, phone, address_line1, address_line2
FROM customers;

/*Realiza una consulta que obtenga los teléfonos y direcciones de aquellas empresas de la tabla customers que se encuentren en USA (es su país).*/

SELECT phone
FROM customers
WHERE country = 'USA';

/*Realiza una consulta que obtenga los nombres y apellidos de las personas de contacto en cada empresa que no tenga segunda linea de dirección. WHERE IS NULL*/

SELECT contact_first_name, contact_last_name
FROM customers
WHERE address_line2 IS NULL;

/*Busca aquellos registros de la tabla customers que tengan un valor guardado para el campo state. WHERE IS NOT NULL
Este atributo solo es valido para ciertos países por lo que habrá varias entradas con valor NULL.*/

SELECT *
FROM customers
WHERE state IS NOT NULL;

/*Busca aquellos registros de la tabla customers que correspondan a clientes de USA pero que no tengan un valor guardado para el campo state.*/

SELECT *
FROM customers
WHERE country = 'USA' AND state IS NULL;

SELECT * FROM customers;

/*Selecciona el país (country) correspondiente a los registros de clientes con un límite de crédito (credit_limit) mayor que $10000.*/

SELECT country
FROM customers
WHERE credit_limit <= 10000;

/*PARTE 2 DE LOS EJERCICIOS*/

use northwind;

/*El objetivo de cualquier buena jefa (o trabajadora) en una empresa debería ser conocer bien a sus compañeras. 
Para lograrlo, vamos a diseñar una consulta SQL para obtener una lista con los datos de las empleadas y empleados de la empresa Northwind. 
Esta consulta incluirá los campos EmployeeID, LastName y FirstName.*/

SELECT EmployeeID, FirstName, LastName
FROM employees;

/*baratos. Nuestra primera tarea consiste en identificar aquellos productos (tabla products) cuyos precios por unidad (UnitPrice) oscilen entre 0 y 5 dólares, es decir, los productos más asequibles.*/

SELECT ProductID, ProductName
FROM products
WHERE UnitPrice <= 5;

/*sin precio. Para comprobar si los datos en la tabla products están correctos, nos interesa seleccionar aquellos productos que no tengan precio, 
porque lo hayan dejado vacío al introducir los datos (NULL).*/

SELECT ProductID, ProductName
FROM products
WHERE UnitPrice IS NULL;

/*Ahora obtén los datos de aquellos productos con un precio menor a 15 dólares, pero sólo aquellos que tienen un ID menor que 20 
(para tener una muestra significativa pero no tener que ver todos los productos existentes).

💡 Pista 💡 Recuerda que podemos incluir varias condiciones en el WHERE.*/

SELECT ProductID, ProductName
FROM products
WHERE UnitPrice <= 15 AND ProductID <= 20;

/*Ahora vamos a hacer la misma consulta que en ejercicio anterior, pero invirtiendo el uso de los operadores
 y queremos saber aquellos que tengan un precio superior a 15 dólares y un ID superior a 20..
💡 Pista 💡 Podemos usar NOT*/

SELECT ProductID, ProductName
FROM products
WHERE NOT UnitPrice <= 15 AND NOT ProductID <= 20;
-- se de be duplicar el not para negar cada condicion???