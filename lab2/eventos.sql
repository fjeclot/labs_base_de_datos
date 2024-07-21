drop schema if exists eventos;
create schema eventos;
use eventos;

create table Eventos (
	id_evento INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    fecha_evento DATE,
    lugar VARCHAR(255),
    descripcion TEXT
);

create table Participantes (
	id_participante INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    correo_electronico VARCHAR(255)
);

create table Organizadores (
	id_organizador INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    telefono VARCHAR(15),
    correo_electronico VARCHAR(255)
);

create table Actividades (
	id_actividad INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    hora_inicio TIME,
    hora_fin TIME,
    id_evento INT,
    FOREIGN KEY (id_evento) REFERENCES Eventos(id_evento)
);

create table Eventos_Participantes (
	id_evento INT,
    id_participante INT,
    PRIMARY KEY (id_evento, id_participante),
    FOREIGN KEY (id_evento) REFERENCES Eventos(id_evento),
    FOREIGN KEY (id_participante) REFERENCES Participantes(id_participante)
);

create table Eventos_Organizadores (
	id_evento INT,
    id_organizador INT,
    PRIMARY KEY (id_evento, id_organizador),
    FOREIGN KEY (id_evento) REFERENCES Eventos(id_evento),
    FOREIGN KEY (id_organizador) REFERENCES Organizadores(id_organizador)
);

create table Actividades_Participantes (
	id_actividad INT,
    id_participante INT,
    PRIMARY KEY (id_actividad, id_participante),
    FOREIGN KEY (id_actividad) REFERENCES Actividades(id_actividad),
    FOREIGN KEY (id_participante) REFERENCES Participantes(id_participante)
);

-- Un PARTICIPANTE puede participar en una o varias actividades, y una ACTIVIDAD puede estar integrada por uno o varios participantes.
-- Un EVENTO puede tener uno o varios participantes y un PARTICIPANTE puede estar en uno o varios eventos.
-- Una ACTIVIDAD está relacionada con un evento, y un EVENTO puede tener una o varias actividades.
-- un ORGANIZADOR puede administrar uno o varios eventos, y un EVENTO puede estar administrado por uno o varios organizadores.
