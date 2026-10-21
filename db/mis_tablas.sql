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

CREATE TABLE item (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    tipo ENUM('arma', 'armadura', 'pocion', 'reliquia') NOT NULL,
    valor INT NOT NULL CHECK (valor = 0)
);

CREATE TABLE mision (
    id_mision INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL UNIQUE,
    dificultad ENUM('facil', 'media', 'dificil', 'legendaria') NOT NULL,
    recompensa_oro DECIMAL(10,2) NOT NULL CHECK (recompensa_oro >= 0),
    nivel_minimo INT NOT NULL CHECK (nivel_minimo BETWEEN 1 AND 100)
);

CREATE TABLE inventario (
    id_personaje INT NOT NULL,
    id_item INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1 CHECK (cantidad > 0),
    PRIMARY KEY (id_personaje, id_item),
    FOREIGN KEY (id_personaje) REFERENCES personaje(id_personaje),
    FOREIGN KEY (id_item) REFERENCES item(id_item)
);

CREATE TABLE personaje_mision (
    id_personaje INT NOT NULL,
    id_mision INT NOT NULL,
    estado ENUM('aceptada', 'completada', 'fallida') NOT NULL DEFAULT 'aceptada',
    PRIMARY KEY (id_personaje, id_mision),
    FOREIGN KEY (id_personaje) REFERENCES personaje(id_personaje),
    FOREIGN KEY (id_mision) REFERENCES mision(id_mision)
);