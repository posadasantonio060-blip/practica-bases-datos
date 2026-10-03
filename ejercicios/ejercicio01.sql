CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE libros (
    id INT PRIMARY KEY,
    titulo VARCHAR(100),
    autor VARCHAR(80),
    anio INT,
    categoria VARCHAR(50)
);

INSERT INTO libros VALUES
(1,'Cien años de soledad','Gabriel García Márquez',1967,'Novela'),
(2,'El principito','Antoine de Saint-Exupéry',1943,'Fábula'),
(3,'1984','George Orwell',1949,'Distopía'),
(4,'El alquimista','Paulo Coelho',1988,'Novela'),
(5,'Harry Potter y la piedra filosofal','J. K. Rowling',1997,'Fantasía');

SELECT * FROM libros;
SELECT titulo, autor FROM libros;
SELECT * FROM libros WHERE anio > 1980;

UPDATE libros SET anio = 1998 WHERE id = 5;
SELECT * FROM libros WHERE id = 5;

DELETE FROM libros WHERE id = 3;
SELECT * FROM libros;
