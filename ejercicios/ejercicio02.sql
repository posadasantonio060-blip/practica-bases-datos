CREATE DATABASE tienda;
USE tienda;

CREATE TABLE productos (
    id INT PRIMARY KEY,
    nombre VARCHAR(80),
    categoria VARCHAR(50),
    precio DECIMAL(10,2),
    existencia INT
);

INSERT INTO productos VALUES
(1,'Teclado mecánico','Periféricos',850.00,12),
(2,'Mouse inalámbrico','Periféricos',350.00,20),
(3,'Monitor 24 pulgadas','Monitores',2899.00,8),
(4,'Memoria USB 64GB','Almacenamiento',220.00,30),
(5,'SSD 1TB','Almacenamiento',1450.00,10),
(6,'Audífonos gamer','Audio',799.00,15);

SELECT * FROM productos;
SELECT nombre, precio FROM productos;
SELECT * FROM productos WHERE precio > 800;

UPDATE productos SET precio = 2799.00 WHERE id = 3;
UPDATE productos SET existencia = 25 WHERE id = 2;
DELETE FROM productos WHERE id = 4;
SELECT * FROM productos;
