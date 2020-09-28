-- Crear base de datos 
CREATE DATABASE presta_libros;
\c presta_libros;
-- Crear tablas
CREATE TABLE lector (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);
CREATE TABLE editorial (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);
CREATE TABLE libro (
    codigo INT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    fecha_devolucion DATE NOT NULL,
    id_lector INT NOT NULL UNIQUE,
    id_editorial INT NOT NULL UNIQUE,
    FOREIGN KEY (id_lector) REFERENCES lector(id),
    FOREIGN KEY (id_editorial) REFERENCES editorial(id)
);
CREATE TABLE autor (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);
CREATE TABLE libro_autor (
    codigo_libro INT NOT NULL UNIQUE,
    id_autor INT NOT NULL UNIQUE,
    FOREIGN KEY (codigo_libro) REFERENCES libro(codigo),
    FOREIGN KEY (id_autor) REFERENCES autor(id)
);