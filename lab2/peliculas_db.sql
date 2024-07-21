drop schema if exists peliculas_db;
create schema peliculas_db;
use peliculas_db;

create table Peliculas (
	id INT primary key auto_increment,
	titulo VARCHAR(255) not null,
	anio INT not null,
	director VARCHAR(255) not null,
	actor_principal VARCHAR(255) not null,
	actor_secundario VARCHAR(255) not null,
	genero VARCHAR(255) not null
);

INSERT INTO Peliculas (titulo, anio, director, actor_principal, actor_secundario, genero) VALUES
('The Shawshank Redemption', 1994, 'Frank Darabont', 'Tim Robbins', 'Morgan Freeman', 'Drama'),
('The Godfather', 1972, 'Francis Ford Coppola', 'Marlon Brando', 'Al Pacino', 'Crime'),
('The Dark Knight', 2008, 'Christopher Nolan', 'Christian Bale', 'Heath Ledger', 'Action'),
('Pulp Fiction', 1994, 'Quentin Tarantino', 'John Travolta', 'Samuel L. Jackson', 'Crime'),
('Forrest Gump', 1994, 'Robert Zemeckis', 'Tom Hanks', 'Robin Wright', 'Drama'),
('Inception', 2010, 'Christopher Nolan', 'Leonardo DiCaprio', 'Joseph Gordon-Levitt', 'Sci-Fi'),
('Fight Club', 1999, 'David Fincher', 'Brad Pitt', 'Edward Norton', 'Drama'),
('The Matrix', 1999, 'Lana Wachowski', 'Keanu Reeves', 'Laurence Fishburne', 'Sci-Fi'),
('The Lord of the Rings: The Return of the King', 2003, 'Peter Jackson', 'Elijah Wood', 'Ian McKellen', 'Fantasy'),
('The Empire Strikes Back', 1980, 'Irvin Kershner', 'Mark Hamill', 'Harrison Ford', 'Sci-Fi'),
('Interstellar', 2014, 'Christopher Nolan', 'Matthew McConaughey', 'Anne Hathaway', 'Sci-Fi'),
('One Flew Over the Cuckos Nest', 1975, 'Milos Forman', 'Jack Nicholson', 'Louise Fletcher', 'Drama'),
('Goodfellas', 1990, 'Martin Scorsese', 'Robert De Niro', 'Ray Liotta', 'Crime'),
('The Silence of the Lambs', 1991, 'Jonathan Demme', 'Jodie Foster', 'Anthony Hopkins', 'Thriller'),
('Saving Private Ryan', 1998, 'Steven Spielberg', 'Tom Hanks', 'Matt Damon', 'War'),
('Schindlers List', 1993, 'Steven Spielberg', 'Liam Neeson', 'Ralph Fiennes', 'Biography'),
('Se7en', 1995, 'David Fincher', 'Brad Pitt', 'Morgan Freeman', 'Crime'),
('The Green Mile', 1999, 'Frank Darabont', 'Tom Hanks', 'Michael Clarke Duncan', 'Drama'),
('The Prestige', 2006, 'Christopher Nolan', 'Hugh Jackman', 'Christian Bale', 'Mystery'),
('Gladiator', 2000, 'Ridley Scott', 'Russell Crowe', 'Joaquin Phoenix', 'Action'),
('Memento', 2000, 'Christopher Nolan', 'Guy Pearce', 'Carrie-Anne Moss', 'Mystery'),
('Apocalypse Now', 1979, 'Francis Ford Coppola', 'Martin Sheen', 'Marlon Brando', 'War'),
('Alien', 1979, 'Ridley Scott', 'Sigourney Weaver', 'Tom Skerritt', 'Horror'),
('Django Unchained', 2012, 'Quentin Tarantino', 'Jamie Foxx', 'Christoph Waltz', 'Western'),
('The Lion King', 1994, 'Roger Allers', 'Matthew Broderick', 'Jeremy Irons', 'Animation'),
('Star Wars', 1977, 'George Lucas', 'Mark Hamill', 'Harrison Ford', 'Sci-Fi'),
('Back to the Future', 1985, 'Robert Zemeckis', 'Michael J. Fox', 'Christopher Lloyd', 'Adventure'),
('The Terminator', 1984, 'James Cameron', 'Arnold Schwarzenegger', 'Linda Hamilton', 'Action'),
('Braveheart', 1995, 'Mel Gibson', 'Mel Gibson', 'Sophie Marceau', 'Biography'),
('Reservoir Dogs', 1992, 'Quentin Tarantino', 'Harvey Keitel', 'Tim Roth', 'Crime'),
('Blade Runner', 1982, 'Ridley Scott', 'Harrison Ford', 'Rutger Hauer', 'Sci-Fi'),
('Jurassic Park', 1993, 'Steven Spielberg', 'Sam Neill', 'Laura Dern', 'Adventure'),
('Titanic', 1997, 'James Cameron', 'Leonardo DiCaprio', 'Kate Winslet', 'Romance'),
('Avatar', 2009, 'James Cameron', 'Sam Worthington', 'Zoe Saldana', 'Sci-Fi'),
('The Social Network', 2010, 'David Fincher', 'Jesse Eisenberg', 'Andrew Garfield', 'Biography'),
('The Shining', 1980, 'Stanley Kubrick', 'Jack Nicholson', 'Shelley Duvall', 'Horror'),
('Whiplash', 2014, 'Damien Chazelle', 'Miles Teller', 'J.K. Simmons', 'Drama'),
('The Departed', 2006, 'Martin Scorsese', 'Leonardo DiCaprio', 'Matt Damon', 'Crime'),
('Mad Max: Fury Road', 2015, 'George Miller', 'Tom Hardy', 'Charlize Theron', 'Action'),
('The Big Lebowski', 1998, 'Joel Coen', 'Jeff Bridges', 'John Goodman', 'Comedy'),
('A Clockwork Orange', 1971, 'Stanley Kubrick', 'Malcolm McDowell', 'Patrick Magee', 'Crime'),
('Toy Story', 1995, 'John Lasseter', 'Tom Hanks', 'Tim Allen', 'Animation'),
('Finding Nemo', 2003, 'Andrew Stanton', 'Albert Brooks', 'Ellen DeGeneres', 'Animation'),
('Inside Out', 2015, 'Pete Docter', 'Amy Poehler', 'Phyllis Smith', 'Animation'),
('Up', 2009, 'Pete Docter', 'Edward Asner', 'Jordan Nagai', 'Animation'),
('WALL-E', 2008, 'Andrew Stanton', 'Ben Burtt', 'Elissa Knight', 'Animation'),
('The Incredibles', 2004, 'Brad Bird', 'Craig T. Nelson', 'Holly Hunter', 'Animation'),
('Monsters, Inc.', 2001, 'Pete Docter', 'John Goodman', 'Billy Crystal', 'Animation'),
('Ratatouille', 2007, 'Brad Bird', 'Patton Oswalt', 'Ian Holm', 'Animation');

-- Una consulta que devuelva todas las películas

select * from Peliculas;

-- Una consulta que devuelva las películas de Christopher Nolan (o de algún director que hayas puesto).

select * from Peliculas where director ="Christopher Nolan";

-- Una consulta que ordene las películas por orden descendente en función al año

select * from Peliculas order by anio desc;

-- Una consulta que devuelva las películas entre los años 1990 y 2000

select * from Peliculas where anio between 1990 and 2000;

-- Una consulta que devuelva cuántas películas hay de cada género

select genero, count(*) as num_peliculas from Peliculas group by genero;