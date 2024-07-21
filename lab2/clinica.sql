drop schema if exists clinica;
create schema clinica;
use clinica;

create table Pacientes (
	id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    fecha_nacimiento DATE,
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    correo_electronico VARCHAR(255)
);

create table Doctores (
	id_doctor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    especialidad VARCHAR(255),
    telefono VARCHAR(15),
    correo_electronico VARCHAR(255)	
);

create table Citas (
	id_cita INT PRIMARY KEY AUTO_INCREMENT,
    fecha_cita DATE,
    hora_cita TIME,
    motivo_cita TEXT,
    id_paciente INT,
    id_doctor INT,
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_doctor) REFERENCES Doctores(id_doctor)
);

create table Tratamientos (
	id_tratamiento INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    duracion INT
);

create table Medicamentos (
	id_medicamento INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    dosis VARCHAR(50)
);

create table Citas_Tratamientos (
	id_cita INT,
    id_tratamiento INT,
    PRIMARY KEY (id_cita, id_tratamiento),
    FOREIGN KEY (id_cita) REFERENCES Citas(id_cita),
    FOREIGN KEY (id_tratamiento) REFERENCES Tratamientos(id_tratamiento)
);

create table Tratamientos_Medicamentos (
	id_tratamiento INT,
    id_medicamento INT,
    PRIMARY KEY (id_tratamiento, id_medicamento),
    FOREIGN KEY (id_tratamiento) REFERENCES Tratamientos(id_tratamiento),
    FOREIGN KEY (id_medicamento) REFERENCES Medicamentos(id_medicamento)
);

-- Un PACIENTE puede tener una o varias citas y una CITA está asociada a un paciente.
-- Un DOCTOR puede dar una o varias citas y una CITA está asociada a un solo doctor.
-- Una CITA puede ofrecer uno varios tratamientos y un TRATAMIENTO puede puede durar una o varias citas.
-- Un TRATAMIENTO puede consistir en uno o varios medicamentos y un MEDICAMENTO puede valer para uno o varios tratamientos.



