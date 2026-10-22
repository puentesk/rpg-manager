USE rpg_manager;

INSERT INTO clase (nombre, descripcion) VALUES
('Guerrero', 'Especialista en combate cuerpo a cuerpo'),
('Mago', 'Dominador de las artes arcanas'),
('Arquero', 'Experto en ataques a distancia');

INSERT INTO personaje (nombre, id_clase, nivel, vida) 
VALUES ('pepe', 1, 10, 100);

SELECT * FROM personaje;

SHOW TABLES;

SELECT nombre, vida
FROM personaje
WHERE nivel >= 5;

SELECT nombre, vida
FROM personaje
WHERE nivel >= 5
ORDER BY nivel DESC;

SELECT * 
FROM personaje 
WHERE nombre LIKE 'p%';

SELECT * 
FROM personaje 
WHERE nombre LIKE '%e';

SELECT * 
FROM personaje 
WHERE nivel >= 5 AND vida = 100;

SELECT * 
FROM personaje 
WHERE nivel < 5 OR vida = 100;

SELECT * FROM personaje WHERE id_clase IN (1, 3, 5);

SELECT *
FROM personaje
WHERE id_clase IS NOT NULL;

SELECT p.nombre AS personaje, c.nombre AS clase
FROM personaje p
JOIN clase c ON p.id_clase = c.id_clase;

SELECT COUNT(*) AS total_personajes, AVG(nivel) AS nivel_promedio
FROM personaje;

SELECT id_clase, COUNT(*) AS cantidad_personajes
FROM personaje
GROUP BY id_clase
HAVING COUNT(*) > 0;