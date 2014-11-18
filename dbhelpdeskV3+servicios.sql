USE [master]
GO
/****** Object:  Database [dbhelpdesk]    Script Date: 11/16/2014 22:29:59 ******/
CREATE DATABASE [dbhelpdesk] ON  PRIMARY 
( NAME = N'dbhelpdesk', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLSERVER\MSSQL\DATA\dbhelpdesk.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbhelpdesk_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLSERVER\MSSQL\DATA\dbhelpdesk_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbhelpdesk] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbhelpdesk].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbhelpdesk] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [dbhelpdesk] SET ANSI_NULLS OFF
GO
ALTER DATABASE [dbhelpdesk] SET ANSI_PADDING OFF
GO
ALTER DATABASE [dbhelpdesk] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [dbhelpdesk] SET ARITHABORT OFF
GO
ALTER DATABASE [dbhelpdesk] SET AUTO_CLOSE ON
GO
ALTER DATABASE [dbhelpdesk] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [dbhelpdesk] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [dbhelpdesk] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [dbhelpdesk] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [dbhelpdesk] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [dbhelpdesk] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [dbhelpdesk] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [dbhelpdesk] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [dbhelpdesk] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [dbhelpdesk] SET  ENABLE_BROKER
GO
ALTER DATABASE [dbhelpdesk] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [dbhelpdesk] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [dbhelpdesk] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [dbhelpdesk] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [dbhelpdesk] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [dbhelpdesk] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [dbhelpdesk] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [dbhelpdesk] SET  READ_WRITE
GO
ALTER DATABASE [dbhelpdesk] SET RECOVERY SIMPLE
GO
ALTER DATABASE [dbhelpdesk] SET  MULTI_USER
GO
ALTER DATABASE [dbhelpdesk] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [dbhelpdesk] SET DB_CHAINING OFF
GO
USE [dbhelpdesk]
GO
/****** Object:  Table [dbo].[tblcoordinacion]    Script Date: 11/16/2014 22:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblcoordinacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NULL,
 CONSTRAINT [PK_tblcoordinacion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nomCoordinacion] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblcalidadservicio]    Script Date: 11/16/2014 22:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblcalidadservicio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[observaciones] [varchar](250) NULL,
	[estatus] [bit] NOT NULL,
	[promedio] [float] NOT NULL,
	[fk_idservicio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblarea]    Script Date: 11/16/2014 22:30:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblarea](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nomArea] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[promedioCalidadPorUsuarioIn]    Script Date: 11/16/2014 22:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[promedioCalidadPorUsuarioIn]

@fechaInicio DateTime,
@fechaFinal DateTime

AS
BEGIN
SELECT
dbo.VistaIncidentes.soporte,
Avg(dbo.VistaIncidentes.promedioCalidad) AS Promedio

FROM
dbo.VistaIncidentes

WHERE 
dbo.VistaIncidentes.status = 2 AND
dbo.VistaIncidentes.statusCal_Servicio = 1 AND
dbo.VistaIncidentes.fecha_Sol >= @fechaInicio AND
dbo.VistaIncidentes.fecha_Sol <= @fechaFinal

GROUP BY
dbo.VistaIncidentes.soporte

ORDER BY Promedio DESC

END
GO
/****** Object:  StoredProcedure [dbo].[promedioCalidadPorUsuarioEv]    Script Date: 11/16/2014 22:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[promedioCalidadPorUsuarioEv]

@fechaInicio DateTime,
@fechaFinal DateTime

AS
BEGIN
SELECT
dbo.VistaEventos.responsable,
Avg(dbo.VistaEventos.promedioCalidad) AS Promedio

FROM
dbo.VistaEventos

WHERE 
dbo.VistaEventos.status = 2 AND
dbo.VistaEventos.statusCal_Servicio = 1 AND
dbo.VistaEventos.fecha_Sol >= @fechaInicio AND
dbo.VistaEventos.fecha_Sol <= @fechaFinal

GROUP BY
dbo.VistaEventos.responsable

ORDER BY Promedio

END
GO
/****** Object:  StoredProcedure [dbo].[promedioCalidadPorTipoIn]    Script Date: 11/16/2014 22:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[promedioCalidadPorTipoIn]

@fechaInicio DateTime,
@fechaFinal DateTime

AS
BEGIN
SELECT
dbo.VistaIncidentes.tipo AS Tipo,
Avg(dbo.VistaIncidentes.promedioCalidad) AS Promedio

FROM
dbo.VistaIncidentes

WHERE 
dbo.VistaIncidentes.status = 2 AND
dbo.VistaIncidentes.statusCal_Servicio = 1 AND
dbo.VistaIncidentes.fecha_Sol >= @fechaInicio AND
dbo.VistaIncidentes.fecha_Sol <= @fechaFinal

GROUP BY
dbo.VistaIncidentes.tipo

ORDER BY Promedio DESC

END
GO
/****** Object:  StoredProcedure [dbo].[promedioCalidadPorMesIn]    Script Date: 11/16/2014 22:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[promedioCalidadPorMesIn]

@fechaInicio DateTime,
@fechaFinal DateTime

AS
BEGIN
SELECT
((DATENAME(month, dbo.VistaIncidentes.fecha_Cierre))+ '/' + (DATENAME(year, dbo.VistaIncidentes.fecha_Cierre))) AS Mes,
Avg(dbo.VistaIncidentes.promedioCalidad) AS Promedio

FROM
dbo.VistaIncidentes

WHERE 
dbo.VistaIncidentes.status = 2 AND
dbo.VistaIncidentes.statusCal_Servicio = 1 AND
dbo.VistaIncidentes.fecha_Sol >= @fechaInicio AND
dbo.VistaIncidentes.fecha_Sol <= @fechaFinal

GROUP BY
((DATENAME(month, dbo.VistaIncidentes.fecha_Cierre))+ '/' + (DATENAME(year, dbo.VistaIncidentes.fecha_Cierre)))

END
GO
/****** Object:  StoredProcedure [dbo].[promedioCalidadPorMesEv]    Script Date: 11/16/2014 22:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[promedioCalidadPorMesEv]

@fechaInicio DateTime,
@fechaFinal DateTime

AS
BEGIN
SELECT
((DATENAME(month, dbo.VistaEventos.fecha_cierre))+ '/' + (DATENAME(year, dbo.VistaEventos.fecha_cierre))) AS Mes,
Avg(dbo.VistaEventos.promedioCalidad) AS Promedio

FROM
dbo.VistaEventos

WHERE 
dbo.VistaEventos.status = 2 AND
dbo.VistaEventos.statusCal_Servicio = 1 AND
dbo.VistaEventos.fecha_Sol >= @fechaInicio AND
dbo.VistaEventos.fecha_Sol <= @fechaFinal

GROUP BY
((DATENAME(month, dbo.VistaEventos.fecha_cierre))+ '/' + (DATENAME(year, dbo.VistaEventos.fecha_cierre)))

END
GO
/****** Object:  StoredProcedure [dbo].[promedioCalidadPorDepto]    Script Date: 11/16/2014 22:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[promedioCalidadPorDepto]

@fechaInicio DateTime,
@fechaFinal DateTime

AS
BEGIN
SELECT

dbo.ViewUsuarios.nomDepto AS Departamento,
CAST (AVG(dbo.VistaIncidentes.promedioCalidad) AS FLOAT(2)) AS Promedio

FROM
dbo.ViewUsuarios
INNER JOIN dbo.VistaIncidentes ON dbo.ViewUsuarios.idUsuario = dbo.VistaIncidentes.idSolicitante
WHERE
dbo.VistaIncidentes.status = 2 AND
dbo.VistaIncidentes.statusCal_Servicio = 1 AND
dbo.VistaIncidentes.fecha_Sol >= @fechaInicio AND
dbo.VistaIncidentes.fecha_Sol <= @fechaFinal
GROUP BY
dbo.ViewUsuarios.nomDepto

ORDER BY Promedio DESC

END
GO
/****** Object:  Table [dbo].[tblrecurso]    Script Date: 11/16/2014 22:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblrecurso](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NULL,
	[cuantificable] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nombreRequerimiento] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblpuesto]    Script Date: 11/16/2014 22:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblpuesto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nombrePuesto] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblpregunta]    Script Date: 11/16/2014 22:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblpregunta](
	[id] [int] NOT NULL,
	[pregunta] [varchar](70) NOT NULL,
	[estatus] [bit] NOT NULL,
	[afinidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblmarca]    Script Date: 11/16/2014 22:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblmarca](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nombreMarca] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbllugar]    Script Date: 11/16/2014 22:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbllugar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nomLugar] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblinstitucion]    Script Date: 11/16/2014 22:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblinstitucion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NULL,
	[correo] [varchar](20) NULL,
	[estatus] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nombreInstitucion] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbltipoincidencia]    Script Date: 11/16/2014 22:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbltipoincidencia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nombreTipoIncidente] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbltipoequipo]    Script Date: 11/16/2014 22:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbltipoequipo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](40) NULL,
	[monitor] [bit] NOT NULL,
	[equipo] [bit] NOT NULL,
	[disco_duro] [bit] NOT NULL,
	[mouse] [bit] NOT NULL,
	[teclado] [bit] NOT NULL,
	[red] [bit] NOT NULL,
	[ram] [bit] NOT NULL,
	[procesador] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nombreTipoEquipo] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[numIncidentesPorDepto]    Script Date: 11/16/2014 22:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[numIncidentesPorDepto]

@fechaInicio DateTime,
@fechaFinal DateTime

AS
BEGIN
SELECT

dbo.ViewUsuarios.nomDepto AS Departamento,
Count(dbo.VistaIncidentes.numIncidente) AS Cantidad

FROM
dbo.ViewUsuarios
INNER JOIN dbo.VistaIncidentes ON dbo.ViewUsuarios.idUsuario = dbo.VistaIncidentes.idSolicitante
WHERE
dbo.VistaIncidentes.status = 2 AND
dbo.VistaIncidentes.fecha_Sol >= @fechaInicio AND
dbo.VistaIncidentes.fecha_Sol <= @fechaFinal
GROUP BY
dbo.ViewUsuarios.nomDepto

ORDER BY Cantidad DESC

END
GO
/****** Object:  StoredProcedure [dbo].[numEventosPorUsuario]    Script Date: 11/16/2014 22:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[numEventosPorUsuario]

@fechaInicio DateTime,
@fechaFinal DateTime

AS
BEGIN
SELECT
dbo.VistaEventos.responsable AS Soporte,
Count(dbo.VistaEventos.idEvento) AS Cantidad
FROM
dbo.VistaEventos
WHERE
dbo.VistaEventos.status = 2 AND
dbo.VistaEventos.fecha_Sol >= @fechaInicio AND
dbo.VistaEventos.fecha_Sol <= @fechaFinal

GROUP BY dbo.VistaEventos.responsable

ORDER BY Cantidad DESC

END
GO
/****** Object:  Table [dbo].[tbldepartamento]    Script Date: 11/16/2014 22:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbldepartamento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NULL,
	[fk_idcoordinacion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nomDepto] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblrespuesta]    Script Date: 11/16/2014 22:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblrespuesta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[valor] [int] NOT NULL,
	[fk_idpregunta] [int] NOT NULL,
	[fk_idcalidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vt_preguntas]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_preguntas] AS 
SELECT
ROW_NUMBER() OVER( ORDER BY dbo.tblpregunta.id) AS numero,
dbo.tblpregunta.id,
dbo.tblpregunta.pregunta,
dbo.tblpregunta.estatus,
dbo.tblpregunta.afinidad

FROM
dbo.tblpregunta
GO
/****** Object:  Table [dbo].[tblusuario]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblusuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[nombre_usuario] [varchar](40) NULL,
	[password] [varchar](25) NOT NULL,
	[tipo] [int] NOT NULL,
	[fk_iddepto] [int] NOT NULL,
	[extension_telefonica] [varchar](5) NULL,
	[fk_idarea] [int] NOT NULL,
	[fk_idpuesto] [int] NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[fk_idinstitucion] [int] NOT NULL,
	[apellidos] [varchar](60) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nomUsuario] UNIQUE NONCLUSTERED 
(
	[nombre_usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vt_encuestas]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_encuestas] AS 
SELECT
dbo.vt_preguntas.numero,
dbo.vt_preguntas.id,
dbo.vt_preguntas.pregunta,
dbo.vt_preguntas.estatus as estatus_pregunta,
dbo.vt_preguntas.afinidad,
dbo.tblrespuesta.valor,
dbo.tblcalidadservicio.id as idcalidad,
dbo.tblcalidadservicio.observaciones,
dbo.tblcalidadservicio.estatus as estatus_calidad,
dbo.tblcalidadservicio.fk_idservicio as idservicio

FROM
dbo.vt_preguntas
INNER JOIN dbo.tblrespuesta ON dbo.vt_preguntas.id = dbo.tblrespuesta.fk_idpregunta
INNER JOIN dbo.tblcalidadservicio ON dbo.tblrespuesta.fk_idcalidad = dbo.tblcalidadservicio.id
GO
/****** Object:  View [dbo].[vt_departamentos]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_departamentos] AS 
SELECT
dbo.tbldepartamento.id,
dbo.tbldepartamento.nombre,
dbo.tblcoordinacion.nombre as nom_coordinacion

FROM
dbo.tbldepartamento,dbo.tblcoordinacion
WHERE
dbo.tbldepartamento.fk_idcoordinacion = dbo.tblcoordinacion.id
GO
/****** Object:  Table [dbo].[tblservicio]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblservicio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](250) NOT NULL,
	[fk_idusuario_solicitante] [int] NOT NULL,
	[fk_idusuario_soporte] [int] NOT NULL,
	[fk_idusuario_apoyo] [int] NOT NULL,
	[fecha_solicitud] [datetime] NOT NULL,
	[fecha_cierre] [datetime] NULL,
	[hora_inicial] [datetime] NULL,
	[hora_final] [datetime] NULL,
	[estatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblequipoasignado]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblequipoasignado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fk_idusuario_responsable] [int] NOT NULL,
	[fk_tipoequipo] [int] NOT NULL,
	[fk_idmarca_equipo] [int] NOT NULL,
	[serie_equipo] [varchar](25) NOT NULL,
	[ram] [varchar](8) NULL,
	[disco_duro] [varchar](8) NULL,
	[fk_idmarca_monitor] [int] NOT NULL,
	[serie_monitor] [varchar](25) NOT NULL,
	[ip] [varchar](15) NOT NULL,
	[mac] [varchar](17) NOT NULL,
	[fk_idmarca_mouse] [int] NOT NULL,
	[serie_mouse] [varchar](25) NOT NULL,
	[fk_idmarca_teclado] [int] NOT NULL,
	[serie_teclado] [varchar](25) NOT NULL,
	[procesador] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vt_usuarios]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_usuarios] AS 
SELECT
dbo.tblusuario.id,
dbo.tblusuario.nombre_usuario,
(dbo.tblusuario.nombre + ' ' + dbo.tblusuario.apellidos) as nom_completo,
dbo.tblusuario.password,
tipo_usuario_string = CASE dbo.tblusuario.tipo
WHEN 0 THEN 'Soporte'
WHEN 1 THEN 'Solicitante'
ELSE 'S/N'
END,
dbo.tblusuario.extension_telefonica,
dbo.tbldepartamento.nombre as nom_depto,
dbo.tblcoordinacion.nombre as nom_coordinacion,
dbo.tblarea.nombre as nom_area,
dbo.tblpuesto.nombre as nom_puesto,
dbo.tblusuario.tipo,
dbo.tblusuario.correo,
dbo.tblinstitucion.nombre as nom_institucion

FROM
dbo.tblusuario
INNER JOIN dbo.tbldepartamento ON dbo.tbldepartamento.id = dbo.tblusuario.fk_iddepto
INNER JOIN dbo.tblcoordinacion ON dbo.tblcoordinacion.id = dbo.tbldepartamento.fk_idcoordinacion
INNER JOIN dbo.tblarea ON dbo.tblusuario.fk_idarea = dbo.tblarea.id
INNER JOIN dbo.tblpuesto ON dbo.tblpuesto.id = dbo.tblusuario.fk_idpuesto
INNER JOIN dbo.tblinstitucion ON dbo.tblusuario.fk_idinstitucion = dbo.tblinstitucion.id
WHERE
dbo.tbldepartamento.fk_idcoordinacion = dbo.tblcoordinacion.id AND
dbo.tblusuario.fk_iddepto = dbo.tbldepartamento.id
GO
/****** Object:  View [dbo].[vt_servicios]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_servicios] AS 
SELECT
dbo.tblservicio.fk_idusuario_solicitante AS idsolicitante,
dbo.tblservicio.descripcion,
dbo.tblservicio.fecha_solicitud,
dbo.tblservicio.fecha_cierre,
dbo.tblservicio.hora_inicial,
dbo.tblservicio.hora_final,
dbo.tblservicio.estatus,
dbo.tblservicio.id,
us_solicitante.nombre + ' ' + us_solicitante.apellidos AS solicitante,
us_soporte.nombre_usuario AS soporte,
us_apoyo.nombre_usuario AS apoyo



FROM
dbo.tblservicio
INNER JOIN dbo.tblusuario AS us_solicitante ON us_solicitante.id = dbo.tblservicio.fk_idusuario_solicitante
INNER JOIN dbo.tblusuario AS us_soporte ON us_soporte.id = dbo.tblservicio.fk_idusuario_soporte
INNER JOIN dbo.tblusuario AS us_apoyo ON us_apoyo.id = dbo.tblservicio.fk_idusuario_apoyo
GO
/****** Object:  View [dbo].[vt_reporte_equipos]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_reporte_equipos] AS 
SELECT
dbo.tblequipoasignado.id,
dbo.tbltipoequipo.nombre as nom_tipo_equipo,
MarcaEquipo.nombre AS nom_marca_equipo,
dbo.tblequipoasignado.serie_equipo,
dbo.tblequipoasignado.ram as memoria_ram,
dbo.tblequipoasignado.disco_duro,
MarcaMonitor.nombre AS nom_marca_monitor,
dbo.tblequipoasignado.serie_monitor,
dbo.tblequipoasignado.ip,
dbo.tblequipoasignado.mac,
MarcaMouse.nombre AS nom_marca_mouse,
dbo.tblequipoasignado.serie_mouse,
MarcaTeclado.nombre AS nom_marca_teclado,
dbo.tblequipoasignado.serie_teclado,
dbo.tblequipoasignado.procesador,
dbo.vt_usuarios.nom_completo,
dbo.vt_usuarios.nom_area,
dbo.vt_usuarios.nom_coordinacion,
dbo.vt_usuarios.nom_depto,
dbo.vt_usuarios.nom_puesto

FROM
dbo.tblequipoasignado
INNER JOIN dbo.vt_usuarios ON dbo.tblequipoasignado.fk_idusuario_responsable = dbo.vt_usuarios.id
INNER JOIN dbo.tbltipoequipo ON dbo.tblequipoasignado.fk_tipoequipo = dbo.tbltipoequipo.id
INNER JOIN dbo.tblmarca AS MarcaEquipo ON dbo.tblequipoasignado.fk_idmarca_equipo = MarcaEquipo.id
INNER JOIN dbo.tblmarca AS MarcaMonitor ON dbo.tblequipoasignado.fk_idmarca_monitor = MarcaMonitor.id
INNER JOIN dbo.tblmarca AS MarcaMouse ON dbo.tblequipoasignado.fk_idmarca_mouse = MarcaMouse.id
INNER JOIN dbo.tblmarca AS MarcaTeclado ON dbo.tblequipoasignado.fk_idmarca_teclado = MarcaTeclado.id
GO
/****** Object:  View [dbo].[vt_equipos]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_equipos] AS 
SELECT
dbo.tblequipoasignado.id,
dbo.tblusuario.nombre + ' ' + dbo.tblusuario.apellidos as nombre_completo,
dbo.tbltipoequipo.nombre as nomTipoEquipo,
MarcaEquipo.nombre AS nomMarcaEquipo,
dbo.tblequipoasignado.serie_equipo,
dbo.tblequipoasignado.ram as memoriaRam,
dbo.tblequipoasignado.disco_duro,
MarcaMonitor.nombre AS nomMarcaMonitor,
dbo.tblequipoasignado.serie_monitor,
dbo.tblequipoasignado.ip,
dbo.tblequipoasignado.mac,
MarcaMouse.nombre AS nomMarcaMouse,
dbo.tblequipoasignado.serie_mouse,
MarcaTeclado.nombre AS nomMarcaTeclado,
dbo.tblequipoasignado.serie_teclado,
dbo.tblequipoasignado.procesador

FROM
dbo.tblequipoasignado
INNER JOIN dbo.tblusuario ON dbo.tblequipoasignado.fk_idusuario_responsable = dbo.tblusuario.id
INNER JOIN dbo.tbltipoequipo ON dbo.tblequipoasignado.fk_tipoequipo = dbo.tbltipoequipo.id
INNER JOIN dbo.tblmarca AS MarcaEquipo ON dbo.tblequipoasignado.fk_idmarca_equipo = MarcaEquipo.id
INNER JOIN dbo.tblmarca AS MarcaMonitor ON dbo.tblequipoasignado.fk_idmarca_monitor = MarcaMonitor.id
INNER JOIN dbo.tblmarca AS MarcaMouse ON dbo.tblequipoasignado.fk_idmarca_mouse = MarcaMouse.id
INNER JOIN dbo.tblmarca AS MarcaTeclado ON dbo.tblequipoasignado.fk_idmarca_teclado = MarcaTeclado.id
GO
/****** Object:  StoredProcedure [dbo].[sp_cerrar_evento]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_cerrar_evento]

@idservicio INT

AS

BEGIN TRY
	BEGIN TRANSACTION

		
			UPDATE [dbhelpdesk].[dbo].[tblservicio]
				 SET [estatus] = 2
						,[fecha_cierre] = GETDATE()
			 WHERE [id] = @idservicio

			INSERT INTO dbo.tblcalidadservicio([fk_idservicio],
								 [observaciones], 
								 [promedio],
								 [estatus]) 
			VALUES (@idservicio, 
							'Sin observaciones', 
							0, 
							0)
	COMMIT
END TRY

BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK

END CATCH
GO
/****** Object:  Table [dbo].[tblincidente]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblincidente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [int] NOT NULL,
	[prioridad] [int] NOT NULL,
	[acciones] [varchar](250) NULL,
	[solucion] [varchar](250) NULL,
	[fk_idservicio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblevento]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblevento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[tipo] [int] NOT NULL,
	[fk_idlugar] [int] NOT NULL,
	[asistencia] [int] NOT NULL,
	[acomodo] [varchar](25) NOT NULL,
	[fecha_realizacion] [datetime] NOT NULL,
	[observacion] [varchar](250) NULL,
	[fk_idservicio] [int] NOT NULL,
 CONSTRAINT [PK__tblevent__C8DC7BDA22AA2996] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[numIncidentesPorUsuario]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[numIncidentesPorUsuario]

@fechaInicio DateTime,
@fechaFinal DateTime

AS
BEGIN
SELECT

dbo.tblusuarios.username AS Usuario, 
Count(dbo.tblincidente.numIncidente) AS Número

FROM
dbo.tblincidente
INNER JOIN dbo.tblusuarios ON dbo.tblincidente.soporte = dbo.tblusuarios.idUsuario
WHERE
dbo.tblincidente.status = 2 AND
dbo.tblincidente.fecha_Sol >= @fechaInicio AND
dbo.tblincidente.fecha_Sol <= @fechaFinal
GROUP BY dbo.tblusuarios.username

ORDER BY Número DESC

END
GO
/****** Object:  StoredProcedure [dbo].[numIncidentesPorTipo]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[numIncidentesPorTipo]

@fechaInicio DateTime,
@fechaFinal DateTime

AS
BEGIN
SELECT

dbo.tbltipoincidencia.nomTipoIncidente AS Tipo, 
Count(dbo.tblincidente.numIncidente) AS Número

FROM
dbo.tbltipoincidencia
INNER JOIN dbo.tblincidente ON dbo.tbltipoincidencia.idTipoIncidente = dbo.tblincidente.tipo
WHERE
dbo.tblincidente.status = 2 AND
dbo.tblincidente.fecha_Sol >= @fechaInicio AND
dbo.tblincidente.fecha_Sol <= @fechaFinal

GROUP BY dbo.tbltipoincidencia.nomTipoIncidente

ORDER BY Número DESC

END
GO
/****** Object:  StoredProcedure [dbo].[numIncidentesPorMes]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[numIncidentesPorMes]

@fechaInicio DateTime,
@fechaFinal DateTime

AS
BEGIN
SELECT
((DATENAME(month, dbo.tblincidente.fecha_Cierre))+ '/' + (DATENAME(year, dbo.tblincidente.fecha_Cierre))) AS Fecha,
Count(dbo.tblincidente.numIncidente) AS Cantidad
FROM
dbo.tblincidente
WHERE
dbo.tblincidente.status = 2 AND
dbo.tblincidente.fecha_Sol >= @fechaInicio AND
dbo.tblincidente.fecha_Sol <= @fechaFinal

GROUP BY ((DATENAME(month, dbo.tblincidente.fecha_Cierre))+ '/' + (DATENAME(year, dbo.tblincidente.fecha_Cierre)))

ORDER BY ((DATENAME(month, dbo.tblincidente.fecha_Cierre))+ '/' + (DATENAME(year, dbo.tblincidente.fecha_Cierre)))

END
GO
/****** Object:  Table [dbo].[tblrecursoasignado]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblrecursoasignado](
	[fk_idevento] [int] NOT NULL,
	[fk_idrequerimiento] [int] NOT NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[fk_idevento] ASC,
	[fk_idrequerimiento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_incidente]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertar_incidente]

@solicitante int,
@descripcion varchar(200)


AS
BEGIN TRY
	BEGIN TRANSACTION
			DECLARE @idUserNA INT = (SELECT tblusuario.id FROM tblusuario WHERE tblusuario.nombre_usuario = 'S/A');
					INSERT INTO [dbhelpdesk].[dbo].[tblservicio]
								([descripcion]
								,[fk_idusuario_solicitante]
							  ,[fk_idusuario_soporte]
							  ,[fk_idusuario_apoyo]
								,[fecha_solicitud]
								,[fecha_cierre]
								,[hora_inicial]
								,[hora_final]
								,[estatus])
					VALUES
								(@descripcion
								 ,@solicitante
								 ,@idUserNA
								 ,@idUserNA
								 ,GETDATE()
								 ,NULL
								 ,CURRENT_TIMESTAMP
								 ,NULL
								 ,0)					

					INSERT INTO [dbhelpdesk].[dbo].[tblincidente]
								 ([tipo]
								 ,[prioridad]
								 ,[acciones]
								 ,[solucion]
								 ,[fk_idservicio])
					 VALUES
								 ((SELECT tbltipoincidencia.id FROM tbltipoincidencia WHERE tbltipoincidencia.nombre = 'General')
								 ,0
								 ,'S/A'
								 ,'S/A'
								 ,(SELECT MAX(tblservicio.id) FROM tblservicio))
	COMMIT
END TRY

BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK

END CATCH
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'AS
BEGIN

DECLARE @idUserNA INT = (SELECT tblusuarios.idUsuario FROM tblusuarios WHERE tblusuarios.nombre_usuario = ''S/A'');

INSERT INTO [dbhelpdesk].[dbo].[tblincidente]
           ([tipo]
           ,[descripcion]
           ,[solicitante]
           ,[prioridad]
           ,[fecha_Sol]
           ,[status]
           ,[horaIn]
           ,[horaFn]
           ,[fecha_Cierre]
           ,[soporte]
           ,[acciones]
           ,[solucion]
           ,[seguimiento])
     VALUES
           ((SELECT tbltipoincidencia.idTipoIncidente FROM tbltipoincidencia WHERE tbltipoincidencia.nomTipoIncidente = ''General'')
           ,@Descr
           ,@Soli
           ,''S/A''
           ,GETDATE()
           ,0
           ,CURRENT_TIMESTAMP
           ,NULL
           ,NULL
           ,@idUserNA
           ,''S/A''
           ,''S/A''
           ,@idUserNA)
END' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'sp_insertar_incidente'
GO
/****** Object:  StoredProcedure [dbo].[sp_insertar_evento]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertar_evento]

@titulo VARCHAR(40),
@lugar INT,
@acomodo VARCHAR(25),
@asistencia INT,
@horaIn DATETIME,
@HoraFn DATETIME,
@descripcion VARCHAR(250),
@tipoEvento INT,
@solicitante INT,
@FechaEvento DATETIME

AS
BEGIN TRY
	BEGIN TRANSACTION

		DECLARE @idUserNA INT = (SELECT tblusuario.id FROM tblusuario WHERE tblusuario.nombre_usuario = 'S/A')

						INSERT INTO [dbhelpdesk].[dbo].[tblservicio]
								([descripcion]
								,[fk_idusuario_solicitante]
							  ,[fk_idusuario_soporte]
							  ,[fk_idusuario_apoyo]
								,[fecha_solicitud]
								,[fecha_cierre]
								,[hora_inicial]
								,[hora_final]
								,[estatus])
					VALUES
								(@descripcion
								 ,@solicitante
								 ,@idUserNA
								 ,@idUserNA
								 ,GETDATE()
								 ,NULL
								 ,@horaIn
								 ,@HoraFn
								 ,0)	

						INSERT INTO [dbhelpdesk].[dbo].[tblevento]
										 ([nombre]
										 ,[tipo]
										 ,[fk_idlugar]
										 ,[asistencia]
										 ,[acomodo]
										 ,[fecha_realizacion]
										 ,[observacion]
										 ,[fk_idservicio])
							 VALUES
										(@titulo,
										 @tipoEvento,
										 @lugar,
										 @asistencia,
										 @acomodo,
										 @FechaEvento,
										 'Sin observaciones',
										 (SELECT MAX(tblservicio.id) FROM tblservicio))
				COMMIT
				END TRY

BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK

END CATCH
GO
/****** Object:  StoredProcedure [dbo].[sp_cerrar_incidente]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_cerrar_incidente]

@idIncidente int,
@Acciones varchar(200),
@Solucion varchar(200)

AS
BEGIN TRY
	BEGIN TRANSACTION
		DECLARE  @idservicio INT = (SELECT tblincidente.fk_idservicio FROM tblincidente WHERE tblincidente.id = @idIncidente);
						UPDATE [dbhelpdesk].[dbo].[tblservicio]
							 SET [estatus] = 2
									,[hora_final] = GETDATE()
									,[fecha_cierre] = GETDATE()
							WHERE [id] = @idservicio


						UPDATE [dbhelpdesk].[dbo].[tblincidente]
								SET [acciones] = @Acciones
									 ,[solucion] = @Solucion
								WHERE [id] = @idIncidente

			 INSERT INTO dbo.tblcalidadservicio([fk_idservicio],
								 [observaciones], 
								 [promedio],
								 [estatus]) 
			VALUES (@idservicio, 
							'Sin observaciones', 
							0, 
							0)
	COMMIT
END TRY

BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK

END CATCH
GO
/****** Object:  StoredProcedure [dbo].[numEventosPorMes]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[numEventosPorMes]

@fechaInicio DateTime,
@fechaFinal DateTime

AS
BEGIN
SELECT
((DATENAME(month, dbo.tblevento.fecha_cierre))+ '/' + (DATENAME(year, dbo.tblevento.fecha_cierre))) AS Fecha,
Count(dbo.tblevento.idEvento) AS Cantidad
FROM
dbo.tblevento
WHERE
dbo.tblevento.status = 2 AND
dbo.tblevento.fecha_Sol >= @fechaInicio AND
dbo.tblevento.fecha_Sol <= @fechaFinal

GROUP BY ((DATENAME(month, dbo.tblevento.fecha_cierre))+ '/' + (DATENAME(year, dbo.tblevento.fecha_cierre)))

Order by Cantidad DESC

END
GO
/****** Object:  View [dbo].[vt_evento_sin_cerrar]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_evento_sin_cerrar] AS 
SELECT
dbo.tblevento.id,
dbo.tblevento.nombre,
dbo.tblservicio.descripcion,
dbo.tblservicio.fecha_solicitud,
dbo.tblservicio.fecha_cierre,
dbo.tblservicio.hora_inicial,
dbo.tblservicio.hora_final,
dbo.tblservicio.estatus as estatus_evento,
us_solicitante.nombre + ' ' + us_solicitante.apellidos as solicitante,
us_solicitante.id as idsolicitante,
us_soporte.nombre_usuario  as soporte,
us_apoyo.nombre_usuario as apoyo,
tipo = CASE dbo.tblevento.tipo
WHEN 0 THEN 'Público'
WHEN 1 THEN 'Privado'
END,
dbo.tbllugar.nombre AS lugar,
dbo.tblevento.asistencia,
dbo.tblevento.acomodo,
dbo.tblevento.fecha_realizacion

FROM
dbo.tblservicio
INNER JOIN dbo.tblevento ON dbo.tblservicio.id = dbo.tblevento.fk_idservicio
INNER JOIN dbo.tbllugar ON dbo.tbllugar.id = dbo.tblevento.fk_idlugar
INNER JOIN dbo.tblusuario AS us_solicitante ON us_solicitante.id = dbo.tblservicio.fk_idusuario_solicitante
INNER JOIN dbo.tblusuario AS us_soporte ON us_soporte.id = dbo.tblservicio.fk_idusuario_soporte
INNER JOIN dbo.tblusuario AS us_apoyo ON us_apoyo.id = dbo.tblservicio.fk_idusuario_apoyo
GO
/****** Object:  StoredProcedure [dbo].[topCincoRecursosMenosUsados]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[topCincoRecursosMenosUsados]

@fechaInicio DateTime,
@fechaFinal DateTime

AS
BEGIN
SELECT TOP 5 
Count(dbo.tblrequerimientoaevento.requerimiento) AS Cantidad,
dbo.tblrequerimientos.nomRequerimiento AS Nombre
FROM
dbo.tblrequerimientoaevento
INNER JOIN dbo.tblrequerimientos ON dbo.tblrequerimientoaevento.requerimiento = dbo.tblrequerimientos.idRequerimientos
INNER JOIN dbo.tblevento ON dbo.tblevento.idEvento = dbo.tblrequerimientoaevento.evento
WHERE
dbo.tblevento.status = 2 AND
dbo.tblevento.fecha_Sol >= @fechaInicio AND
dbo.tblevento.fecha_Sol <= @fechaFinal

GROUP BY
dbo.tblrequerimientos.nomRequerimiento
ORDER BY Count(dbo.tblrequerimientoaevento.requerimiento) ASC

END
GO
/****** Object:  StoredProcedure [dbo].[topCincoRecursosMasUsados]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[topCincoRecursosMasUsados]

@fechaInicio DateTime,
@fechaFinal DateTime

AS
BEGIN
SELECT TOP 5 
Count(dbo.tblrequerimientoaevento.requerimiento) AS Cantidad,
dbo.tblrequerimientos.nomRequerimiento AS Nombre
FROM
dbo.tblrequerimientoaevento
INNER JOIN dbo.tblrequerimientos ON dbo.tblrequerimientoaevento.requerimiento = dbo.tblrequerimientos.idRequerimientos
INNER JOIN dbo.tblevento ON dbo.tblevento.idEvento = dbo.tblrequerimientoaevento.evento
WHERE
dbo.tblevento.status = 2 AND
dbo.tblevento.fecha_Sol >= @fechaInicio AND
dbo.tblevento.fecha_Sol <= @fechaFinal

GROUP BY
dbo.tblrequerimientos.nomRequerimiento
ORDER BY Count(dbo.tblrequerimientoaevento.requerimiento) DESC

END
GO
/****** Object:  View [dbo].[vt_incidentes_cerrados]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_incidentes_cerrados] AS 
SELECT
dbo.tblincidente.id,
dbo.tblservicio.descripcion,
dbo.tbltipoincidencia.nombre as tipo,
prioridad = CASE dbo.tblincidente.prioridad
WHEN 0 THEN 'Normal'
WHEN 1 THEN 'Media'
WHEN 2 THEN 'Alta'
END,
dbo.tblincidente.acciones,
dbo.tblincidente.solucion,
dbo.tblservicio.fecha_solicitud,
dbo.tblservicio.fecha_cierre,
dbo.tblservicio.hora_inicial,
dbo.tblservicio.hora_final,
dbo.tblservicio.estatus as estatus_incidente,
us_solicitante.nombre + ' ' + us_solicitante.apellidos as solicitante,
dbo.tblservicio.fk_idusuario_solicitante,
us_soporte.nombre_usuario as soporte,
us_apoyo.nombre_usuario as apoyo,
dbo.tblcalidadservicio.id as idcalidad,
dbo.tblcalidadservicio.estatus as estatus_calidad,
dbo.tblcalidadservicio.promedio,
dbo.tblcalidadservicio.observaciones

FROM
dbo.tblservicio
INNER JOIN dbo.tblincidente ON dbo.tblservicio.id = dbo.tblincidente.fk_idservicio
INNER JOIN dbo.tbltipoincidencia ON dbo.tbltipoincidencia.id = dbo.tblincidente.tipo
INNER JOIN dbo.tblusuario AS us_solicitante ON us_solicitante.id = dbo.tblservicio.fk_idusuario_solicitante
INNER JOIN dbo.tblusuario AS us_soporte ON us_soporte.id = dbo.tblservicio.fk_idusuario_soporte
INNER JOIN dbo.tblusuario AS us_apoyo ON us_apoyo.id = dbo.tblservicio.fk_idusuario_apoyo
INNER JOIN dbo.tblcalidadservicio ON dbo.tblcalidadservicio.fk_idservicio = dbo.tblservicio.id
GO
/****** Object:  View [dbo].[vt_incidente_sin_cerrar]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_incidente_sin_cerrar] AS 
SELECT
dbo.tblincidente.id,
dbo.tblservicio.descripcion,
us_soporte.nombre_usuario as soporte,
us_apoyo.nombre_usuario as apoyo,
dbo.tbltipoincidencia.nombre as tipo,
prioridad = CASE dbo.tblincidente.prioridad
WHEN 0 THEN 'Normal'
WHEN 1 THEN 'Media'
WHEN 2 THEN 'Alta'
END,
dbo.tblincidente.acciones,
dbo.tblincidente.solucion,
dbo.tblservicio.fecha_solicitud,
dbo.tblservicio.fecha_cierre,
dbo.tblservicio.hora_inicial,
dbo.tblservicio.hora_final,
dbo.tblservicio.estatus as estatus_incidente,
us_solicitante.nombre + ' ' + us_solicitante.apellidos as solicitante,
dbo.tblservicio.fk_idusuario_solicitante

FROM
dbo.tblservicio
INNER JOIN dbo.tblincidente ON dbo.tblservicio.id = dbo.tblincidente.fk_idservicio
INNER JOIN dbo.tbltipoincidencia ON dbo.tbltipoincidencia.id = dbo.tblincidente.tipo
INNER JOIN dbo.tblusuario AS us_solicitante ON us_solicitante.id = dbo.tblservicio.fk_idusuario_solicitante
INNER JOIN dbo.tblusuario AS us_soporte ON us_soporte.id = dbo.tblservicio.fk_idusuario_soporte
INNER JOIN dbo.tblusuario AS us_apoyo ON us_apoyo.id = dbo.tblservicio.fk_idusuario_apoyo
GO
/****** Object:  View [dbo].[vt_eventos_cerrados]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_eventos_cerrados] AS 
SELECT
dbo.tblevento.id,
dbo.tblevento.nombre,
dbo.tblservicio.descripcion,
dbo.tblservicio.fecha_solicitud,
dbo.tblservicio.fecha_cierre,
dbo.tblservicio.hora_inicial,
dbo.tblservicio.hora_final,
dbo.tblservicio.estatus as estatus_evento,
us_solicitante.nombre + ' ' + us_solicitante.apellidos as solicitante,
us_solicitante.id as idsolicitante,
us_soporte.nombre_usuario  as soporte,
us_apoyo.nombre_usuario as apoyo,
tipo = CASE dbo.tblevento.tipo
WHEN 0 THEN 'Público'
WHEN 1 THEN 'Privado'
END,
dbo.tbllugar.nombre AS lugar,
dbo.tblevento.asistencia,
dbo.tblevento.acomodo,
dbo.tblevento.fecha_realizacion,
dbo.tblcalidadservicio.id as idcalidad,
dbo.tblcalidadservicio.estatus as estatus_calidad,
dbo.tblcalidadservicio.promedio,
dbo.tblcalidadservicio.observaciones

FROM
dbo.tblservicio
INNER JOIN dbo.tblevento ON dbo.tblservicio.id = dbo.tblevento.fk_idservicio
INNER JOIN dbo.tbllugar ON dbo.tbllugar.id = dbo.tblevento.fk_idlugar
INNER JOIN dbo.tblusuario AS us_solicitante ON us_solicitante.id = dbo.tblservicio.fk_idusuario_solicitante
INNER JOIN dbo.tblusuario AS us_soporte ON us_soporte.id = dbo.tblservicio.fk_idusuario_soporte
INNER JOIN dbo.tblusuario AS us_apoyo ON us_apoyo.id = dbo.tblservicio.fk_idusuario_apoyo
INNER JOIN dbo.tblcalidadservicio ON dbo.tblcalidadservicio.fk_idservicio = dbo.tblservicio.id
GO
/****** Object:  View [dbo].[vt_promedio_eventos]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_promedio_eventos] AS 
SELECT
dbo.tblservicio.fk_idusuario_soporte AS soporte,
Avg(dbo.tblcalidadservicio.promedio) AS promedio_evento

FROM
dbo.tblcalidadservicio
INNER JOIN dbo.tblevento ON dbo.tblevento.fk_idservicio = dbo.tblcalidadservicio.fk_idservicio
INNER JOIN dbo.tblservicio ON dbo.tblservicio.id = dbo.tblcalidadservicio.fk_idservicio
WHERE
dbo.tblcalidadservicio.estatus = 1
GROUP BY
dbo.tblservicio.fk_idusuario_soporte
GO
/****** Object:  View [dbo].[vt_promedio_incidentes]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_promedio_incidentes] AS 
SELECT
dbo.tblservicio.fk_idusuario_soporte AS soporte,
Avg(dbo.tblcalidadservicio.promedio) AS promedio_incidente

FROM
dbo.tblcalidadservicio
INNER JOIN dbo.tblevento ON dbo.tblevento.fk_idservicio = dbo.tblcalidadservicio.fk_idservicio
INNER JOIN dbo.tblservicio ON dbo.tblservicio.id = dbo.tblcalidadservicio.fk_idservicio
WHERE
dbo.tblcalidadservicio.estatus = 1
GROUP BY
dbo.tblservicio.fk_idusuario_soporte
GO
/****** Object:  View [dbo].[vt_recursos_asignados]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_recursos_asignados] AS 
SELECT
dbo.tblrecursoasignado.fk_idevento as idevento,
dbo.vt_eventos.idsolicitante,
dbo.tblrecursoasignado.cantidad,
dbo.vt_eventos.asistencia,
dbo.vt_eventos.tipo,
dbo.vt_eventos.acomodo,
dbo.vt_eventos.hora_inicial,
dbo.vt_eventos.hora_final,
dbo.vt_eventos.fecha_realizacion,
dbo.vt_eventos.observacion_evento,
dbo.vt_eventos.nombre as nom_evento,
dbo.vt_eventos.lugar,
dbo.vt_usuarios.nom_coordinacion,
dbo.tblrecurso.nombre as nom_recurso,
dbo.tblrecurso.id as idrecurso

FROM
dbo.tblrecursoasignado
INNER JOIN dbo.vt_eventos ON dbo.vt_eventos.id = dbo.tblrecursoasignado.fk_idevento
INNER JOIN dbo.tblrecurso ON dbo.tblrecurso.id = dbo.tblrecursoasignado.fk_idrequerimiento
INNER JOIN dbo.vt_usuarios ON dbo.vt_usuarios.id = dbo.vt_eventos.idsolicitante
GO
/****** Object:  View [dbo].[vt_promedio_general]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_promedio_general] AS 
SELECT TOP 100
ROW_NUMBER() OVER(ORDER BY (Avg(dbo.tblcalidadservicio.promedio)) DESC) AS posicion,
dbo.tblusuario.id,
dbo.vt_promedio_eventos.promedio_evento,
dbo.vt_promedio_incidentes.promedio_incidente,
AVG(dbo.tblcalidadservicio.promedio) as promedioTotal

FROM
dbo.tblcalidadservicio
INNER JOIN dbo.tblservicio ON dbo.tblservicio.id = dbo.tblcalidadservicio.fk_idservicio
INNER JOIN dbo.vt_promedio_eventos ON dbo.vt_promedio_eventos.soporte = dbo.tblservicio.fk_idusuario_soporte
INNER JOIN dbo.vt_promedio_incidentes ON dbo.vt_promedio_incidentes.soporte = dbo.tblservicio.fk_idusuario_soporte
INNER JOIN dbo.tblusuario ON tblusuario.id = tblservicio.fk_idusuario_soporte
WHERE 
dbo.tblusuario.tipo = 0 AND
dbo.tblcalidadservicio.estatus = 1
GROUP BY
dbo.tblusuario.id,
dbo.vt_promedio_eventos.promedio_evento,
dbo.vt_promedio_incidentes.promedio_incidente
GO
/****** Object:  StoredProcedure [dbo].[sp_requerimientos_sin_asignar]    Script Date: 11/16/2014 22:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_requerimientos_sin_asignar]

@idEvento int 

AS
BEGIN

SELECT
dbo.tblrecurso.id,
dbo.tblrecurso.nombre,
dbo.tblrecurso.cuantificable,
tipo = CASE dbo.tblrecurso.cuantificable
WHEN 0 THEN 'No cuantificable'
WHEN 1 THEN 'Cuantificable'
END

FROM
(SELECT * FROM dbo.tblrecursoasignado WHERE dbo.tblrecursoasignado.fk_idevento = @idEvento) AS reqA
RIGHT JOIN dbo.tblrecurso ON reqA.fk_idrequerimiento = dbo.tblrecurso.id
WHERE
reqA.fk_idrequerimiento IS NULL

END
GO
/****** Object:  Default [DF__tbltipoeq__siMon__74AE54BC]    Script Date: 11/16/2014 22:30:02 ******/
ALTER TABLE [dbo].[tbltipoequipo] ADD  DEFAULT ((0)) FOR [monitor]
GO
/****** Object:  Default [DF__tbltipoeq__siEqu__75A278F5]    Script Date: 11/16/2014 22:30:02 ******/
ALTER TABLE [dbo].[tbltipoequipo] ADD  DEFAULT ((0)) FOR [equipo]
GO
/****** Object:  Default [DF__tbltipoeq__siDis__76969D2E]    Script Date: 11/16/2014 22:30:02 ******/
ALTER TABLE [dbo].[tbltipoequipo] ADD  DEFAULT ((0)) FOR [disco_duro]
GO
/****** Object:  Default [DF__tbltipoeq__siMou__778AC167]    Script Date: 11/16/2014 22:30:02 ******/
ALTER TABLE [dbo].[tbltipoequipo] ADD  DEFAULT ((0)) FOR [mouse]
GO
/****** Object:  Default [DF__tblusuari__exTel__787EE5A0]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblusuario] ADD  DEFAULT ((0)) FOR [extension_telefonica]
GO
/****** Object:  Default [DF__tblrespon__respo__6B24EA82]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblequipoasignado] ADD  DEFAULT ((1)) FOR [fk_idusuario_responsable]
GO
/****** Object:  Default [DF__tblrespon__tipoE__6C190EBB]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblequipoasignado] ADD  DEFAULT ((1)) FOR [fk_tipoequipo]
GO
/****** Object:  Default [DF__tblrespon__marca__6D0D32F4]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblequipoasignado] ADD  DEFAULT ((1)) FOR [fk_idmarca_equipo]
GO
/****** Object:  Default [DF__tblrespon__serie__6E01572D]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblequipoasignado] ADD  DEFAULT ((0)) FOR [serie_equipo]
GO
/****** Object:  Default [DF__tblrespon__memor__6EF57B66]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblequipoasignado] ADD  DEFAULT ((0)) FOR [ram]
GO
/****** Object:  Default [DF__tblrespon__disco__6FE99F9F]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblequipoasignado] ADD  DEFAULT ((0)) FOR [disco_duro]
GO
/****** Object:  Default [DF__tblrespon__marca__70DDC3D8]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblequipoasignado] ADD  DEFAULT ((1)) FOR [fk_idmarca_monitor]
GO
/****** Object:  Default [DF__tblrespon__serie__71D1E811]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblequipoasignado] ADD  DEFAULT ((0)) FOR [serie_monitor]
GO
/****** Object:  Default [DF__tblresponsab__ip__72C60C4A]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblequipoasignado] ADD  DEFAULT ((0)) FOR [ip]
GO
/****** Object:  Default [DF__tblresponsa__mac__73BA3083]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblequipoasignado] ADD  DEFAULT ((0)) FOR [mac]
GO
/****** Object:  ForeignKey [fk_coordinacion]    Script Date: 11/16/2014 22:30:02 ******/
ALTER TABLE [dbo].[tbldepartamento]  WITH CHECK ADD  CONSTRAINT [fk_coordinacion] FOREIGN KEY([fk_idcoordinacion])
REFERENCES [dbo].[tblcoordinacion] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbldepartamento] CHECK CONSTRAINT [fk_coordinacion]
GO
/****** Object:  ForeignKey [fk_calidad]    Script Date: 11/16/2014 22:30:02 ******/
ALTER TABLE [dbo].[tblrespuesta]  WITH CHECK ADD  CONSTRAINT [fk_calidad] FOREIGN KEY([fk_idcalidad])
REFERENCES [dbo].[tblcalidadservicio] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblrespuesta] CHECK CONSTRAINT [fk_calidad]
GO
/****** Object:  ForeignKey [fk_pregunta]    Script Date: 11/16/2014 22:30:02 ******/
ALTER TABLE [dbo].[tblrespuesta]  WITH CHECK ADD  CONSTRAINT [fk_pregunta] FOREIGN KEY([fk_idpregunta])
REFERENCES [dbo].[tblpregunta] ([id])
GO
ALTER TABLE [dbo].[tblrespuesta] CHECK CONSTRAINT [fk_pregunta]
GO
/****** Object:  ForeignKey [fk_area]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblusuario]  WITH CHECK ADD  CONSTRAINT [fk_area] FOREIGN KEY([fk_idarea])
REFERENCES [dbo].[tblarea] ([id])
GO
ALTER TABLE [dbo].[tblusuario] CHECK CONSTRAINT [fk_area]
GO
/****** Object:  ForeignKey [fk_depto]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblusuario]  WITH CHECK ADD  CONSTRAINT [fk_depto] FOREIGN KEY([fk_iddepto])
REFERENCES [dbo].[tbldepartamento] ([id])
GO
ALTER TABLE [dbo].[tblusuario] CHECK CONSTRAINT [fk_depto]
GO
/****** Object:  ForeignKey [fk_institucion]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblusuario]  WITH CHECK ADD  CONSTRAINT [fk_institucion] FOREIGN KEY([fk_idinstitucion])
REFERENCES [dbo].[tblinstitucion] ([id])
GO
ALTER TABLE [dbo].[tblusuario] CHECK CONSTRAINT [fk_institucion]
GO
/****** Object:  ForeignKey [fk_puesto]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblusuario]  WITH CHECK ADD  CONSTRAINT [fk_puesto] FOREIGN KEY([fk_idpuesto])
REFERENCES [dbo].[tblpuesto] ([id])
GO
ALTER TABLE [dbo].[tblusuario] CHECK CONSTRAINT [fk_puesto]
GO
/****** Object:  ForeignKey [fk_idapoyo]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblservicio]  WITH CHECK ADD  CONSTRAINT [fk_idapoyo] FOREIGN KEY([fk_idusuario_apoyo])
REFERENCES [dbo].[tblusuario] ([id])
GO
ALTER TABLE [dbo].[tblservicio] CHECK CONSTRAINT [fk_idapoyo]
GO
/****** Object:  ForeignKey [fk_idsolicitante]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblservicio]  WITH CHECK ADD  CONSTRAINT [fk_idsolicitante] FOREIGN KEY([fk_idusuario_solicitante])
REFERENCES [dbo].[tblusuario] ([id])
GO
ALTER TABLE [dbo].[tblservicio] CHECK CONSTRAINT [fk_idsolicitante]
GO
/****** Object:  ForeignKey [fk_idsoporte]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblservicio]  WITH CHECK ADD  CONSTRAINT [fk_idsoporte] FOREIGN KEY([fk_idusuario_soporte])
REFERENCES [dbo].[tblusuario] ([id])
GO
ALTER TABLE [dbo].[tblservicio] CHECK CONSTRAINT [fk_idsoporte]
GO
/****** Object:  ForeignKey [fk_marca_equipo]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblequipoasignado]  WITH NOCHECK ADD  CONSTRAINT [fk_marca_equipo] FOREIGN KEY([fk_idmarca_equipo])
REFERENCES [dbo].[tblmarca] ([id])
GO
ALTER TABLE [dbo].[tblequipoasignado] NOCHECK CONSTRAINT [fk_marca_equipo]
GO
/****** Object:  ForeignKey [fk_marca_monitor]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblequipoasignado]  WITH CHECK ADD  CONSTRAINT [fk_marca_monitor] FOREIGN KEY([fk_idmarca_monitor])
REFERENCES [dbo].[tblmarca] ([id])
GO
ALTER TABLE [dbo].[tblequipoasignado] CHECK CONSTRAINT [fk_marca_monitor]
GO
/****** Object:  ForeignKey [fk_marca_mouse]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblequipoasignado]  WITH CHECK ADD  CONSTRAINT [fk_marca_mouse] FOREIGN KEY([fk_idmarca_mouse])
REFERENCES [dbo].[tblmarca] ([id])
GO
ALTER TABLE [dbo].[tblequipoasignado] CHECK CONSTRAINT [fk_marca_mouse]
GO
/****** Object:  ForeignKey [fk_marca_teclado]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblequipoasignado]  WITH CHECK ADD  CONSTRAINT [fk_marca_teclado] FOREIGN KEY([fk_idmarca_teclado])
REFERENCES [dbo].[tblmarca] ([id])
GO
ALTER TABLE [dbo].[tblequipoasignado] CHECK CONSTRAINT [fk_marca_teclado]
GO
/****** Object:  ForeignKey [fk_tipo_equipo]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblequipoasignado]  WITH CHECK ADD  CONSTRAINT [fk_tipo_equipo] FOREIGN KEY([fk_tipoequipo])
REFERENCES [dbo].[tbltipoequipo] ([id])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[tblequipoasignado] CHECK CONSTRAINT [fk_tipo_equipo]
GO
/****** Object:  ForeignKey [fk_usuario_responsable]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblequipoasignado]  WITH CHECK ADD  CONSTRAINT [fk_usuario_responsable] FOREIGN KEY([fk_idusuario_responsable])
REFERENCES [dbo].[tblusuario] ([id])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[tblequipoasignado] CHECK CONSTRAINT [fk_usuario_responsable]
GO
/****** Object:  ForeignKey [fk_idservicio_incidente]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblincidente]  WITH CHECK ADD  CONSTRAINT [fk_idservicio_incidente] FOREIGN KEY([fk_idservicio])
REFERENCES [dbo].[tblservicio] ([id])
GO
ALTER TABLE [dbo].[tblincidente] CHECK CONSTRAINT [fk_idservicio_incidente]
GO
/****** Object:  ForeignKey [fk_tipo]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblincidente]  WITH CHECK ADD  CONSTRAINT [fk_tipo] FOREIGN KEY([tipo])
REFERENCES [dbo].[tbltipoincidencia] ([id])
GO
ALTER TABLE [dbo].[tblincidente] CHECK CONSTRAINT [fk_tipo]
GO
/****** Object:  ForeignKey [fk_idservicio]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblevento]  WITH CHECK ADD  CONSTRAINT [fk_idservicio] FOREIGN KEY([fk_idservicio])
REFERENCES [dbo].[tblservicio] ([id])
GO
ALTER TABLE [dbo].[tblevento] CHECK CONSTRAINT [fk_idservicio]
GO
/****** Object:  ForeignKey [fk_lugar]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblevento]  WITH CHECK ADD  CONSTRAINT [fk_lugar] FOREIGN KEY([fk_idlugar])
REFERENCES [dbo].[tbllugar] ([id])
GO
ALTER TABLE [dbo].[tblevento] CHECK CONSTRAINT [fk_lugar]
GO
/****** Object:  ForeignKey [fk_evento_en_uso]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblrecursoasignado]  WITH CHECK ADD  CONSTRAINT [fk_evento_en_uso] FOREIGN KEY([fk_idevento])
REFERENCES [dbo].[tblevento] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblrecursoasignado] CHECK CONSTRAINT [fk_evento_en_uso]
GO
/****** Object:  ForeignKey [fk_recurso_asignado]    Script Date: 11/16/2014 22:30:03 ******/
ALTER TABLE [dbo].[tblrecursoasignado]  WITH CHECK ADD  CONSTRAINT [fk_recurso_asignado] FOREIGN KEY([fk_idrequerimiento])
REFERENCES [dbo].[tblrecurso] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblrecursoasignado] CHECK CONSTRAINT [fk_recurso_asignado]
GO
