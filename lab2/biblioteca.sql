-- Ejercicio 1

-- Películas -- N:1 -- Directores
-- Películas -- N:1 -- Generos
-- Películas -- N:1 -- Paises
-- Películas -- M:N -- Actores


-- Coches -- N:1 -- Propietarios
-- Cohes -- N:1 -- Talleres


-- equiposfutbol -- M:N -- jugadores


-- Canciones -- N:1 -- Compositores
-- Canciones -- N:1 -- generosCanciones
-- Canciones -- N:1 -- Albums
-- Albums -- N:1 -- Artistas


-- Animales -- N:1 -- propietariosanimales
-- Animales -- N:1 -- veterinarios

create database if not exists biblioteca;
use biblioteca;

drop database if exists biblioteca;

create database biblioteca;

use biblioteca;

create table Libros (
	id_libro INT primary key auto_increment,
	titulo VARCHAR(255) not null,
	ISBN VARCHAR(20) not null,
	fecha_publicacion DATE
);

create table Autores (
	id_autor INT primary key auto_increment,
	nombr VARCHAR(255) not null,
	fecha_nacimiento DATE,
	nacionalidad VARCHAR(255)
);

create table Generos (
	id_genero INT primary key auto_increment,
	nombre VARCHAR(255) not null,
	descripcion TEXT
);

create table Miembros (
	id_miembro INT primary key auto_increment,
	nombre VARCHAR(255) not null,
	direccion VARCHAR(255),
	telefono VARCHAR(15),
	correo_electronico VARCHAR(255)
);

create table prestamos (
	id_prestamo INT primary key auto_increment,
	fecha_inicio DATE,
	fecha_devolucion DATE,
	id_miembro INT,
	foreign key (id_miembro) references Miembros(id_miembro)
);

create table Libros_Autores (
	id_libro INT,
	id_autor INT,
	primary key (id_libro, id_autor),
	foreign key (id_libro) references Libros(id_libro),
	foreign key (id_autor) references Autores(id_autor)
);

create table Libros_Generos (
	id_libro INT,
	id_genero INT,
	primary key (id_libro, id_genero),
	foreign key (id_libro) references Libros(id_libro),
	foreign key (id_genero) references Generos(id_genero)
);

create table Prestamos_Libros (
	id_prestamo INT,
	id_libro INT,
	primary key (id_prestamo, id_libro),
	foreign key (id_prestamo) references Prestamos(id_prestamo),
	foreign key (id_libro) references Libros(id_libro)
);


-- Un Autor puede escribir uno o varios libros y un libro puede tener uno o más autores.
-- Un miembro puede tener uno o más préstamos y un préstamos solo está asociado a un miembro.
-- Un libro puede tener uno o más géneros y un género puede tener uno o más libros.
-- Un libro puede ser prestado varias veces a lo largo del tiempo y un préstamo puede incluir uno o más libros.

