USE [master]
GO
/****** Object:  Database [MediApp]    Script Date: 8/21/2023 1:40:17 PM ******/
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
/****** Object:  Table [dbo].[citas]    Script Date: 8/21/2023 1:40:18 PM ******/
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
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consultorio]    Script Date: 8/21/2023 1:40:18 PM ******/
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
/****** Object:  Table [dbo].[especialidad]    Script Date: 8/21/2023 1:40:18 PM ******/
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
/****** Object:  Table [dbo].[historial_citas]    Script Date: 8/21/2023 1:40:18 PM ******/
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
/****** Object:  Table [dbo].[HorarioAtencion]    Script Date: 8/21/2023 1:40:18 PM ******/
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
/****** Object:  Table [dbo].[medico]    Script Date: 8/21/2023 1:40:18 PM ******/
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
/****** Object:  Table [dbo].[medico_vs_consultorio]    Script Date: 8/21/2023 1:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medico_vs_consultorio](
	[idMedico] [int] NULL,
	[idConsultorio] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medico_vs_especialidad]    Script Date: 8/21/2023 1:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medico_vs_especialidad](
	[idMedico] [int] NULL,
	[idEspecialidad] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[medico_vs_usuario]    Script Date: 8/21/2023 1:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medico_vs_usuario](
	[idMedico] [int] NULL,
	[idUsuario] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 8/21/2023 1:40:18 PM ******/
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
/****** Object:  Table [dbo].[tipo_usuario]    Script Date: 8/21/2023 1:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_usuario](
	[idTipoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 8/21/2023 1:40:18 PM ******/
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
	[idTipoUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[citas] ON 

INSERT [dbo].[citas] ([idCita], [telefono], [fecha], [hora], [motivo], [idMedico], [idUsuario], [estado]) VALUES (11, N'8091457328', CAST(N'2023-08-18T00:00:00.000' AS DateTime), N'10:30:', N'Me duele el pie', 4, 1, 0)
INSERT [dbo].[citas] ([idCita], [telefono], [fecha], [hora], [motivo], [idMedico], [idUsuario], [estado]) VALUES (12, N'8096453751', CAST(N'2023-08-21T00:00:00.000' AS DateTime), N'09:20:', N'Dolores en el pecho', 3, 1, 0)
INSERT [dbo].[citas] ([idCita], [telefono], [fecha], [hora], [motivo], [idMedico], [idUsuario], [estado]) VALUES (31, N'8094721000', CAST(N'2023-08-23T00:00:00.000' AS DateTime), N'10:30', N'Chequeo de molestia pero mas temprano', 5, 1, 0)
INSERT [dbo].[citas] ([idCita], [telefono], [fecha], [hora], [motivo], [idMedico], [idUsuario], [estado]) VALUES (32, N'8296541237', CAST(N'2023-08-26T00:00:00.000' AS DateTime), N'00:00', N'Por que me da la gana', 2, 1, 0)
INSERT [dbo].[citas] ([idCita], [telefono], [fecha], [hora], [motivo], [idMedico], [idUsuario], [estado]) VALUES (33, N'8296453125', CAST(N'2023-08-25T00:00:00.000' AS DateTime), N'10:30', N'Meh', 2, 1, 0)
INSERT [dbo].[citas] ([idCita], [telefono], [fecha], [hora], [motivo], [idMedico], [idUsuario], [estado]) VALUES (34, N'8096845234', CAST(N'2023-08-21T00:00:00.000' AS DateTime), N'09:30', N'Pos hora', 2, 1, 0)
INSERT [dbo].[citas] ([idCita], [telefono], [fecha], [hora], [motivo], [idMedico], [idUsuario], [estado]) VALUES (35, N'8096321548', CAST(N'2023-08-30T00:00:00.000' AS DateTime), N'14:00', N'Revision rutinal nueva hora', 3, 1, 0)
INSERT [dbo].[citas] ([idCita], [telefono], [fecha], [hora], [motivo], [idMedico], [idUsuario], [estado]) VALUES (36, N'8091367854', CAST(N'2023-08-28T00:00:00.000' AS DateTime), N'10:00:', N'Cyberpolice bruh', 5, 1, 1)
INSERT [dbo].[citas] ([idCita], [telefono], [fecha], [hora], [motivo], [idMedico], [idUsuario], [estado]) VALUES (37, N'8096342153', CAST(N'2023-09-01T00:00:00.000' AS DateTime), N'10:30:', N'solo estoy probando', 4, 1, 1)
INSERT [dbo].[citas] ([idCita], [telefono], [fecha], [hora], [motivo], [idMedico], [idUsuario], [estado]) VALUES (38, N'8094127534', CAST(N'2023-08-29T00:00:00.000' AS DateTime), N'15:00:', N'Dolor en el pie modificado', 1, 1, 0)
SET IDENTITY_INSERT [dbo].[citas] OFF
GO
SET IDENTITY_INSERT [dbo].[Consultorio] ON 

INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (1, N'101')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (2, N'102')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (3, N'103')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (4, N'104')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (5, N'105')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (6, N'106')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (7, N'107')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (8, N'108')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (9, N'109')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (10, N'110')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (11, N'201')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (12, N'202')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (13, N'203')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (14, N'204')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (15, N'205')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (16, N'206')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (17, N'207')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (18, N'208')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (19, N'209')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (20, N'210')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (21, N'301')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (22, N'302')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (23, N'303')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (24, N'304')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (25, N'305')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (26, N'306')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (27, N'307')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (28, N'308')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (29, N'309')
INSERT [dbo].[Consultorio] ([idConsultorio], [descripcion]) VALUES (30, N'310')
SET IDENTITY_INSERT [dbo].[Consultorio] OFF
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
SET IDENTITY_INSERT [dbo].[historial_citas] ON 

INSERT [dbo].[historial_citas] ([idHistorial], [idCita]) VALUES (10, 11)
INSERT [dbo].[historial_citas] ([idHistorial], [idCita]) VALUES (11, 12)
SET IDENTITY_INSERT [dbo].[historial_citas] OFF
GO
SET IDENTITY_INSERT [dbo].[medico] ON 

INSERT [dbo].[medico] ([idMedico], [nombre], [apellidos], [nroDocumento], [edad], [estado], [idEspecialidad]) VALUES (1, N'Pedro', N'Jimenez Mora', N'45987896378', 45, 1, 4)
INSERT [dbo].[medico] ([idMedico], [nombre], [apellidos], [nroDocumento], [edad], [estado], [idEspecialidad]) VALUES (2, N'Maria Carmen', N'Rodriguez', N'71648896314', 36, 1, 5)
INSERT [dbo].[medico] ([idMedico], [nombre], [apellidos], [nroDocumento], [edad], [estado], [idEspecialidad]) VALUES (3, N'Jose', N'Ramirez', N'85164879324', 51, 1, 7)
INSERT [dbo].[medico] ([idMedico], [nombre], [apellidos], [nroDocumento], [edad], [estado], [idEspecialidad]) VALUES (4, N'John', N'Cena', N'71956716524', 53, 1, 4)
INSERT [dbo].[medico] ([idMedico], [nombre], [apellidos], [nroDocumento], [edad], [estado], [idEspecialidad]) VALUES (5, N'Juan', N'Perez', N'78116921952', 81, 1, 1)
SET IDENTITY_INSERT [dbo].[medico] OFF
GO
INSERT [dbo].[medico_vs_consultorio] ([idMedico], [idConsultorio]) VALUES (1, 13)
INSERT [dbo].[medico_vs_consultorio] ([idMedico], [idConsultorio]) VALUES (2, 4)
INSERT [dbo].[medico_vs_consultorio] ([idMedico], [idConsultorio]) VALUES (3, 8)
INSERT [dbo].[medico_vs_consultorio] ([idMedico], [idConsultorio]) VALUES (4, 10)
INSERT [dbo].[medico_vs_consultorio] ([idMedico], [idConsultorio]) VALUES (5, 15)
GO
SET IDENTITY_INSERT [dbo].[tipo_usuario] ON 

INSERT [dbo].[tipo_usuario] ([idTipoUsuario], [descripcion]) VALUES (1, N'Paciente')
INSERT [dbo].[tipo_usuario] ([idTipoUsuario], [descripcion]) VALUES (2, N'Medico')
SET IDENTITY_INSERT [dbo].[tipo_usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([idUsuario], [nombre], [apellidos], [codigocli], [descrUsuario], [claveUsuario], [idTipoUsuario]) VALUES (1, N'Juan', N'Martinez', N'563897', N'juanma', N'Contrasena1', 1)
INSERT [dbo].[usuario] ([idUsuario], [nombre], [apellidos], [codigocli], [descrUsuario], [claveUsuario], [idTipoUsuario]) VALUES (2, N'Pedro', N'Aquiles', N'419085', N'pedroa', N'Contrasena2', 1)
INSERT [dbo].[usuario] ([idUsuario], [nombre], [apellidos], [codigocli], [descrUsuario], [claveUsuario], [idTipoUsuario]) VALUES (3, N'Maria', N'Gonzales', N'534960', N'mariaGoGo', N'Contrasena3', 1)
INSERT [dbo].[usuario] ([idUsuario], [nombre], [apellidos], [codigocli], [descrUsuario], [claveUsuario], [idTipoUsuario]) VALUES (4, N'Emy', N'Matista', N'784569', N'Car', N'456789', 1)
INSERT [dbo].[usuario] ([idUsuario], [nombre], [apellidos], [codigocli], [descrUsuario], [claveUsuario], [idTipoUsuario]) VALUES (5, N'Donald ', N'Trump', N'452859', N'sleepyjoe', N'secretfiles', 1)
INSERT [dbo].[usuario] ([idUsuario], [nombre], [apellidos], [codigocli], [descrUsuario], [claveUsuario], [idTipoUsuario]) VALUES (6, N'Roronoa', N'Zoro', N'231759', N'onigiri', N'12345', 1)
INSERT [dbo].[usuario] ([idUsuario], [nombre], [apellidos], [codigocli], [descrUsuario], [claveUsuario], [idTipoUsuario]) VALUES (7, N'Francisco', N'Gomez', N'947320', N'FranGo', N'ContrasenaEX', 1)
INSERT [dbo].[usuario] ([idUsuario], [nombre], [apellidos], [codigocli], [descrUsuario], [claveUsuario], [idTipoUsuario]) VALUES (10, N'Carmen', N'Mota', N'125407', N'carmenmot', N'contra', 1)
INSERT [dbo].[usuario] ([idUsuario], [nombre], [apellidos], [codigocli], [descrUsuario], [claveUsuario], [idTipoUsuario]) VALUES (11, N'Maria', N'Vargas', N'785945', N'mariaVar', N'maria01', 1)
INSERT [dbo].[usuario] ([idUsuario], [nombre], [apellidos], [codigocli], [descrUsuario], [claveUsuario], [idTipoUsuario]) VALUES (12, N'John ', N'Cena', N'q23hrui', N'johnSee', N'123456', 2)
INSERT [dbo].[usuario] ([idUsuario], [nombre], [apellidos], [codigocli], [descrUsuario], [claveUsuario], [idTipoUsuario]) VALUES (13, N'Elber', N'Galarga', N'qstr32', N'elgar', N'nomameswey', 1)
INSERT [dbo].[usuario] ([idUsuario], [nombre], [apellidos], [codigocli], [descrUsuario], [claveUsuario], [idTipoUsuario]) VALUES (14, N'Jose', N'Cabrera', N'dferufb', N'joseCa', N'12345678', 1)
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
ALTER TABLE [dbo].[medico_vs_usuario]  WITH CHECK ADD FOREIGN KEY([idMedico])
REFERENCES [dbo].[medico] ([idMedico])
GO
ALTER TABLE [dbo].[medico_vs_usuario]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [idTipoUsuario] FOREIGN KEY([idTipoUsuario])
REFERENCES [dbo].[tipo_usuario] ([idTipoUsuario])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [idTipoUsuario]
GO
/****** Object:  StoredProcedure [dbo].[spActualizarCita]    Script Date: 8/21/2023 1:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  StoredProcedure [dbo].[spCitasPendientes]    Script Date: 8/21/2023 1:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  StoredProcedure [dbo].[spEliminarCita]    Script Date: 8/21/2023 1:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarCita]
(
   @prmIdCita INT
)
AS
   BEGIN
        UPDATE citas SET estado = 0
		WHERE idCita = @prmIdCita
   END
GO
/****** Object:  StoredProcedure [dbo].[spHistorial]    Script Date: 8/21/2023 1:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  StoredProcedure [dbo].[spInfoMedicos]    Script Date: 8/21/2023 1:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInfoMedicos]
(
   @prmIdEspecialidad INT
)
AS
BEGIN
     SELECT M.nombre AS nombre, M.apellidos AS apellidos, E.descripcion AS especialidad, C.descripcion AS consultorio
     FROM medico_vs_consultorio MC
     INNER JOIN medico M ON (MC.idMedico = M.idMedico)
     INNER JOIN especialidad E ON (M.idEspecialidad = E.idEspecialidad)
     INNER JOIN Consultorio C ON (MC.idConsultorio = C.idConsultorio)
     WHERE M.idEspecialidad = @prmIdEspecialidad

END
GO
/****** Object:  StoredProcedure [dbo].[spInfoMedicosTodos]    Script Date: 8/21/2023 1:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInfoMedicosTodos]
AS
BEGIN
     SELECT M.nombre AS nombre, M.apellidos AS apellidos, E.descripcion AS especialidad, C.descripcion AS consultorio
     FROM medico_vs_consultorio MC
     INNER JOIN medico M ON (MC.idMedico = M.idMedico)
     INNER JOIN especialidad E ON (M.idEspecialidad = E.idEspecialidad)
     INNER JOIN Consultorio C ON (MC.idConsultorio = C.idConsultorio)
END
GO
/****** Object:  StoredProcedure [dbo].[spListarEspecialidades]    Script Date: 8/21/2023 1:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarEspecialidades]
AS
BEGIN
     SELECT idEspecialidad, descripcion
	 FROM especialidad
END
GO
/****** Object:  StoredProcedure [dbo].[spListarMedicosDef]    Script Date: 8/21/2023 1:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  StoredProcedure [dbo].[spListarTipoUsuario]    Script Date: 8/21/2023 1:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarTipoUsuario]
AS
BEGIN
     SELECT idTipoUsuario, descripcion
	 FROM tipo_usuario
END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarCita]    Script Date: 8/21/2023 1:40:18 PM ******/
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
       INSERT INTO citas(telefono, fecha, hora, motivo, idMedico, idUsuario, estado)
	   VALUES(@prmTelefono, @prmFecha, @prmHora, @prmMotivo, @prmIdMedico, @prmIdUsuario, 1);
   END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarUsuario]    Script Date: 8/21/2023 1:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarUsuario]
(
   @prmNombre VARCHAR(60),
   @prmApellidos VARCHAR(60),
   @prmidTipoUsuario INT,
   @prmCodigoCli VARCHAR(60),
   @prmDescrUsuario VARCHAR(60),
   @prmClaveUsuario VARCHAR(60)
)
AS
   BEGIN
       INSERT INTO usuario(nombre, apellidos, codigocli, descrUsuario, claveUsuario, idTipoUsuario)
	   VALUES(@prmNombre, @prmApellidos, @prmCodigoCli, @prmDescrUsuario, @prmClaveUsuario, @prmidTipoUsuario);
   END
GO
/****** Object:  StoredProcedure [dbo].[spTipoUsuario]    Script Date: 8/21/2023 1:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Trigger [dbo].[trInsertarHistorial]    Script Date: 8/21/2023 1:40:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trInsertarHistorial]
ON [dbo].[historial_citas]
AFTER INSERT
AS
BEGIN
    -- Delete the corresponding cita from citas table
    UPDATE citas SET estado = 0
	WHERE idCita = (SELECT idCita FROM inserted);
END;
GO
ALTER TABLE [dbo].[historial_citas] ENABLE TRIGGER [trInsertarHistorial]
GO
USE [master]
GO
ALTER DATABASE [MediApp] SET  READ_WRITE 
GO
