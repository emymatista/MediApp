USE [master]
GO
/****** Object:  Database [MediApp]    Script Date: 7/31/2023 10:13:50 PM ******/
CREATE DATABASE [MediApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MediApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MediApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MediApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MediApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MediApp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MediApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MediApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MediApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MediApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MediApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MediApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [MediApp] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MediApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MediApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MediApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MediApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MediApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MediApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MediApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MediApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MediApp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MediApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MediApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MediApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MediApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MediApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MediApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MediApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MediApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MediApp] SET  MULTI_USER 
GO
ALTER DATABASE [MediApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MediApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MediApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MediApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MediApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MediApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MediApp] SET QUERY_STORE = OFF
GO
USE [MediApp]
GO
/****** Object:  Table [dbo].[citas]    Script Date: 7/31/2023 10:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[citas](
	[idCita] [int] IDENTITY(1,1) NOT NULL,
	[telefono] [varchar](20) NULL,
	[fecha] [datetime] NULL,
	[hora] [varchar](6) NULL,
	[motivo] [varchar](200) NULL,
	[idMedico] [int] NULL,
	[idUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consultorio]    Script Date: 7/31/2023 10:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultorio](
	[idConsultorio] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[idConsultorio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[especialidad]    Script Date: 7/31/2023 10:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[especialidad](
	[idEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[historial_citas]    Script Date: 7/31/2023 10:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historial_citas](
	[idHistorial] [int] IDENTITY(1,1) NOT NULL,
	[idCita] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idHistorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HorarioAtencion]    Script Date: 7/31/2023 10:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HorarioAtencion](
	[idHorarioAtencion] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NULL,
	[hora] [varchar](6) NULL,
	[idMedico] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idHorarioAtencion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medico]    Script Date: 7/31/2023 10:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medico](
	[idMedico] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NULL,
	[apellidos] [varchar](60) NULL,
	[nroDocumento] [varchar](60) NULL,
	[edad] [int] NULL,
	[estado] [bit] NULL,
	[idEspecialidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medico_vs_consultorio]    Script Date: 7/31/2023 10:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medico_vs_consultorio](
	[idMedico] [int] NULL,
	[idConsultorio] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medico_vs_especialidad]    Script Date: 7/31/2023 10:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medico_vs_especialidad](
	[idMedico] [int] NULL,
	[idEspecialidad] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 7/31/2023 10:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[idPaciente] [int] IDENTITY(1,1) NOT NULL,
	[edad] [int] NULL,
	[sexo] [char](1) NULL,
	[nroDocumento] [varchar](10) NULL,
	[direccion] [varchar](150) NULL,
	[telefono] [varchar](20) NULL,
	[idUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 7/31/2023 10:13:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NULL,
	[apellidos] [varchar](60) NULL,
	[codigocli] [varchar](60) NULL,
	[descrUsuario] [varchar](60) NULL,
	[claveUsuario] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[especialidad] ON 

INSERT [dbo].[especialidad] ([idEspecialidad], [descripcion]) VALUES (1, N'Medicina Familiar')
INSERT [dbo].[especialidad] ([idEspecialidad], [descripcion]) VALUES (2, N'Gastroenterologia')
INSERT [dbo].[especialidad] ([idEspecialidad], [descripcion]) VALUES (3, N'Pediatria')
INSERT [dbo].[especialidad] ([idEspecialidad], [descripcion]) VALUES (4, N'Ortopedia')
INSERT [dbo].[especialidad] ([idEspecialidad], [descripcion]) VALUES (5, N'Ginecologia')
INSERT [dbo].[especialidad] ([idEspecialidad], [descripcion]) VALUES (6, N'Estomatologia')
INSERT [dbo].[especialidad] ([idEspecialidad], [descripcion]) VALUES (7, N'Cardiologia')
INSERT [dbo].[especialidad] ([idEspecialidad], [descripcion]) VALUES (8, N'Dermatologia')
INSERT [dbo].[especialidad] ([idEspecialidad], [descripcion]) VALUES (9, N'Oftalmologia')
INSERT [dbo].[especialidad] ([idEspecialidad], [descripcion]) VALUES (10, N'Urologia')
INSERT [dbo].[especialidad] ([idEspecialidad], [descripcion]) VALUES (11, N'Oncologia')
SET IDENTITY_INSERT [dbo].[especialidad] OFF
GO
SET IDENTITY_INSERT [dbo].[medico] ON 

INSERT [dbo].[medico] ([idMedico], [nombre], [apellidos], [nroDocumento], [edad], [estado], [idEspecialidad]) VALUES (1, N'Pedro', N'Jimenez Mora', N'45987896378', 45, 1, 4)
INSERT [dbo].[medico] ([idMedico], [nombre], [apellidos], [nroDocumento], [edad], [estado], [idEspecialidad]) VALUES (2, N'Maria Carmen', N'Rodriguez', N'71648896314', 36, 1, 5)
INSERT [dbo].[medico] ([idMedico], [nombre], [apellidos], [nroDocumento], [edad], [estado], [idEspecialidad]) VALUES (3, N'Jose', N'Ramirez', N'85164879324', 51, 1, 7)
INSERT [dbo].[medico] ([idMedico], [nombre], [apellidos], [nroDocumento], [edad], [estado], [idEspecialidad]) VALUES (4, N'John', N'Cena', N'71956716524', 53, 1, 4)
INSERT [dbo].[medico] ([idMedico], [nombre], [apellidos], [nroDocumento], [edad], [estado], [idEspecialidad]) VALUES (5, N'Juan', N'Perez', N'78116921952', 81, 1, 1)
SET IDENTITY_INSERT [dbo].[medico] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([idUsuario], [nombre], [apellidos], [codigocli], [descrUsuario], [claveUsuario]) VALUES (1, N'Juan', N'Martinez', N'563897', N'juanma', N'Contrasena1')
INSERT [dbo].[usuario] ([idUsuario], [nombre], [apellidos], [codigocli], [descrUsuario], [claveUsuario]) VALUES (2, N'Pedro', N'Aquiles', N'419085', N'pedroa', N'Contrasena2')
INSERT [dbo].[usuario] ([idUsuario], [nombre], [apellidos], [codigocli], [descrUsuario], [claveUsuario]) VALUES (3, N'Maria', N'Gonzales', N'534960', N'mariaGoGo', N'Contrasena3')
INSERT [dbo].[usuario] ([idUsuario], [nombre], [apellidos], [codigocli], [descrUsuario], [claveUsuario]) VALUES (4, N'Emy', N'Matista', N'784569', N'Car', N'456789')
INSERT [dbo].[usuario] ([idUsuario], [nombre], [apellidos], [codigocli], [descrUsuario], [claveUsuario]) VALUES (5, N'Donald ', N'Trump', N'452859', N'sleepyjoe', N'secretfiles')
INSERT [dbo].[usuario] ([idUsuario], [nombre], [apellidos], [codigocli], [descrUsuario], [claveUsuario]) VALUES (6, N'Roronoa', N'Zoro', N'231759', N'onigiri', N'12345')
INSERT [dbo].[usuario] ([idUsuario], [nombre], [apellidos], [codigocli], [descrUsuario], [claveUsuario]) VALUES (7, N'Francisco', N'Gomez', N'947320', N'FranGo', N'ContrasenaEX')
INSERT [dbo].[usuario] ([idUsuario], [nombre], [apellidos], [codigocli], [descrUsuario], [claveUsuario]) VALUES (10, N'Carmen', N'Mota', N'125407', N'carmenmot', N'contra')
INSERT [dbo].[usuario] ([idUsuario], [nombre], [apellidos], [codigocli], [descrUsuario], [claveUsuario]) VALUES (11, N'Maria', N'Vargas', N'785945', N'mariaVar', N'maria01')
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
ALTER TABLE [dbo].[citas]  WITH CHECK ADD FOREIGN KEY([idMedico])
REFERENCES [dbo].[medico] ([idMedico])
GO
ALTER TABLE [dbo].[citas]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[historial_citas]  WITH CHECK ADD FOREIGN KEY([idCita])
REFERENCES [dbo].[citas] ([idCita])
GO
ALTER TABLE [dbo].[HorarioAtencion]  WITH CHECK ADD FOREIGN KEY([idMedico])
REFERENCES [dbo].[medico] ([idMedico])
GO
ALTER TABLE [dbo].[medico]  WITH CHECK ADD FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[especialidad] ([idEspecialidad])
GO
ALTER TABLE [dbo].[medico_vs_consultorio]  WITH CHECK ADD FOREIGN KEY([idConsultorio])
REFERENCES [dbo].[Consultorio] ([idConsultorio])
GO
ALTER TABLE [dbo].[medico_vs_consultorio]  WITH CHECK ADD FOREIGN KEY([idMedico])
REFERENCES [dbo].[medico] ([idMedico])
GO
ALTER TABLE [dbo].[medico_vs_especialidad]  WITH CHECK ADD FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[especialidad] ([idEspecialidad])
GO
ALTER TABLE [dbo].[medico_vs_especialidad]  WITH CHECK ADD FOREIGN KEY([idMedico])
REFERENCES [dbo].[medico] ([idMedico])
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
/****** Object:  StoredProcedure [dbo].[spListarMedicos]    Script Date: 7/31/2023 10:13:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarMedicos]
AS
BEGIN
     SELECT idMedico, nombre, apellidos
	 FROM medico
END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarCita]    Script Date: 7/31/2023 10:13:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarUsuario]    Script Date: 7/31/2023 10:13:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
USE [master]
GO
ALTER DATABASE [MediApp] SET  READ_WRITE 
GO
