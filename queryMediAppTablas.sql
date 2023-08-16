CREATE DATABASE MediApp

CREATE TABLE usuario(
   idUsuario INT PRIMARY KEY IDENTITY(1,1),
   nombre VARCHAR(60),
   apellidos VARCHAR(60),
   codigocli VARCHAR(60),
   descrUsuario VARCHAR(60),
   claveUsuario VARCHAR(60)
);


CREATE TABLE especialidad(
    idEspecialidad INT PRIMARY KEY IDENTITY(1,1),
	descripcion VARCHAR(60)
);

CREATE TABLE medico(
    idMedico INT PRIMARY KEY IDENTITY (1,1),
	nombre VARCHAR(60),
	apellidos VARCHAR(60),
	nroDocumento VARCHAR(60),
	edad INT,
	estado BIT,
	idEspecialidad INT FOREIGN KEY REFERENCES especialidad(idEspecialidad)
);

CREATE TABLE Consultorio(
    idConsultorio INT PRIMARY KEY IDENTITY(1,1),
	descripcion VARCHAR(60)
);

CREATE TABLE medico_vs_consultorio(
   idMedico INT FOREIGN KEY REFERENCES medico(idMedico),
   idConsultorio INT FOREIGN KEY REFERENCES consultorio(idConsultorio)
);

CREATE TABLE Paciente(
   idPaciente INT PRIMARY KEY IDENTITY(1,1),
   edad INT,
   sexo CHAR(1),
   nroDocumento VARCHAR(10),
   direccion VARCHAR(150),
   telefono VARCHAR(20),
   idUsuario INT FOREIGN KEY REFERENCES usuario(idUsuario) 
);

CREATE TABLE citas(
   idCita INT PRIMARY KEY IDENTITY(1,1),
   nombrePac VARCHAR(40),
   apellidosPac VARCHAR(40),
   telefono VARCHAR(20),
   edad INT,
   fecha DATETIME,
   hora VARCHAR(6),
   motivo VARCHAR(200),
   idMedico INT FOREIGN KEY REFERENCES medico(idMedico)
);

CREATE TABLE historial_citas(
   idHistorial INT PRIMARY KEY IDENTITY(1,1),
   idCita INT FOREIGN KEY REFERENCES citas(idCita)
);

CREATE TABLE HorarioAtencion(
   idHorarioAtencion INT PRIMARY KEY IDENTITY(1,1),
   fecha DATETIME,
   hora VARCHAR(6),
   idMedico INT FOREIGN KEY REFERENCES medico(idMedico)
);

CREATE TABLE medico_vs_especialidad(
   idMedico INT FOREIGN KEY REFERENCES medico(idMedico),
   idEspecialidad INT FOREIGN KEY REFERENCES especialidad(idEspecialidad)
);