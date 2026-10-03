CREATE DATABASE videojuegos;
USE videojuegos;

CREATE TABLE juegos (
    id INT PRIMARY KEY,
    titulo VARCHAR(100),
    genero VARCHAR(50),
    plataforma VARCHAR(50),
    anio INT
);

INSERT INTO juegos VALUES
(1,'Minecraft','Sandbox','PC',2011),
(2,'Grand Theft Auto V','Acción','PC',2013),
(3,'Fortnite','Battle Royale','PC',2017),
(4,'The Last of Us','Acción/Aventura','PlayStation',2013),
(5,'Forza Horizon 5','Carreras','Xbox',2021),
(6,'Super Mario Odyssey','Plataformas','Nintendo Switch',2017),
(7,'EA Sports FC 26','Deportes','PlayStation',2025),
(8,'Halo Infinite','Shooter','Xbox',2021);

SELECT * FROM juegos;
SELECT titulo, plataforma FROM juegos;
SELECT * FROM juegos WHERE plataforma = 'Xbox';
SELECT * FROM juegos WHERE anio > 2018;

UPDATE juegos SET plataforma = 'PC' WHERE id = 8;
UPDATE juegos SET anio = 2018 WHERE id = 3;
DELETE FROM juegos WHERE id = 2;
SELECT * FROM juegos;
