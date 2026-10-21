USE rpg_manager;

INSERT INTO clase (nombre, descripcion) VALUES
('Guerrero', 'Especialista en combate cuerpo a cuerpo'),
('Mago', 'Dominador de las artes arcanas'),
('Arquero', 'Experto en ataques a distancia');

INSERT INTO personaje (nombre, id_clase, nivel, vida) 
VALUES ('pepe', 1, 10, 100);

SELECT * FROM personaje;

SHOW TABLES;