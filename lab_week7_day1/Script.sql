CREATE DATABASE empresa;
USE empresa;

CREATE TABLE departamentos (
    departamento_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE empleados (
    empleado_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    departamento_id INT,
    CONSTRAINT fk_departamento_empleado FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id)
);

CREATE TABLE proyectos (
    proyecto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE empleado_proyecto (
    empleado_id INT,
    proyecto_id INT,
    PRIMARY KEY (empleado_id, proyecto_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id),
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id)
);

CREATE TABLE detalles_empleado (
    empleado_id INT PRIMARY KEY,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);

INSERT INTO departamentos (nombre) VALUES
	('Recursos Humanos'),
	('Tecnología'),
	('Ventas');

INSERT INTO empleados (nombre, salario, departamento_id) VALUES
	('Juan Pérez', 1000.00, 1),
	('Ana Gómez', 1500.00, 2),
	('Luis Torres', 2000.00, 3);

INSERT INTO proyectos (nombre) VALUES
	('Proyecto A'),
	('Proyecto B');

INSERT INTO empleado_proyecto (empleado_id, proyecto_id) VALUES
	(1, 1),
	(2, 2),
	(3, 1);

INSERT INTO detalles_empleado (empleado_id, direccion, telefono) VALUES
	(1, 'Calle Falsa 123', '555-1234'),
	(2, 'Avenida Siempre Viva 742', '555-5678'),
	(3, 'Boulevard de los Sueños 99', '555-8765');

DELIMITER //

CREATE FUNCTION calcular_bonificacion(empleado_id INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE salario_base DECIMAL(10,2);
    DECLARE bonificacion DECIMAL(10,2);

    SELECT salario INTO salario_base FROM empleados WHERE empleado_id = empleado_id;

    SET bonificacion = salario_base * 0.10;

    RETURN bonificacion;
END //

DELIMITER ;

ALTER TABLE empleados DROP FOREIGN KEY fk_departamento_empleado;

ALTER TABLE empleados ADD CONSTRAINT fk_departamento_empleado FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id);
