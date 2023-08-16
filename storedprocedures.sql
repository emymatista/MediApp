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