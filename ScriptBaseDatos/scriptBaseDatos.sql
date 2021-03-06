USE [master]
GO
/****** Object:  Database [dbPrueba]    Script Date: 12/06/2022 13:38:46 ******/
CREATE DATABASE [dbPrueba]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbPrueba', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dbPrueba.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbPrueba_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dbPrueba_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbPrueba] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbPrueba].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbPrueba] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbPrueba] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbPrueba] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbPrueba] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbPrueba] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbPrueba] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbPrueba] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbPrueba] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbPrueba] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbPrueba] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbPrueba] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbPrueba] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbPrueba] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbPrueba] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbPrueba] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbPrueba] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbPrueba] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbPrueba] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbPrueba] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbPrueba] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbPrueba] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbPrueba] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbPrueba] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbPrueba] SET  MULTI_USER 
GO
ALTER DATABASE [dbPrueba] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbPrueba] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbPrueba] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbPrueba] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbPrueba] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbPrueba] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbPrueba] SET QUERY_STORE = OFF
GO
USE [dbPrueba]
GO
/****** Object:  Table [dbo].[tblCiudades]    Script Date: 12/06/2022 13:38:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCiudades](
	[IDCiudad] [int] IDENTITY(1,1) NOT NULL,
	[CodigoCiudad] [varchar](5) NOT NULL,
	[NombreCiudad] [varchar](50) NOT NULL,
	[IDDepartamento] [int] NOT NULL,
	[FechaCreacion] [smalldatetime] NOT NULL,
	[UsuarioCreacion] [varchar](50) NOT NULL,
	[FechaUltimaModificacion] [smalldatetime] NULL,
	[UsuarioUltimaModificacion] [varchar](50) NULL,
 CONSTRAINT [PK_tblCiudades] PRIMARY KEY CLUSTERED 
(
	[IDCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblClientes]    Script Date: 12/06/2022 13:38:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClientes](
	[IDCliente] [int] IDENTITY(1,1) NOT NULL,
	[NitCliente] [varchar](25) NOT NULL,
	[PrimerNombre] [varchar](50) NOT NULL,
	[SegundoNombre] [varchar](50) NULL,
	[PrimerApellido] [varchar](50) NOT NULL,
	[SegundoApellido] [varchar](50) NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Direccion] [varchar](1000) NOT NULL,
	[IDCiudad] [int] NOT NULL,
	[Correo] [varchar](250) NOT NULL,
	[FechaCreacion] [smalldatetime] NULL,
	[UsuarioCreacion] [varchar](50) NULL,
	[FechaUltimaModificacion] [smalldatetime] NULL,
	[UsuarioUltimaModificacion] [varchar](50) NULL,
 CONSTRAINT [PK_tblClientes] PRIMARY KEY CLUSTERED 
(
	[IDCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDepartamentos]    Script Date: 12/06/2022 13:38:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDepartamentos](
	[IDDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[CodigoDepartamento] [varchar](5) NOT NULL,
	[NombreDepartamento] [varchar](50) NOT NULL,
	[FechaCreacion] [smalldatetime] NOT NULL,
	[UsuarioCreacion] [varchar](50) NOT NULL,
	[FechaUltimaModificacion] [smalldatetime] NULL,
	[UsuarioUltimaModificacion] [varchar](50) NULL,
 CONSTRAINT [PK_tblDepartamentos] PRIMARY KEY CLUSTERED 
(
	[IDDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCiudades] ON 

INSERT [dbo].[tblCiudades] ([IDCiudad], [CodigoCiudad], [NombreCiudad], [IDDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (1, N'88', N'BELLO', 2, CAST(N'2022-06-12T15:08:00' AS SmallDateTime), N'Admin', CAST(N'2022-06-12T15:08:00' AS SmallDateTime), N'Admin')
INSERT [dbo].[tblCiudades] ([IDCiudad], [CodigoCiudad], [NombreCiudad], [IDDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (2, N'2', N'ABEJORRAL', 1, CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, NULL)
INSERT [dbo].[tblCiudades] ([IDCiudad], [CodigoCiudad], [NombreCiudad], [IDDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (3, N'4', N'ABRIAQUI', 1, CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, NULL)
INSERT [dbo].[tblCiudades] ([IDCiudad], [CodigoCiudad], [NombreCiudad], [IDDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (4, N'21', N'ALEJANDRIA', 1, CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, NULL)
INSERT [dbo].[tblCiudades] ([IDCiudad], [CodigoCiudad], [NombreCiudad], [IDDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (5, N'45', N'APARTADO', 1, CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, NULL)
INSERT [dbo].[tblCiudades] ([IDCiudad], [CodigoCiudad], [NombreCiudad], [IDDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (6, N'51', N'ARBOLETES', 1, CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, NULL)
INSERT [dbo].[tblCiudades] ([IDCiudad], [CodigoCiudad], [NombreCiudad], [IDDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (7, N'55', N'ARGELIA', 1, CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, NULL)
INSERT [dbo].[tblCiudades] ([IDCiudad], [CodigoCiudad], [NombreCiudad], [IDDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (8, N'125', N'CAICEDO', 1, CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, NULL)
INSERT [dbo].[tblCiudades] ([IDCiudad], [CodigoCiudad], [NombreCiudad], [IDDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (9, N'134', N'CAMPAMENTO', 1, CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, NULL)
INSERT [dbo].[tblCiudades] ([IDCiudad], [CodigoCiudad], [NombreCiudad], [IDDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (10, N'138', N'CAÑASGORDAS', 1, CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, NULL)
INSERT [dbo].[tblCiudades] ([IDCiudad], [CodigoCiudad], [NombreCiudad], [IDDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (11, N'142', N'CARACOLI', 1, CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, NULL)
INSERT [dbo].[tblCiudades] ([IDCiudad], [CodigoCiudad], [NombreCiudad], [IDDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (12, N'145', N'CARAMANTA', 1, CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, NULL)
INSERT [dbo].[tblCiudades] ([IDCiudad], [CodigoCiudad], [NombreCiudad], [IDDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (14, N'148', N'EL CARMEN DE VIBORAL', 1, CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, NULL)
INSERT [dbo].[tblCiudades] ([IDCiudad], [CodigoCiudad], [NombreCiudad], [IDDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (15, N'001', N'Medellín', 2, CAST(N'2022-06-09T08:51:00' AS SmallDateTime), N'Admin', NULL, NULL)
INSERT [dbo].[tblCiudades] ([IDCiudad], [CodigoCiudad], [NombreCiudad], [IDDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (16, N'266', N'ENVIGADO', 2, CAST(N'2022-06-09T08:51:00' AS SmallDateTime), N'Admin', NULL, NULL)
INSERT [dbo].[tblCiudades] ([IDCiudad], [CodigoCiudad], [NombreCiudad], [IDDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (17, N'360', N'ITAGUI', 2, CAST(N'2022-06-09T08:51:00' AS SmallDateTime), N'Admin', NULL, NULL)
INSERT [dbo].[tblCiudades] ([IDCiudad], [CodigoCiudad], [NombreCiudad], [IDDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (18, N'631', N'SABANETA', 2, CAST(N'2022-06-09T08:52:00' AS SmallDateTime), N'Admin', NULL, NULL)
INSERT [dbo].[tblCiudades] ([IDCiudad], [CodigoCiudad], [NombreCiudad], [IDDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (19, N'380', N'LA ESTRELLA', 2, CAST(N'2022-06-09T08:52:00' AS SmallDateTime), N'Admin', NULL, NULL)
INSERT [dbo].[tblCiudades] ([IDCiudad], [CodigoCiudad], [NombreCiudad], [IDDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (20, N'129', N'CALDAS', 2, CAST(N'2022-06-09T08:52:00' AS SmallDateTime), N'Admin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblCiudades] OFF
GO
SET IDENTITY_INSERT [dbo].[tblClientes] ON 

INSERT [dbo].[tblClientes] ([IDCliente], [NitCliente], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [Telefono], [Direccion], [IDCiudad], [Correo], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (3, N'431536', N'Roger', N'Armando', N'Meza', N'Valiente', N'3163363957', N'calle 9 A sur #79B-221', 15, N'mezaroger1@gmail.com', CAST(N'2022-06-12T09:46:00' AS SmallDateTime), NULL, CAST(N'2022-06-12T13:35:00' AS SmallDateTime), NULL)
SET IDENTITY_INSERT [dbo].[tblClientes] OFF
GO
SET IDENTITY_INSERT [dbo].[tblDepartamentos] ON 

INSERT [dbo].[tblDepartamentos] ([IDDepartamento], [CodigoDepartamento], [NombreDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (1, N'91', N'AMAZONAS', CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, N'')
INSERT [dbo].[tblDepartamentos] ([IDDepartamento], [CodigoDepartamento], [NombreDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (2, N'05', N'ANTIOQUIA', CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, N'')
INSERT [dbo].[tblDepartamentos] ([IDDepartamento], [CodigoDepartamento], [NombreDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (3, N'81', N'ARAUCA', CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, N'')
INSERT [dbo].[tblDepartamentos] ([IDDepartamento], [CodigoDepartamento], [NombreDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (4, N'8', N'ATLANTICO', CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, N'')
INSERT [dbo].[tblDepartamentos] ([IDDepartamento], [CodigoDepartamento], [NombreDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (5, N'11', N'BOGOTA', CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, N'')
INSERT [dbo].[tblDepartamentos] ([IDDepartamento], [CodigoDepartamento], [NombreDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (6, N'13', N'BOLIVAR', CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, N'')
INSERT [dbo].[tblDepartamentos] ([IDDepartamento], [CodigoDepartamento], [NombreDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (7, N'15', N'BOYACA', CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, N'')
INSERT [dbo].[tblDepartamentos] ([IDDepartamento], [CodigoDepartamento], [NombreDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (8, N'17', N'CALDAS', CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, N'')
INSERT [dbo].[tblDepartamentos] ([IDDepartamento], [CodigoDepartamento], [NombreDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (9, N'18', N'CAQUETA', CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, N'')
INSERT [dbo].[tblDepartamentos] ([IDDepartamento], [CodigoDepartamento], [NombreDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (10, N'85', N'CASANARE', CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, N'')
INSERT [dbo].[tblDepartamentos] ([IDDepartamento], [CodigoDepartamento], [NombreDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (11, N'19', N'CAUCA', CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, N'')
INSERT [dbo].[tblDepartamentos] ([IDDepartamento], [CodigoDepartamento], [NombreDepartamento], [FechaCreacion], [UsuarioCreacion], [FechaUltimaModificacion], [UsuarioUltimaModificacion]) VALUES (12, N'20', N'CESAR', CAST(N'2022-06-07T07:54:00' AS SmallDateTime), N'Admin', NULL, N'')
SET IDENTITY_INSERT [dbo].[tblDepartamentos] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unique_correo]    Script Date: 12/06/2022 13:38:46 ******/
ALTER TABLE [dbo].[tblClientes] ADD  CONSTRAINT [unique_correo] UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unique_nitCliente]    Script Date: 12/06/2022 13:38:46 ******/
ALTER TABLE [dbo].[tblClientes] ADD  CONSTRAINT [unique_nitCliente] UNIQUE NONCLUSTERED 
(
	[NitCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCiudades]  WITH CHECK ADD  CONSTRAINT [FK_tblCiudades_tblDepartamentos] FOREIGN KEY([IDDepartamento])
REFERENCES [dbo].[tblDepartamentos] ([IDDepartamento])
GO
ALTER TABLE [dbo].[tblCiudades] CHECK CONSTRAINT [FK_tblCiudades_tblDepartamentos]
GO
ALTER TABLE [dbo].[tblClientes]  WITH CHECK ADD  CONSTRAINT [FK_tblClientes_tblCiudades] FOREIGN KEY([IDCiudad])
REFERENCES [dbo].[tblCiudades] ([IDCiudad])
GO
ALTER TABLE [dbo].[tblClientes] CHECK CONSTRAINT [FK_tblClientes_tblCiudades]
GO
/****** Object:  StoredProcedure [dbo].[usp_Clientes_Actualizar]    Script Date: 12/06/2022 13:38:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Procedimiento: [dbo].[usp_Cleintes_Actualizar]
-- 
-- Se de crear o editar un registro en la tabla tblClientes 
-- 
--  EXEC [dbo].[usp_Clientes_Actualizar] .... 
-- 
CREATE PROCEDURE [dbo].[usp_Clientes_Actualizar]
(
	@IDCliente int,
	@NitCliente varchar(25),
	@PrimerNombre varchar(50),
	@SegundoNombre varchar(50),
	@PrimerApellido varchar(50),
	@SegundoApellido varchar(50),
	@Telefono varchar(50),
	@Direccion varchar(1000),
	@IDCiudad int,
	@Correo varchar(250),
	@FechaCreacion smalldatetime,
	@Usuario varchar(50)
)
 -- WITH ENCRYPTION 

AS

 SET DATEFORMAT MDY
 SET NOCOUNT ON

--Variables
DECLARE @dtmFecha smalldatetime = GETDATE()
DECLARE @mensajeError VARCHAR(2000)

BEGIN TRY

IF EXISTS ( SELECT TOP 1 IDCliente FROM dbo.tblClientes WHERE ( IDCliente = ISNULL(@IDCliente,-1) ) )
BEGIN

    UPDATE dbo.tblClientes
    SET
		NitCliente = @NitCliente,
		PrimerNombre = @PrimerNombre,
		SegundoNombre = @SegundoNombre,
		PrimerApellido = @PrimerApellido,
		SegundoApellido = @SegundoApellido,
		Telefono = @Telefono,
		Direccion = @Direccion,
		IDCiudad = @IDCiudad,
		Correo = @Correo,
		FechaUltimaModificacion = @dtmFecha,
		UsuarioUltimaModificacion = @Usuario		
    WHERE  ( IDCliente = @IDCliente ) 

END

ELSE

BEGIN

    INSERT INTO dbo.tblClientes(NitCliente, PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, Telefono, Direccion, IDCiudad, Correo, FechaCreacion, UsuarioCreacion, FechaUltimaModificacion,
				UsuarioUltimaModificacion)
	VALUES(@NitCliente, @PrimerNombre, @SegundoNombre, @PrimerApellido, @SegundoApellido, @Telefono, @Direccion, @IDCiudad, @Correo, @FechaCreacion, @Usuario, NULL, NULL)   
   

END

END TRY

BEGIN CATCH

    SET @mensajeError = 'Error al ejecutar el procedimiento almacenado: usp_Clientes_Actualizar, el cual crea/edita registros en la tabla: tblClientes ' + ERROR_MESSAGE()
    RAISERROR(@MensajeError,16,1)

END CATCH

GO
/****** Object:  StoredProcedure [dbo].[usp_Clientes_Consultar]    Script Date: 12/06/2022 13:38:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento: dbo.usp_Clientes_Consultar
-- Selecciona un registros de la tabla tblClientes 
-- 
--  EXEC dbo.usp_Clientes_Consultar 1

CREATE PROCEDURE [dbo].[usp_Clientes_Consultar] 
(
  @IDCliente  int
)

--Para bloquear el procedimiento alamacenado
-- WITH ENCRYPTION
AS

 -- Declaro las variables.
DECLARE @mensajeError VARCHAR(2000)

BEGIN TRY
	select CLIE.IDCliente, CLIE.NitCliente, CLIE.PrimerNombre, CLIE.SegundoNombre, CLIE.PrimerApellido, CLIE.SegundoApellido, CLIE.Telefono, CLIE.Direccion, CLIE.IDCiudad, CIU.NombreCiudad NombreCiudad, 
		D.NombreDepartamento NombreDepartamento, CLIE.Correo, CLIE.FechaCreacion, CLIE.UsuarioCreacion, CLIE.FechaUltimaModificacion
	from dbo.tblClientes CLIE
		inner join tblCiudades CIU ON CLIE.IDCiudad = CIU.IDCiudad
		inner join tblDepartamentos D ON CIU.IDDepartamento = D.IDDepartamento
	where CLIE.IDCliente = @IDCliente



END TRY

BEGIN CATCH

    SET @mensajeError = 'Error al ejecutar el procedimiento almacenado: dbo.usp_Clientes_Consultar, el cual selecciona un registros de la tabla: tblClientes ' + ERROR_MESSAGE()
    RAISERROR(@mensajeError,16,1)

END CATCH
	
GO
/****** Object:  StoredProcedure [dbo].[usp_Clientes_Eliminar]    Script Date: 12/06/2022 13:38:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento: [dbo].[usp_Clientes_Eliminar]  
--Elimina un registro seleccionado de la tabla tblCLientes
-- 
--  EXEC [dbo].[usp_Clientes_Eliminar] 1 
-- 
CREATE PROCEDURE [dbo].[usp_Clientes_Eliminar] 
(
  @IDCliente  int
)
 -- WITH ENCRYPTION 

AS

 SET DATEFORMAT MDY
 SET NOCOUNT ON

DECLARE @mensajeError VARCHAR(2000)

BEGIN TRY

    DELETE FROM dbo.tblClientes
    WHERE  ( IDCliente = @IDCliente ) 

END TRY


BEGIN CATCH

    SET @mensajeError = 'Error al ejecutar el procedimiento almacenado: usp_Clientes_Eliminar, el cual crea/edita registros en la tabla: tblClientes ' + ERROR_MESSAGE()
    RAISERROR(@mensajeError,16,1)

END CATCH
GO
/****** Object:  StoredProcedure [dbo].[usp_Clientes_Obtener]    Script Date: 12/06/2022 13:38:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento: dbo.usp_Clientes_Obtener
-- Selecciona todos los registros de la tabla tblClientes 
-- 
--  EXEC dbo.usp_Clientes_Obtener

CREATE PROCEDURE [dbo].[usp_Clientes_Obtener] 

--Para bloquear el procedimiento alamacenado
-- WITH ENCRYPTION
AS

 SET DATEFORMAT MDY
 SET NOCOUNT ON

 -- Declaro las variables.
DECLARE @mensajeError VARCHAR(2000)

BEGIN TRY
	select CLIE.IDCliente, CLIE.NitCliente, CLIE.PrimerNombre, CLIE.SegundoNombre, CLIE.PrimerApellido, CLIE.SegundoApellido, CLIE.Telefono, CLIE.Direccion, CLIE.IDCiudad, CIU.NombreCiudad, 
	D.NombreDepartamento, CLIE.Correo, CLIE.FechaCreacion, CLIE.UsuarioCreacion, CLIE.FechaUltimaModificacion, CLIE.UsuarioUltimaModificacion
	from dbo.tblClientes CLIE
	inner join tblCiudades CIU ON CLIE.IDCiudad = CIU.IDCiudad
	inner join tblDepartamentos D ON CIU.IDDepartamento = D.IDDepartamento


END TRY

BEGIN CATCH

    SET @mensajeError = 'Error al ejecutar el procedimiento almacenado: usp_Clientes_Obtener, el cual selecciona todo los registros de la tabla: ' + ERROR_MESSAGE()
    RAISERROR(@mensajeError,16,1)

END CATCH
	
GO
USE [master]
GO
ALTER DATABASE [dbPrueba] SET  READ_WRITE 
GO
