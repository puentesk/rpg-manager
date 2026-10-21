CREATE DATABASE rpg_manager CHARACTER SET utf8mb4;

CREATE TABLE clase (
    id_clase INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL UNIQUE,
    descripcion VARCHAR(255)
);

CREATE TABLE personaje (
    id_personaje INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    id_clase INT NOT NULL,
    nivel INT NOT NULL CHECK (nivel BETWEEN 1 AND 100),
    vida INT NOT NULL CHECK (vida >= 0),
    FOREIGN KEY (id_clase) REFERENCES clase (id_clase)
);