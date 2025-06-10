/* Antes de hacer nada, crea un nuevo esquema y actívalo, para no tener conflictos. Utiliza los siguientes comandos:

Copy
CREATE SCHEMA mi_ejercicio;
USE mi_ejercicio;
*/
CREATE SCHEMA mi_ejercicio;
USE mi_ejercicio;

/*Crea la tabla Empleadas. De momento no te preocupes por definir restricciones a los datos que se pueden introducir, 
o por definir claves primarias o foráneas. Puedes ver a continuación un ejemplo de la tabla: 
*/
CREATE TABLE empleadas (
	id_empleada INT AUTO_INCREMENT PRIMARY KEY,
	salario INT CONSTRAINT mayor_de_0 CHECK (salario > 0),
    nombre_empleada VARCHAR(100) NOT NULL, 
    apellido_empleada VARCHAR(100) NOT NULL,
    pais_empleada ENUM('España', 'Francia') NOT NULL);

/*UPDATE empleadas SET id*/

/*Ejercicio 2: Modifica la siguiente tabla, pero añadiendo una restricción de tabla que comprueba si la edad de la persona es mayor de 16 años. 
Llámala Personas2:
CREATE TABLE personas (
    id INT PRIMARY KEY,
    apellido VARCHAR(255) NOT NULL,
    nombre VARCHAR(255),
    edad INT,
    ciudad varchar(255) DEFAULT 'Madrid'
    );
    */

CREATE TABLE personas2 (
    id INT NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    nombre VARCHAR(255),
    edad INT CONSTRAINT mayor_de_16 CHECK (edad > 16),
    ciudad varchar(255) DEFAULT 'Madrid'
    );
    
    /*Ejercicio 3: Crea las tabla Empleadas y empleadas_en_proyectos, definiendo claves primarias, claves foránea, tipos de datos, etc. 
    Haz que cuando se elimine una Empleada, se eliminen todas las entradas en empleadas_en_proyectos asociadas.
    
    CREATE TABLE departamentos (
    id_departamento INT PRIMARY KEY,                    -- ID único del departamento
    nombre_departamento VARCHAR(100) NOT NULL           -- Nombre obligatorio del departamento
);

-- Tabla secundaria: 'empleadas'
CREATE TABLE empleadas (
    id_empleada INT AUTO_INCREMENT PRIMARY KEY,         -- ID de la empleada (único, autoincremental)
    nombre VARCHAR(100) NOT NULL,                       -- Nombre obligatorio de la empleada
    id_departamento INT,                                -- Columna que relaciona con la tabla 'departamentos'

    FOREIGN KEY (id_departamento)                       -- Declaramos la clave foránea directamente
        REFERENCES departamentos(id_departamento)       -- Indica que se relaciona con 'departamentos.id_departamento'
        ON DELETE SET NULL                              -- Si se borra un departamento, deja esta columna en NULL
        ON UPDATE CASCADE                               -- Si cambia el ID del departamento, se actualiza aquí también
        */
    CREATE TABLE IF NOT EXISTS empleadas_en_proyectos (
		id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
        id_empleada INT, -- crear la columna que ya existe en la tabla madre, antes de decir que es foreign key.
        
		FOREIGN KEY (id_empleada)
			REFERENCES empleadas(id_empleada)
            ON DELETE CASCADE
            ON UPDATE CASCADE
            );

    /*Ejercicio 4: Crea la tabla customers (sin tener en cuenta claves foráneas relacionadas con la tabla Employees).*/
    
    CREATE TABLE clientes (
		id_cliente INT);
    
    