CREATE PROCEDURE [dbo].[spListarMedicos]
AS
BEGIN
     SELECT idMedico, nombre, apellidos
	 FROM medico
END



CREATE PROCEDURE [dbo].[spRegistrarCita]
(
   @prmTelefono VARCHAR(20),
   @prmFecha DATETIME,
   @prmHora VARCHAR(6),
   @prmMotivo VARCHAR(200),
   @prmIdMedico INT,
   @prmIdUsuario INT
)
AS
   BEGIN
       INSERT INTO citas(telefono, fecha, hora, motivo, idMedico, idUsuario)
	   VALUES(@prmTelefono, @prmFecha, @prmHora, @prmMotivo, @prmIdMedico, @prmIdUsuario);
   END


CREATE PROCEDURE [dbo].[spRegistrarUsuario]
(
   @prmNombre VARCHAR(60),
   @prmApellidos VARCHAR(60),
   @prmCodigoCli VARCHAR(60),
   @prmDescrUsuario VARCHAR(60),
   @prmClaveUsuario VARCHAR(60)
)
AS
   BEGIN
       INSERT INTO usuario(nombre, apellidos, codigocli, descrUsuario, claveUsuario)
	   VALUES(@prmNombre, @prmApellidos, @prmCodigoCli, @prmDescrUsuario, @prmClaveUsuario);
   END


CREATE PROCEDURE [dbo].[spListarMedicosDef]
(
   @prmIdEspecialidad INT
)
AS
BEGIN
     SELECT idMedico, nombre, apellidos
	 FROM medico
	 WHERE idEspecialidad = @prmIdEspecialidad
END


CREATE PROCEDURE [dbo].[spInfoMedicos]
(
   @prmIdEspecialidad INT
)
AS
BEGIN
     SELECT M.nombre, M.apellidos, E.descripcion, C.descripcion
     FROM medico_vs_consultorio MC
     INNER JOIN medico M ON (MC.idMedico = M.idMedico)
     INNER JOIN especialidad E ON (M.idEspecialidad = E.idEspecialidad)
     INNER JOIN Consultorio C ON (MC.idConsultorio = C.idConsultorio)
     WHERE M.idEspecialidad = @prmIdEspecialidad 

END

CREATE PROCEDURE [dbo].[spActualizarCita]
(
   @prmidCita INT,
   @prmTelefono VARCHAR(20),
   @prmFecha DATETIME,
   @prmHora VARCHAR(6),
   @prmMotivo VARCHAR(200),
   @prmIdMedico INT
)
AS
   BEGIN
        UPDATE citas SET telefono = @prmTelefono, fecha = @prmFecha, hora = @prmHora, motivo = @prmMotivo, idMedico = @prmIdMedico
		WHERE idCita = @prmidCita
   END


CREATE PROCEDURE [dbo].[spCitasPendientes]
(
   @prmIdUsuario INT
)
AS
BEGIN
     SELECT FORMAT (C.fecha, 'MM-dd-yyyy') AS fecha, C.idCita AS idCita ,C.hora AS hora, C.motivo AS motivo, C.telefono AS telefono, M.nombre AS nombre, M.apellidos AS apellidos, E.descripcion AS especialidad
     FROM citas C
     INNER JOIN medico M ON (M.idMedico = C.idMedico)
	 INNER JOIN especialidad E ON (M.idEspecialidad = E.idEspecialidad)
     WHERE C.idUsuario = @prmIdUsuario 
	 AND C.estado = 1
	 AND fecha >= CONVERT(DATE, GETDATE())
	 ORDER BY fecha ASC
END

CREATE PROCEDURE [dbo].[spEliminarCita]
(
   @prmIdCita INT
)
AS
   BEGIN
        UPDATE citas SET estado = 0
		WHERE idCita = @prmIdCita
   END


CREATE PROCEDURE [dbo].[spHistorial]
(
   @prmIdUsuario INT
)
AS
BEGIN
     SELECT FORMAT (C.fecha, 'MM-dd-yyyy') AS fecha, C.hora AS hora, M.nombre AS nombre, M.apellidos AS apellidos
     FROM historial_citas HC
     INNER JOIN citas C ON (HC.idCita = C.idCita)
     INNER JOIN medico M ON (C.idMedico = M.idMedico)
     WHERE C.idUsuario = @prmIdUsuario
     ORDER BY HC.idHistorial DESC
END


CREATE PROCEDURE [dbo].[spInfoMedicosTodos]
AS
BEGIN
     SELECT M.nombre AS nombre, M.apellidos AS apellidos, E.descripcion AS especialidad, C.descripcion AS consultorio
     FROM medico_vs_consultorio MC
     INNER JOIN medico M ON (MC.idMedico = M.idMedico)
     INNER JOIN especialidad E ON (M.idEspecialidad = E.idEspecialidad)
     INNER JOIN Consultorio C ON (MC.idConsultorio = C.idConsultorio)
END


CREATE PROCEDURE [dbo].[spListarEspecialidades]
AS
BEGIN
     SELECT idEspecialidad, descripcion
	 FROM especialidad
END


CREATE PROCEDURE [dbo].[spListarTipoUsuario]
AS
BEGIN
     SELECT idTipoUsuario, descripcion
	 FROM tipo_usuario
END


CREATE PROCEDURE [dbo].[spTipoUsuario]
(
   @prmDescrUsuario VARCHAR(60)
)
AS
BEGIN
     SELECT idTipoUsuario 
     FROM usuario 
     WHERE descrUsuario = @prmDescrUsuario
END
