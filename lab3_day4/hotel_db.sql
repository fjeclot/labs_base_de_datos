drop schema if exists hotel_db;
create schema hotel_db;
use hotel_db;

create table Hotel (
	id int primary key auto_increment,
	nombre VARCHAR(100) not null,
	direccion VARCHAR(255) not null
);

create table Habitacion (
	id int primary key auto_increment,
	numero int not null,
	tipo VARCHAR(50),
	hotel_id int,
	estado VARCHAR(50) default 'Disponible',
	foreign key (hotel_id) references Hotel(id)
);

create table Cliente (
	id int primary key auto_increment,
	nombre VARCHAR(100) not null,
	email VARCHAR(100) not null
);

create table Reserva (
	id int primary key auto_increment,
	cliente_id int,
	habitacion_id int,
	fecha_inicio date not null,
	fecha_fin date not null,
	estado VARCHAR(50) default 'Activa',
	foreign key (cliente_id) references Cliente(id),
	foreign key (habitacion_id) references Habitacion(id)
);

create table Servicio (
	id int primary key auto_increment,
	nombre VARCHAR(255),
	descripcion text
);

create table Reserva_Servicio (
	reserva_id int,
	servicio_id int,
	primary key (reserva_id, servicio_id),
	foreign key (reserva_id) references Reserva(id),
	foreign key (servicio_id) references Servicio(id)
);


insert into Hotel (id, nombre, direccion) values
	(1, 'Hotel Hilton', 'Barcelona'),
	(2, 'Hotel Barcelo', 'Badalona');

insert into Habitacion (numero, tipo, hotel_id) values
	(100, 'Individual', 1),
	(101, 'Matrimonial', 1),
	(200, 'Individual', 2),
	(201, 'Suite', 2);

insert into Cliente (nombre, email) values
	('Javier Campos', 'javierc@gmail.com'),
	('Luis Dasilva', 'luisdasilva@gmail.com');

insert into Reserva (cliente_id, habitacion_id, fecha_inicio, fecha_fin) values
	(1, 1, '2024-06-01', '2024-06-15'),
	(2, 2, '2024-06-15', '2024-06-25');

insert into Servicio (nombre, descripcion) values
	('Comida', 'Servicio de comida en la habitación'),
	('Taxi', 'Servicio de taxi al cliente');

insert into Reserva_Servicio (reserva_id, servicio_id) values
	(1, 1),
	(2, 2);

-- Parte 3: Alteración de Tablas

alter table Reserva
add column fecha_checkin date,
add column fecha_checkout date;

-- Parte 4: Consultas con Joins
-- Obtener la lista de habitaciones reservadas junto con los nombres de los clientes que las ocupan.

select Habitacion.numero, Cliente.nombre as nombre_cliente, Reserva.fecha_inicio, Reserva.fecha_fin
from Habitacion
join Reserva on Habitacion.id = Reserva.habitacion_id
join Cliente on Reserva.cliente_id = Cliente.id;

-- Obtener la lista de servicios reservados por un cliente específico junto con los detalles de cada servicio.

select Cliente.nombre as nombre_cliente, Servicio.nombre as nombre_servicio, Servicio.descripcion
from Cliente 
join Reserva on Cliente.id = Reserva.cliente_id
join Reserva_Servicio on Reserva.id = Reserva_Servicio.reserva_id
join Servicio on Reserva_Servicio.servicio_id = Servicio.id
where Cliente.id = 2;

-- Parte 5: Retos Adicionales

create trigger after_reserva_insert
after insert on Reserva
for each row
begin
	update Habitacion
	set estado = 'Reservada'
	where habitacion_id = NEW.habitacion_id;
end;


select *
from Habitacion
where hotel_id = 1
and estado = 'Ocupada'
and id in (
	select habitacion_id
	from Reserva
	where estado = 'Activa'
);


	
	