drop schema if exists peliculas_complejo;
create schema peliculas_complejo;
use peliculas_complejo;

create table Directores (
	id_director INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

create table Actores (
	id_actor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

create table Peliculas (
	id_pelicula INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(200) NOT NULL,
    anio INT NOT NULL,
    id_director INT NOT NULL,
    genero VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_director) REFERENCES Directores(id_director)
);

create table PeliculasActores (
	id_pelicula INT NOT NULL,
    id_actor INT NOT NULL,
    rol VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_pelicula, id_actor),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula),
    FOREIGN KEY (id_actor) REFERENCES Actores(id_actor)
);

insert into Directores (nombre) values
('Frank Darabont'),
('Francis Ford Coppola'),
('Christopher Nolan'),
('Quentin Tarantino'),
('Robert Zemeckis'),
('David Fincher'),
('Lana Wachowski'),
('Peter Jackson'),
('Irvin Kershner'),
('Milos Forman'),
('Martin Scorsese'),
('Jonathan Demme'),
('Steven Spielberg'),
('Ridley Scott'),
('Roger Allers'),
('George Lucas'),
('James Cameron'),
('Mel Gibson'),
('Stanley Kubrick'),
('Joel Coen'),
('John Lasseter'),
('Andrew Stanton'),
('Pete Docter'),
('Brad Bird'),
('Damien Chazelle'),
('George Miller');

insert into Actores (nombre) values
('Tim Robbins'),
('Morgan Freeman'),
('Marlon Brando'),
('Al Pacino'),
('Christian Bale'),
('Heath Ledger'),
('John Travolta'),
('Samuel L. Jackson'),
('Tom Hanks'),
('Robin Wright'),
('Leonardo DiCaprio'),
('Joseph Gordon-Levitt'),
('Brad Pitt'),
('Edward Norton'),
('Keanu Reeves'),
('Laurence Fishburne'),
('Elijah Wood'),
('Ian McKellen'),
('Mark Hamill'),
('Harrison Ford'),
('Matthew McConaughey'),
('Anne Hathaway'),
('Jack Nicholson'),
('Louise Fletcher'),
('Robert De Niro'),
('Ray Liotta'),
('Jodie Foster'),
('Anthony Hopkins'),
('Matt Damon'),
('Liam Neeson'),
('Ralph Fiennes'),
('Michael Clarke Duncan'),
('Hugh Jackman'),
('Russell Crowe'),
('Joaquin Phoenix'),
('Guy Pearce'),
('Carrie-Anne Moss'),
('Martin Sheen'),
('Sigourney Weaver'),
('Tom Skerritt'),
('Jamie Foxx'),
('Christoph Waltz'),
('Matthew Broderick'),
('Jeremy Irons'),
('Michael J. Fox'),
('Christopher Lloyd'),
('Arnold Schwarzenegger'),
('Linda Hamilton'),
('Sophie Marceau'),
('Harvey Keitel'),
('Tim Roth'),
('Rutger Hauer'),
('Sam Neill'),
('Laura Dern'),
('Kate Winslet'),
('Sam Worthington'),
('Zoe Saldana'),
('Jesse Eisenberg'),
('Andrew Garfield'),
('Shelley Duvall'),
('Miles Teller'),
('J.K. Simmons'),
('Tom Hardy'),
('Charlize Theron'),
('Jeff Bridges'),
('John Goodman'),
('Malcolm McDowell'),
('Patrick Magee'),
('Patton Oswalt'),
('Ian Holm'),
('Ben Burtt'),
('Elissa Knight'),
('Craig T. Nelson'),
('Holly Hunter'),
('John Goodman'),
('Billy Crystal');

INSERT INTO Peliculas (titulo, anio, id_director, genero) VALUES
('The Shawshank Redemption', 1994, 1, 'Drama'),
('The Godfather', 1972, 2, 'Crime'),
('The Dark Knight', 2008, 3, 'Action'),
('Pulp Fiction', 1994, 4, 'Crime'),
('Forrest Gump', 1994, 5, 'Drama'),
('Inception', 2010, 3, 'Sci-Fi'),
('Fight Club', 1999, 6, 'Drama'),
('The Matrix', 1999, 7, 'Sci-Fi'),
('The Lord of the Rings: The Return of the King', 2003, 8, 'Fantasy'),
('The Empire Strikes Back', 1980, 9, 'Sci-Fi'),
('Interstellar', 2014, 3, 'Sci-Fi'),
('One Flew Over the Cuckoo''s Nest', 1975, 10, 'Drama'),
('Goodfellas', 1990, 11, 'Crime'),
('The Silence of the Lambs', 1991, 12, 'Thriller'),
('Saving Private Ryan', 1998, 13, 'War'),
('Schindler''s List', 1993, 13, 'Biography'),
('Se7en', 1995, 6, 'Crime'),
('The Green Mile', 1999, 1, 'Drama'),
('The Prestige', 2006, 3, 'Mystery'),
('Gladiator', 2000, 14, 'Action'),
('Memento', 2000, 3, 'Mystery'),
('Apocalypse Now', 1979, 2, 'War'),
('Alien', 1979, 14, 'Horror'),
('Django Unchained', 2012, 4, 'Western'),
('The Lion King', 1994, 15, 'Animation'),
('Star Wars', 1977, 16, 'Sci-Fi'),
('Back to the Future', 1985, 5, 'Adventure'),
('The Terminator', 1984, 17, 'Action'),
('Braveheart', 1995, 18, 'Biography'),
('Reservoir Dogs', 1992, 4, 'Crime'),
('Blade Runner', 1982, 14, 'Sci-Fi'),
('Jurassic Park', 1993, 13, 'Adventure'),
('Titanic', 1997, 17, 'Romance'),
('Avatar', 2009, 17, 'Sci-Fi'),
('The Social Network', 2010, 6, 'Biography'),
('The Shining', 1980, 19, 'Horror'),
('Whiplash', 2014, 25, 'Drama'),
('The Departed', 2006, 11, 'Crime'),
('Mad Max: Fury Road', 2015, 26, 'Action'),
('The Big Lebowski', 1998, 20, 'Comedy'),
('A Clockwork Orange', 1971, 19, 'Crime'),
('Toy Story', 1995, 21, 'Animation'),
('Finding Nemo', 2003, 22, 'Animation'),
('Inside Out', 2015, 23, 'Animation'),
('Up', 2009, 23, 'Animation'),
('WALL-E', 2008, 22, 'Animation'),
('The Incredibles', 2004, 24, 'Animation'),
('Monsters, Inc.', 2001, 23, 'Animation'),
('Ratatouille', 2007, 24, 'Animation');

insert into PeliculasActores (id_pelicula, id_actor, rol) values
(1, 1, 'Principal'),
(1, 2, 'Secundario'),
(2, 3, 'Principal'),
(2, 4, 'Secundario'),
(3, 5, 'Principal'),
(3, 6, 'Secundario'),
(4, 7, 'Principal'),
(4, 8, 'Secundario'),
(5, 9, 'Principal'),
(5, 10, 'Secundario'),
(6, 11, 'Principal'),
(6, 12, 'Secundario'),
(7, 13, 'Principal'),
(7, 14, 'Secundario'),
(8, 15, 'Principal'),
(8, 16, 'Secundario'),
(9, 17, 'Principal'),
(9, 18, 'Secundario'),
(10, 19, 'Principal'),
(10, 20, 'Secundario'),
(11, 21, 'Principal'),
(11, 22, 'Secundario'),
(12, 23, 'Principal'),
(12, 24, 'Secundario'),
(13, 25, 'Principal'),
(13, 26, 'Secundario'),
(14, 27, 'Principal'),
(14, 28, 'Secundario'),
(15, 9, 'Principal'),
(15, 29, 'Secundario'),
(16, 30, 'Principal'),
(16, 31, 'Secundario'),
(17, 13, 'Principal'),
(17, 2, 'Secundario');


-- Consultas

-- Realiza consultas y funciones que afecten a varias tablas a la vez.

select * from Peliculas where genero = "crime";

select P.titulo, D.nombre as director
from Peliculas P
join Directores D on P.id_director = D.id_director 
where D.nombre = "Francis Ford Coppola";

-- Una consulta que devuelva todas las películas.

select * from Peliculas;

-- Una consulta que devuelva las películas entre el 1980 y 2000

select * from Peliculas where anio between 1980 and 2000;

-- Una consulta que devuelva la cantidad de películas de un género bajo el nombre de "num_peliculas"

select genero, count(*) as num_peliculas 
from Peliculas 
group by genero; 

-- Una consulta que devuelva todas las películas con sus actores principales y secundarios (deberían ser 3 tablas distintas)

select P.titulo, D.nombre as director, A.nombre AS actor, PA.rol
from Peliculas P
join Directores D on P.id_director = D.id_director
join PeliculasActores PA ON P.id_pelicula = PA.id_pelicula
join Actores A on PA.id_actor = A.id_actor;

-- Una consulta que seleccione todas las películas que tengan un actor específico

select P.titulo, A.nombre as actor
from Peliculas P
join PeliculasActores PA on P.id_pelicula = PA.id_pelicula
join Actores A on PA.id_actor = A.id_actor
where A.nombre = 'Leonardo DiCaprio';

-- Inserta datos en varias tablas a la vez usando START TRANSACTION y COMMIT.

start transaction;

insert into Directores (nombre) 
values ('Billy Wilder');
set @last_director_id = LAST_INSERT_ID();

insert into Peliculas (titulo, anio, id_director, genero) 
values ('The Apartment', 1962, @last_director_id, 'Romance');
set @last_pelicula_id = LAST_INSERT_ID();

insert into Actores (nombre) 
values ('Jack Lemmon');
set @last_actor_id1 = LAST_INSERT_ID();

insert into Actores (nombre) 
values ('Shirley MacLaine');
set @last_actor_id2 = LAST_INSERT_ID();

insert into PeliculasActores (id_pelicula, id_actor, rol) 
values (@last_pelicula_id, @last_actor_id1, 'principal'),
       (@last_pelicula_id, @last_actor_id2, 'secundario');

commit;



