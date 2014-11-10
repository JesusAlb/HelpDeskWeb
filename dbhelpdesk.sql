USE [master]
GO
/****** Object:  Database [dbhelpdesk]    Script Date: 11/10/2014 12:48:29 ******/
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
/****** Object:  Table [dbo].[tbltipoincidencia]    Script Date: 11/10/2014 12:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbltipoincidencia](
	[idTipoIncidente] [int] IDENTITY(1,1) NOT NULL,
	[nomTipoIncidente] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoIncidente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nombreTipoIncidente] UNIQUE NONCLUSTERED 
(
	[nomTipoIncidente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbltipoequipo]    Script Date: 11/10/2014 12:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbltipoequipo](
	[idTipoEquipo] [int] IDENTITY(1,1) NOT NULL,
	[nomTipoEquipo] [varchar](40) NULL,
	[siMonitor] [bit] NOT NULL,
	[siEquipo] [bit] NOT NULL,
	[siDiscoDuro] [bit] NOT NULL,
	[siMouse] [bit] NOT NULL,
	[siTeclado] [bit] NOT NULL,
	[siRed] [bit] NOT NULL,
	[siRAM] [bit] NOT NULL,
	[siProcesador] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoEquipo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nombreTipoEquipo] UNIQUE NONCLUSTERED 
(
	[nomTipoEquipo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblrequerimientos]    Script Date: 11/10/2014 12:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblrequerimientos](
	[idRequerimientos] [int] IDENTITY(1,1) NOT NULL,
	[nomRequerimiento] [varchar](30) NOT NULL,
	[cuantificable] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idRequerimientos] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nombreRequerimiento] UNIQUE NONCLUSTERED 
(
	[nomRequerimiento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblcoordinacion]    Script Date: 11/10/2014 12:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblcoordinacion](
	[idCoordinacion] [int] IDENTITY(1,1) NOT NULL,
	[nomCoordinacion] [varchar](60) NULL,
 CONSTRAINT [PK_tblcoordinacion] PRIMARY KEY CLUSTERED 
(
	[idCoordinacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nomCoordinacion] UNIQUE NONCLUSTERED 
(
	[nomCoordinacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblarea]    Script Date: 11/10/2014 12:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblarea](
	[idArea] [int] IDENTITY(1,1) NOT NULL,
	[nomArea] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[idArea] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nomArea] UNIQUE NONCLUSTERED 
(
	[nomArea] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblpuesto]    Script Date: 11/10/2014 12:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblpuesto](
	[idPuesto] [int] IDENTITY(1,1) NOT NULL,
	[nomPuesto] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPuesto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nombrePuesto] UNIQUE NONCLUSTERED 
(
	[nomPuesto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblpregunta]    Script Date: 11/10/2014 12:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblpregunta](
	[idPregunta] [int] NOT NULL,
	[txtPregunta] [varchar](70) NOT NULL,
	[statusPregunta] [bit] NOT NULL,
	[afinidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPregunta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblmarca]    Script Date: 11/10/2014 12:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblmarca](
	[idMarca] [int] IDENTITY(1,1) NOT NULL,
	[nomMarca] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[idMarca] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nombreMarca] UNIQUE NONCLUSTERED 
(
	[nomMarca] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbllugar]    Script Date: 11/10/2014 12:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbllugar](
	[idLugar] [int] IDENTITY(1,1) NOT NULL,
	[nomLugar] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[idLugar] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nomLugar] UNIQUE NONCLUSTERED 
(
	[nomLugar] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblinstitucion]    Script Date: 11/10/2014 12:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblinstitucion](
	[idInstitucion] [int] IDENTITY(1,1) NOT NULL,
	[nomInstitucion] [varchar](60) NULL,
	[correoInstitucion] [varchar](20) NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idInstitucion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nombreInstitucion] UNIQUE NONCLUSTERED 
(
	[nomInstitucion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[promedioCalidadPorUsuarioIn]    Script Date: 11/10/2014 12:48:42 ******/
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
/****** Object:  StoredProcedure [dbo].[promedioCalidadPorUsuarioEv]    Script Date: 11/10/2014 12:48:42 ******/
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
/****** Object:  StoredProcedure [dbo].[promedioCalidadPorTipoIn]    Script Date: 11/10/2014 12:48:42 ******/
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
/****** Object:  StoredProcedure [dbo].[promedioCalidadPorMesIn]    Script Date: 11/10/2014 12:48:42 ******/
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
/****** Object:  StoredProcedure [dbo].[promedioCalidadPorMesEv]    Script Date: 11/10/2014 12:48:42 ******/
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
/****** Object:  StoredProcedure [dbo].[numEventosPorUsuario]    Script Date: 11/10/2014 12:48:42 ******/
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
/****** Object:  View [dbo].[VistaPregunta]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaPregunta] AS 
SELECT
ROW_NUMBER() OVER( ORDER BY dbo.tblpregunta.idPregunta) AS numPregunta,
dbo.tblpregunta.idPregunta,
dbo.tblpregunta.txtPregunta,
dbo.tblpregunta.statusPregunta,
dbo.tblpregunta.afinidad

FROM
dbo.tblpregunta
GO
/****** Object:  View [dbo].[ViewTipoIncidencia]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewTipoIncidencia] AS 
SELECT
dbo.tbltipoincidencia.idTipoIncidente,
dbo.tbltipoincidencia.nomTipoIncidente

FROM
dbo.tbltipoincidencia
GO
/****** Object:  Table [dbo].[tbldepartamentos]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbldepartamentos](
	[idDepto] [int] IDENTITY(1,1) NOT NULL,
	[nomDepto] [varchar](60) NULL,
	[coordinacion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idDepto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nomDepto] UNIQUE NONCLUSTERED 
(
	[nomDepto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblusuarios]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblusuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[username] [varchar](40) NULL,
	[password] [varchar](25) NOT NULL,
	[tipoUsuario] [int] NOT NULL,
	[depto] [int] NOT NULL,
	[exTel] [varchar](5) NULL,
	[area] [int] NOT NULL,
	[puesto] [int] NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[institucion] [int] NOT NULL,
	[apellidos] [varchar](60) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [nomUsuario] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[ViewDepartamentos]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewDepartamentos] AS 
SELECT
dbo.tbldepartamentos.idDepto,
dbo.tbldepartamentos.nomDepto,
dbo.tblcoordinacion.nomCoordinacion,
dbo.tbldepartamentos.coordinacion

FROM
dbo.tbldepartamentos,dbo.tblcoordinacion
WHERE
dbo.tbldepartamentos.coordinacion = dbo.tblcoordinacion.idCoordinacion
GO
/****** Object:  Table [dbo].[tblincidente]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblincidente](
	[numIncidente] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [int] NOT NULL,
	[descripcion] [varchar](300) NULL,
	[solicitante] [int] NOT NULL,
	[prioridad] [varchar](6) NULL,
	[fecha_Sol] [datetime] NULL,
	[status] [int] NOT NULL,
	[horaIn] [datetime] NULL,
	[horaFn] [datetime] NULL,
	[fecha_Cierre] [datetime] NULL,
	[soporte] [int] NOT NULL,
	[acciones] [varchar](300) NULL,
	[solucion] [varchar](300) NULL,
	[seguimiento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[numIncidente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblevento]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblevento](
	[idEvento] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](300) NULL,
	[solicitante] [int] NOT NULL,
	[responsable] [int] NOT NULL,
	[apoyo] [int] NOT NULL,
	[fecha_Sol] [datetime] NULL,
	[lugar] [int] NULL,
	[asistencia_aprox] [int] NULL,
	[tipo_evento] [varchar](25) NULL,
	[acomodo] [varchar](25) NULL,
	[horaIn] [datetime] NULL,
	[horaFn] [datetime] NULL,
	[fecha_cierre] [datetime] NULL,
	[status] [int] NOT NULL,
	[FechaInicio] [datetime] NULL,
	[observaciones] [varchar](350) NULL,
	[titulo] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[idEvento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[ViewUsuarios]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewUsuarios] AS 
SELECT
dbo.tblusuarios.idUsuario,
dbo.tblusuarios.username,
(dbo.tblusuarios.nombre + ' ' + dbo.tblusuarios.apellidos) as nomCompleto,
dbo.tblusuarios.password,
tipoUsuarioString = CASE dbo.tblusuarios.tipoUsuario
WHEN 0 THEN 'Soporte'
WHEN 1 THEN 'Solicitante'
ELSE 'S/N'
END,
dbo.tblusuarios.exTel,
dbo.tbldepartamentos.nomDepto,
dbo.tblcoordinacion.nomCoordinacion,
dbo.tblarea.nomArea,
dbo.tblpuesto.nomPuesto,
dbo.tblusuarios.tipoUsuario,
dbo.tblusuarios.correo,
dbo.tblinstitucion.nomInstitucion

FROM
dbo.tblusuarios
INNER JOIN dbo.tbldepartamentos ON dbo.tbldepartamentos.idDepto = dbo.tblusuarios.depto
INNER JOIN dbo.tblcoordinacion ON dbo.tblcoordinacion.idCoordinacion = dbo.tbldepartamentos.coordinacion
INNER JOIN dbo.tblarea ON dbo.tblusuarios.area = dbo.tblarea.idArea
INNER JOIN dbo.tblpuesto ON dbo.tblpuesto.idPuesto = dbo.tblusuarios.puesto
INNER JOIN dbo.tblinstitucion ON dbo.tblusuarios.institucion = dbo.tblinstitucion.idInstitucion
WHERE
dbo.tbldepartamentos.coordinacion = dbo.tblcoordinacion.idCoordinacion AND
dbo.tblusuarios.depto = dbo.tbldepartamentos.idDepto
GO
/****** Object:  Table [dbo].[tblresponsablequipo]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblresponsablequipo](
	[idResponEq] [int] IDENTITY(1,1) NOT NULL,
	[responsable] [int] NOT NULL,
	[tipoEquipo] [int] NOT NULL,
	[marcaEquipo] [int] NOT NULL,
	[serieEquipo] [varchar](25) NOT NULL,
	[memoriaRam] [varchar](8) NULL,
	[discoDuro] [varchar](8) NULL,
	[marcaMonitor] [int] NOT NULL,
	[serieMonitor] [varchar](25) NOT NULL,
	[ip] [varchar](15) NOT NULL,
	[mac] [varchar](17) NOT NULL,
	[marcaMouse] [int] NOT NULL,
	[serieMouse] [varchar](25) NOT NULL,
	[marcaTeclado] [int] NOT NULL,
	[serieTeclado] [varchar](25) NOT NULL,
	[procesador] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idResponEq] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblcalidadservicio]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblcalidadservicio](
	[idCalidad_Servicio] [int] IDENTITY(1,1) NOT NULL,
	[observacionesServicio] [varchar](200) NOT NULL,
	[incidente] [int] NULL,
	[statusCal_Servicio] [bit] NOT NULL,
	[evento] [int] NULL,
	[promedioCalidad] [float] NULL,
	[usuario_calificado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCalidad_Servicio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblrequerimientoaevento]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblrequerimientoaevento](
	[evento] [int] NOT NULL,
	[requerimiento] [int] NOT NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[evento] ASC,
	[requerimiento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaEquipos]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaEquipos] AS 
SELECT
respons.idResponEq,
dbo.tblusuarios.nombre + ' ' + dbo.tblusuarios.apellidos as nomCompleto,
dbo.tbltipoequipo.nomTipoEquipo,
MarcaEquipo.nomMarca AS nomMarcaEquipo,
respons.serieEquipo,
respons.memoriaRam,
respons.discoDuro,
MarcaMonitor.nomMarca AS nomMarcaMonitor,
respons.serieMonitor,
respons.ip,
respons.mac,
MarcaMouse.nomMarca AS nomMarcaMouse,
respons.serieMouse,
MarcaTeclado.nomMarca AS nomMarcaTeclado,
respons.serieTeclado,
respons.procesador

FROM
dbo.tblresponsablequipo AS respons
INNER JOIN dbo.tblusuarios ON respons.responsable = dbo.tblusuarios.idUsuario
INNER JOIN dbo.tbltipoequipo ON respons.tipoEquipo = dbo.tbltipoequipo.idTipoEquipo
INNER JOIN dbo.tblmarca AS MarcaEquipo ON respons.marcaEquipo = MarcaEquipo.idMarca
INNER JOIN dbo.tblmarca AS MarcaMonitor ON respons.marcaMonitor = MarcaMonitor.idMarca
INNER JOIN dbo.tblmarca AS MarcaMouse ON respons.marcaMouse = MarcaMouse.idMarca
INNER JOIN dbo.tblmarca AS MarcaTeclado ON respons.marcaTeclado = MarcaTeclado.idMarca
GO
/****** Object:  View [dbo].[VistaEquipoReporte]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaEquipoReporte] AS 
SELECT
respons.idResponEq,
dbo.tbltipoequipo.nomTipoEquipo,
MarcaEquipo.nomMarca AS nomMarcaEquipo,
respons.serieEquipo,
respons.memoriaRam,
respons.discoDuro,
MarcaMonitor.nomMarca AS nomMarcaMonitor,
respons.serieMonitor,
respons.ip,
respons.mac,
MarcaMouse.nomMarca AS nomMarcaMouse,
respons.serieMouse,
MarcaTeclado.nomMarca AS nomMarcaTeclado,
respons.serieTeclado,
respons.procesador,
dbo.ViewUsuarios.nomCompleto,
dbo.ViewUsuarios.nomDepto,
dbo.ViewUsuarios.nomCoordinacion,
dbo.ViewUsuarios.nomArea,
dbo.ViewUsuarios.nomPuesto

FROM
dbo.tblresponsablequipo AS respons
INNER JOIN dbo.tbltipoequipo ON respons.tipoEquipo = dbo.tbltipoequipo.idTipoEquipo
INNER JOIN dbo.tblmarca AS MarcaEquipo ON respons.marcaEquipo = MarcaEquipo.idMarca
INNER JOIN dbo.tblmarca AS MarcaMonitor ON respons.marcaMonitor = MarcaMonitor.idMarca
INNER JOIN dbo.tblmarca AS MarcaMouse ON respons.marcaMouse = MarcaMouse.idMarca
INNER JOIN dbo.tblmarca AS MarcaTeclado ON respons.marcaTeclado = MarcaTeclado.idMarca
INNER JOIN dbo.ViewUsuarios ON respons.responsable = dbo.ViewUsuarios.idUsuario
GO
/****** Object:  View [dbo].[VistaEventosSinCerrar]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaEventosSinCerrar] AS 
SELECT
dbo.tblevento.idEvento,
dbo.tblevento.descripcion,
uSolicitante.nombre + ' ' + uSolicitante.apellidos AS solicitante,
uResponsable.username AS responsable,
uApoyo.username AS apoyo,
dbo.tblevento.fecha_Sol,
dbo.tblevento.asistencia_aprox,
dbo.tblevento.tipo_evento,
dbo.tblevento.acomodo,
dbo.tblevento.horaIn,
dbo.tblevento.horaFn,
dbo.tblevento.fecha_cierre,
dbo.tblevento.status,
dbo.tblevento.FechaInicio,
dbo.tblevento.solicitante AS idSolicitante,
dbo.tblevento.responsable AS idResponsable,
dbo.tblevento.apoyo AS idApoyo,
dbo.tbllugar.nomLugar AS lugar,
dbo.tblevento.observaciones,
dbo.tblevento.titulo

FROM
dbo.tblevento
INNER JOIN dbo.tblusuarios AS uSolicitante ON dbo.tblevento.solicitante = uSolicitante.idUsuario
INNER JOIN dbo.tblusuarios AS uResponsable ON dbo.tblevento.responsable = uResponsable.idUsuario
INNER JOIN dbo.tblusuarios AS uApoyo ON dbo.tblevento.apoyo = uApoyo.idUsuario
INNER JOIN dbo.tbllugar ON dbo.tblevento.lugar = dbo.tbllugar.idLugar
WHERE
dbo.tblevento.status NOT LIKE 2
GO
/****** Object:  StoredProcedure [dbo].[promedioCalidadPorDepto]    Script Date: 11/10/2014 12:48:43 ******/
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
/****** Object:  StoredProcedure [dbo].[numIncidentesPorUsuario]    Script Date: 11/10/2014 12:48:43 ******/
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
/****** Object:  StoredProcedure [dbo].[numIncidentesPorTipo]    Script Date: 11/10/2014 12:48:43 ******/
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
/****** Object:  StoredProcedure [dbo].[numIncidentesPorMes]    Script Date: 11/10/2014 12:48:43 ******/
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
/****** Object:  StoredProcedure [dbo].[numIncidentesPorDepto]    Script Date: 11/10/2014 12:48:43 ******/
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
/****** Object:  View [dbo].[VistaIncidentesSinCerrar]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaIncidentesSinCerrar] AS 
SELECT
dbo.tblincidente.numIncidente,
dbo.tblincidente.descripcion,
dbo.tblincidente.prioridad,
dbo.tbltipoincidencia.nomTipoIncidente AS tipo,
dbo.tblincidente.fecha_Sol,
dbo.tblincidente.status,
dbo.tblincidente.horaIn,
dbo.tblincidente.horaFn,
dbo.tblincidente.fecha_Cierre,
dbo.tblincidente.acciones,
dbo.tblincidente.solucion,
uSolicitante.nombre + ' ' + uSolicitante.apellidos AS solicitante,
uSolicitante.idUsuario AS idSolicitante,
uSoporte.idUsuario AS idSoporte,
uSoporte.username AS soporte,
uSeguimiento.username AS seguimiento,
uSeguimiento.idUsuario AS idSeguimiento

FROM
dbo.tblincidente
INNER JOIN dbo.tbltipoincidencia ON dbo.tblincidente.tipo = dbo.tbltipoincidencia.idTipoIncidente
INNER JOIN dbo.tblusuarios AS uSolicitante ON dbo.tblincidente.solicitante = uSolicitante.idUsuario
INNER JOIN dbo.tblusuarios AS uSoporte ON uSoporte.idUsuario = dbo.tblincidente.soporte
INNER JOIN dbo.tblusuarios AS uSeguimiento ON uSeguimiento.idUsuario = dbo.tblincidente.seguimiento
WHERE
dbo.tblincidente.status NOT LIKE 2
GO
/****** Object:  StoredProcedure [dbo].[numEventosPorMes]    Script Date: 11/10/2014 12:48:43 ******/
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
/****** Object:  StoredProcedure [dbo].[insertarIncidente]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarIncidente]

@Descr varchar(200),
@Soli int


AS
BEGIN

DECLARE @idUserNA INT = (SELECT tblusuarios.idUsuario FROM tblusuarios WHERE tblusuarios.username = 'S/A');

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
           ((SELECT tbltipoincidencia.idTipoIncidente FROM tbltipoincidencia WHERE tbltipoincidencia.nomTipoIncidente = 'General')
           ,@Descr
           ,@Soli
           ,'S/A'
           ,GETDATE()
           ,0
           ,CURRENT_TIMESTAMP
           ,NULL
           ,NULL
           ,@idUserNA
           ,'S/A'
           ,'S/A'
           ,@idUserNA)
END
GO
/****** Object:  StoredProcedure [dbo].[insertarEvento]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarEvento]

@titulo VARCHAR(40),
@lugar int,
@acomodo VARCHAR(25),
@asistencia int,
@horaIn DATETIME,
@HoraFn DATETIME,
@descripcion VARCHAR(250),
@tipoEvento VARCHAR(25),
@solicitante int,
@FechaEvento DATETIME

AS
BEGIN
	
	DECLARE @idUserNA INT = (SELECT tblusuarios.idUsuario FROM tblusuarios WHERE tblusuarios.username = 'S/A')
	
  INSERT INTO [dbhelpdesk].[dbo].[tblevento]
           ([descripcion]
           ,[solicitante]
           ,[responsable]
           ,[apoyo]
           ,[fecha_Sol]
           ,[lugar]
           ,[asistencia_aprox]
           ,[tipo_evento]
           ,[acomodo]
           ,[horaIn]
           ,[horaFn]
           ,[fecha_cierre]
           ,[status]
           ,[FechaInicio]
           ,[observaciones]
           ,[titulo])
     VALUES
           (@descripcion,
           @solicitante,
           @idUserNA,
           @idUserNA,
           GETDATE(),
           @lugar,
           @asistencia,
           @tipoEvento,
           @acomodo,
					 @horaIn,
           @HoraFn,
           NULL,
           0,
           @FechaEvento,
           'Sin observaciones',
           @titulo)
END
GO
/****** Object:  StoredProcedure [dbo].[cerrarIncidente]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cerrarIncidente]

@idIn int,
@Acci varchar(200),
@Solu varchar(200)

AS
BEGIN TRY
	BEGIN TRANSACTION
						UPDATE [dbhelpdesk].[dbo].[tblincidente]
							 SET [status] = 2
									,[horaFn] = GETDATE()
									,[fecha_Cierre] = GETDATE()
									,[acciones] = @Acci
									,[solucion] = @Solu
						 WHERE [numIncidente] = @idIn
			 INSERT INTO dbo.tblcalidadservicio([incidente],
								 [observacionesServicio], 
								 [promedioCalidad],
								 [statusCal_Servicio],
								 [usuario_calificado]) 
			VALUES (@idIn, 
							'Sin observaciones', 
							0, 
							0,
							(SELECT tblincidente.soporte FROM tblincidente WHERE tblincidente.numIncidente = @idIn))
	COMMIT
END TRY

BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK

END CATCH
GO
/****** Object:  StoredProcedure [dbo].[cerrarEvento]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cerrarEvento]

@idEv INT

AS

BEGIN TRY
	BEGIN TRANSACTION

		
			UPDATE [dbhelpdesk].[dbo].[tblevento]
				 SET [status] = 2
						,[fecha_cierre] = GETDATE()
			 WHERE [idEvento] = @idEv

			INSERT INTO dbo.tblcalidadservicio([evento],
								 [observacionesServicio], 
								 [promedioCalidad],
								 [statusCal_Servicio],
								 [usuario_calificado]) 
			VALUES (@idEv, 
							'Sin observaciones', 
							0, 
							0,
							(SELECT tblevento.responsable FROM tblevento WHERE tblevento.idEvento = @idEv)
)
	COMMIT
END TRY

BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK

END CATCH
GO
/****** Object:  View [dbo].[VistaIncidentesCerrados]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaIncidentesCerrados] AS 
SELECT
dbo.tblincidente.numIncidente,
dbo.tblincidente.descripcion,
uSolicitante.nombre + ' ' + uSolicitante.apellidos AS solicitante,
dbo.tblincidente.prioridad,
dbo.tblincidente.fecha_Sol,
dbo.tblincidente.status,
dbo.tblincidente.horaIn,
dbo.tblincidente.horaFn,
dbo.tblincidente.fecha_Cierre,
uSoporte.username AS soporte,
dbo.tblincidente.acciones,
dbo.tblincidente.solucion,
uSeguimiento.username AS seguimiento,
dbo.tblincidente.solicitante AS idSolicitante,
dbo.tblincidente.soporte AS idSoporte,
dbo.tblincidente.seguimiento AS idSeguimiento,
dbo.tbltipoincidencia.nomTipoIncidente AS tipo,
dbo.tblcalidadservicio.statusCal_Servicio,
dbo.tblcalidadservicio.idCalidad_Servicio,
dbo.tblcalidadservicio.observacionesServicio,
dbo.tblcalidadservicio.promedioCalidad

FROM
dbo.tblincidente
INNER JOIN dbo.tbltipoincidencia ON dbo.tblincidente.tipo = dbo.tbltipoincidencia.idTipoIncidente
INNER JOIN dbo.tblusuarios AS uSolicitante ON dbo.tblincidente.solicitante = uSolicitante.idUsuario
INNER JOIN dbo.tblusuarios AS uSoporte ON dbo.tblincidente.soporte = uSoporte.idUsuario
INNER JOIN dbo.tblusuarios AS uSeguimiento ON dbo.tblincidente.seguimiento = uSeguimiento.idUsuario
INNER JOIN dbo.tblcalidadservicio ON dbo.tblcalidadservicio.incidente = dbo.tblincidente.numIncidente
WHERE
dbo.tblincidente.status = 2
GO
/****** Object:  View [dbo].[ViewEventoConRequerimientos]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewEventoConRequerimientos] AS 
SELECT
dbo.tblrequerimientoaevento.evento,
dbo.tblrequerimientoaevento.cantidad,
dbo.tblevento.asistencia_aprox,
dbo.tblevento.tipo_evento,
dbo.tblevento.acomodo,
dbo.tblevento.horaIn,
dbo.tblevento.horaFn,
dbo.tblevento.FechaInicio,
dbo.tblevento.observaciones,
dbo.tblevento.titulo,
dbo.tbllugar.nomLugar,
dbo.ViewUsuarios.nomCoordinacion,
dbo.tblrequerimientos.nomRequerimiento,
dbo.tblrequerimientos.idRequerimientos

FROM
dbo.tblrequerimientoaevento
INNER JOIN dbo.tblevento ON dbo.tblevento.idEvento = dbo.tblrequerimientoaevento.evento
INNER JOIN dbo.tblrequerimientos ON dbo.tblrequerimientos.idRequerimientos = dbo.tblrequerimientoaevento.requerimiento
INNER JOIN dbo.tbllugar ON dbo.tbllugar.idLugar = dbo.tblevento.lugar
INNER JOIN dbo.ViewUsuarios ON dbo.tblevento.solicitante = dbo.ViewUsuarios.idUsuario
GO
/****** Object:  StoredProcedure [dbo].[ReqAsignados]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ReqAsignados]

@id int

AS
BEGIN
SELECT tblrequerimientos.nomRequerimiento, tblrequerimientoaevento.cantidad  
FROM tblevento, tblrequerimientoaevento, tblrequerimientos
WHERE tblevento.idEvento = tblrequerimientoaevento.evento
AND tblrequerimientos.idRequerimientos = tblrequerimientoaevento.requerimiento 
AND tblevento.idEvento = @id
END
GO
/****** Object:  View [dbo].[VistaEventosCerrados]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaEventosCerrados] AS 
SELECT
dbo.tblevento.idEvento,
dbo.tblevento.descripcion,
uSolicitante.nombre + ' ' + uSolicitante.apellidos AS solicitante,
uResponsable.username AS responsable,
uApoyo.username AS apoyo,
dbo.tblevento.fecha_Sol,
dbo.tblevento.asistencia_aprox,
dbo.tblevento.tipo_evento,
dbo.tblevento.acomodo,
dbo.tblevento.horaIn,
dbo.tblevento.horaFn,
dbo.tblevento.fecha_cierre,
dbo.tblevento.status,
dbo.tblevento.FechaInicio,
dbo.tblevento.solicitante AS idSolicitante,
dbo.tblevento.responsable AS idResponsable,
dbo.tblevento.apoyo AS idApoyo,
dbo.tbllugar.nomLugar AS lugar,
dbo.tblevento.observaciones,
dbo.tblevento.titulo,
dbo.tblcalidadservicio.statusCal_Servicio,
dbo.tblcalidadservicio.idCalidad_Servicio,
dbo.tblcalidadservicio.observacionesServicio,
dbo.tblcalidadservicio.promedioCalidad

FROM
dbo.tblevento
INNER JOIN dbo.tblusuarios AS uSolicitante ON dbo.tblevento.solicitante = uSolicitante.idUsuario
INNER JOIN dbo.tblusuarios AS uResponsable ON dbo.tblevento.responsable = uResponsable.idUsuario
INNER JOIN dbo.tblusuarios AS uApoyo ON dbo.tblevento.apoyo = uApoyo.idUsuario
INNER JOIN dbo.tbllugar ON dbo.tblevento.lugar = dbo.tbllugar.idLugar
INNER JOIN dbo.tblcalidadservicio ON dbo.tblcalidadservicio.evento = dbo.tblevento.idEvento
WHERE
dbo.tblevento.status = 2
GO
/****** Object:  Table [dbo].[tblrespuesta]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblrespuesta](
	[idRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[valorRespuesta] [int] NOT NULL,
	[pregunta] [int] NOT NULL,
	[calidadServicio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idRespuesta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[requerimientosSinAsignar]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[requerimientosSinAsignar]

@idEvento int 

AS
BEGIN

SELECT
dbo.tblrequerimientos.idRequerimientos,
dbo.tblrequerimientos.nomRequerimiento,
dbo.tblrequerimientos.cuantificable,
tipo = CASE dbo.tblrequerimientos.cuantificable
WHEN 0 THEN 'No cuantificable'
WHEN 1 THEN 'Cuantificable'
END

FROM
(SELECT * FROM dbo.tblrequerimientoaevento WHERE dbo.tblrequerimientoaevento.evento = @idEvento) AS reqA
RIGHT JOIN dbo.tblrequerimientos ON reqA.requerimiento = dbo.tblrequerimientos.idRequerimientos
WHERE
reqA.requerimiento IS NULL

END
GO
/****** Object:  View [dbo].[vistapromedioeventos]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vistapromedioeventos] AS 
SELECT
Avg(dbo.tblcalidadservicio.promedioCalidad) AS promedioEventos,
dbo.tblcalidadservicio.usuario_calificado AS usuario

FROM
dbo.tblcalidadservicio
WHERE
dbo.tblcalidadservicio.incidente IS NULL
AND dbo.tblcalidadservicio.statusCal_Servicio = 1
GROUP BY
dbo.tblcalidadservicio.usuario_calificado
GO
/****** Object:  StoredProcedure [dbo].[topCincoRecursosMenosUsados]    Script Date: 11/10/2014 12:48:43 ******/
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
/****** Object:  StoredProcedure [dbo].[topCincoRecursosMasUsados]    Script Date: 11/10/2014 12:48:43 ******/
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
/****** Object:  View [dbo].[vistapromedioincidentes]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vistapromedioincidentes] AS 
SELECT
dbo.tblcalidadservicio.usuario_calificado as soporte,
Avg(dbo.tblcalidadservicio.promedioCalidad) AS promedioIncidente

FROM
dbo.tblcalidadservicio
WHERE
dbo.tblcalidadservicio.evento IS NULL
AND
dbo.tblcalidadservicio.statusCal_Servicio = 1
GROUP BY
dbo.tblcalidadservicio.usuario_calificado
GO
/****** Object:  View [dbo].[vistapromediogeneral]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vistapromediogeneral] AS 
SELECT TOP 100
ROW_NUMBER() OVER(ORDER BY (Avg(dbo.tblcalidadservicio.promedioCalidad)) DESC) AS posicion,
dbo.tblusuarios.idUsuario,
dbo.vistapromedioeventos.promedioEventos,
dbo.vistapromedioincidentes.promedioIncidente,
Avg(dbo.tblcalidadservicio.promedioCalidad) AS PromedioTotal

FROM
dbo.tblusuarios
LEFT JOIN dbo.vistapromedioeventos ON dbo.vistapromedioeventos.usuario = dbo.tblusuarios.idUsuario
LEFT JOIN dbo.vistapromedioincidentes ON dbo.vistapromedioincidentes.soporte = dbo.tblusuarios.idUsuario
LEFT JOIN dbo.tblcalidadservicio ON dbo.tblcalidadservicio.usuario_calificado = dbo.tblusuarios.idUsuario
WHERE 
dbo.tblusuarios.tipoUsuario = 0
AND
dbo.tblcalidadservicio.statusCal_Servicio = 1
GROUP BY
dbo.tblusuarios.idUsuario,
dbo.vistapromedioeventos.promedioEventos,
dbo.vistapromedioincidentes.promedioIncidente
GO
/****** Object:  View [dbo].[VistaEncuesta]    Script Date: 11/10/2014 12:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaEncuesta] AS 
SELECT
dbo.VistaPregunta.numPregunta,
dbo.VistaPregunta.idPregunta,
dbo.VistaPregunta.txtPregunta,
dbo.VistaPregunta.statusPregunta,
dbo.VistaPregunta.afinidad,
dbo.tblrespuesta.valorRespuesta,
dbo.tblcalidadservicio.idCalidad_Servicio,
dbo.tblcalidadservicio.observacionesServicio,
dbo.tblcalidadservicio.statusCal_Servicio,
dbo.tblcalidadservicio.incidente,
dbo.tblcalidadservicio.evento

FROM
dbo.VistaPregunta
INNER JOIN dbo.tblrespuesta ON dbo.VistaPregunta.idPregunta = dbo.tblrespuesta.pregunta
INNER JOIN dbo.tblcalidadservicio ON dbo.tblrespuesta.calidadServicio = dbo.tblcalidadservicio.idCalidad_Servicio
GO
/****** Object:  Default [DF__tbltipoeq__siMon__74AE54BC]    Script Date: 11/10/2014 12:48:31 ******/
ALTER TABLE [dbo].[tbltipoequipo] ADD  DEFAULT ((0)) FOR [siMonitor]
GO
/****** Object:  Default [DF__tbltipoeq__siEqu__75A278F5]    Script Date: 11/10/2014 12:48:31 ******/
ALTER TABLE [dbo].[tbltipoequipo] ADD  DEFAULT ((0)) FOR [siEquipo]
GO
/****** Object:  Default [DF__tbltipoeq__siDis__76969D2E]    Script Date: 11/10/2014 12:48:31 ******/
ALTER TABLE [dbo].[tbltipoequipo] ADD  DEFAULT ((0)) FOR [siDiscoDuro]
GO
/****** Object:  Default [DF__tbltipoeq__siMou__778AC167]    Script Date: 11/10/2014 12:48:31 ******/
ALTER TABLE [dbo].[tbltipoequipo] ADD  DEFAULT ((0)) FOR [siMouse]
GO
/****** Object:  Default [DF__tblusuari__exTel__787EE5A0]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblusuarios] ADD  DEFAULT ((0)) FOR [exTel]
GO
/****** Object:  Default [DF__tblrespon__respo__6B24EA82]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblresponsablequipo] ADD  DEFAULT ((1)) FOR [responsable]
GO
/****** Object:  Default [DF__tblrespon__tipoE__6C190EBB]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblresponsablequipo] ADD  DEFAULT ((1)) FOR [tipoEquipo]
GO
/****** Object:  Default [DF__tblrespon__marca__6D0D32F4]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblresponsablequipo] ADD  DEFAULT ((1)) FOR [marcaEquipo]
GO
/****** Object:  Default [DF__tblrespon__serie__6E01572D]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblresponsablequipo] ADD  DEFAULT ((0)) FOR [serieEquipo]
GO
/****** Object:  Default [DF__tblrespon__memor__6EF57B66]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblresponsablequipo] ADD  DEFAULT ((0)) FOR [memoriaRam]
GO
/****** Object:  Default [DF__tblrespon__disco__6FE99F9F]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblresponsablequipo] ADD  DEFAULT ((0)) FOR [discoDuro]
GO
/****** Object:  Default [DF__tblrespon__marca__70DDC3D8]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblresponsablequipo] ADD  DEFAULT ((1)) FOR [marcaMonitor]
GO
/****** Object:  Default [DF__tblrespon__serie__71D1E811]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblresponsablequipo] ADD  DEFAULT ((0)) FOR [serieMonitor]
GO
/****** Object:  Default [DF__tblresponsab__ip__72C60C4A]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblresponsablequipo] ADD  DEFAULT ((0)) FOR [ip]
GO
/****** Object:  Default [DF__tblresponsa__mac__73BA3083]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblresponsablequipo] ADD  DEFAULT ((0)) FOR [mac]
GO
/****** Object:  ForeignKey [coordinacion]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tbldepartamentos]  WITH CHECK ADD  CONSTRAINT [coordinacion] FOREIGN KEY([coordinacion])
REFERENCES [dbo].[tblcoordinacion] ([idCoordinacion])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbldepartamentos] CHECK CONSTRAINT [coordinacion]
GO
/****** Object:  ForeignKey [Institucion]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblusuarios]  WITH CHECK ADD  CONSTRAINT [Institucion] FOREIGN KEY([institucion])
REFERENCES [dbo].[tblinstitucion] ([idInstitucion])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblusuarios] CHECK CONSTRAINT [Institucion]
GO
/****** Object:  ForeignKey [area]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblusuarios]  WITH CHECK ADD  CONSTRAINT [area] FOREIGN KEY([area])
REFERENCES [dbo].[tblarea] ([idArea])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblusuarios] CHECK CONSTRAINT [area]
GO
/****** Object:  ForeignKey [depto]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblusuarios]  WITH CHECK ADD  CONSTRAINT [depto] FOREIGN KEY([depto])
REFERENCES [dbo].[tbldepartamentos] ([idDepto])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblusuarios] CHECK CONSTRAINT [depto]
GO
/****** Object:  ForeignKey [puesto]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblusuarios]  WITH CHECK ADD  CONSTRAINT [puesto] FOREIGN KEY([puesto])
REFERENCES [dbo].[tblpuesto] ([idPuesto])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblusuarios] CHECK CONSTRAINT [puesto]
GO
/****** Object:  ForeignKey [seguimiento]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblincidente]  WITH CHECK ADD  CONSTRAINT [seguimiento] FOREIGN KEY([seguimiento])
REFERENCES [dbo].[tblusuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[tblincidente] CHECK CONSTRAINT [seguimiento]
GO
/****** Object:  ForeignKey [solicitante]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblincidente]  WITH CHECK ADD  CONSTRAINT [solicitante] FOREIGN KEY([solicitante])
REFERENCES [dbo].[tblusuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[tblincidente] CHECK CONSTRAINT [solicitante]
GO
/****** Object:  ForeignKey [soporte]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblincidente]  WITH CHECK ADD  CONSTRAINT [soporte] FOREIGN KEY([soporte])
REFERENCES [dbo].[tblusuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[tblincidente] CHECK CONSTRAINT [soporte]
GO
/****** Object:  ForeignKey [tipo]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblincidente]  WITH CHECK ADD  CONSTRAINT [tipo] FOREIGN KEY([tipo])
REFERENCES [dbo].[tbltipoincidencia] ([idTipoIncidente])
GO
ALTER TABLE [dbo].[tblincidente] CHECK CONSTRAINT [tipo]
GO
/****** Object:  ForeignKey [apoyo]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblevento]  WITH CHECK ADD  CONSTRAINT [apoyo] FOREIGN KEY([apoyo])
REFERENCES [dbo].[tblusuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[tblevento] CHECK CONSTRAINT [apoyo]
GO
/****** Object:  ForeignKey [lugar ]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblevento]  WITH CHECK ADD  CONSTRAINT [lugar ] FOREIGN KEY([lugar])
REFERENCES [dbo].[tbllugar] ([idLugar])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblevento] CHECK CONSTRAINT [lugar ]
GO
/****** Object:  ForeignKey [responsable]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblevento]  WITH CHECK ADD  CONSTRAINT [responsable] FOREIGN KEY([responsable])
REFERENCES [dbo].[tblusuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[tblevento] CHECK CONSTRAINT [responsable]
GO
/****** Object:  ForeignKey [solicitante2]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblevento]  WITH CHECK ADD  CONSTRAINT [solicitante2] FOREIGN KEY([solicitante])
REFERENCES [dbo].[tblusuarios] ([idUsuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblevento] CHECK CONSTRAINT [solicitante2]
GO
/****** Object:  ForeignKey [marcaEquipo]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblresponsablequipo]  WITH CHECK ADD  CONSTRAINT [marcaEquipo] FOREIGN KEY([marcaEquipo])
REFERENCES [dbo].[tblmarca] ([idMarca])
GO
ALTER TABLE [dbo].[tblresponsablequipo] CHECK CONSTRAINT [marcaEquipo]
GO
/****** Object:  ForeignKey [marcaMonitor]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblresponsablequipo]  WITH CHECK ADD  CONSTRAINT [marcaMonitor] FOREIGN KEY([marcaMonitor])
REFERENCES [dbo].[tblmarca] ([idMarca])
GO
ALTER TABLE [dbo].[tblresponsablequipo] CHECK CONSTRAINT [marcaMonitor]
GO
/****** Object:  ForeignKey [marcaMouse]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblresponsablequipo]  WITH CHECK ADD  CONSTRAINT [marcaMouse] FOREIGN KEY([marcaMouse])
REFERENCES [dbo].[tblmarca] ([idMarca])
GO
ALTER TABLE [dbo].[tblresponsablequipo] CHECK CONSTRAINT [marcaMouse]
GO
/****** Object:  ForeignKey [marcaTeclado]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblresponsablequipo]  WITH CHECK ADD  CONSTRAINT [marcaTeclado] FOREIGN KEY([marcaTeclado])
REFERENCES [dbo].[tblmarca] ([idMarca])
GO
ALTER TABLE [dbo].[tblresponsablequipo] CHECK CONSTRAINT [marcaTeclado]
GO
/****** Object:  ForeignKey [respon]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblresponsablequipo]  WITH CHECK ADD  CONSTRAINT [respon] FOREIGN KEY([responsable])
REFERENCES [dbo].[tblusuarios] ([idUsuario])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[tblresponsablequipo] CHECK CONSTRAINT [respon]
GO
/****** Object:  ForeignKey [tipoE]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblresponsablequipo]  WITH CHECK ADD  CONSTRAINT [tipoE] FOREIGN KEY([tipoEquipo])
REFERENCES [dbo].[tbltipoequipo] ([idTipoEquipo])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[tblresponsablequipo] CHECK CONSTRAINT [tipoE]
GO
/****** Object:  ForeignKey [calificado]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblcalidadservicio]  WITH CHECK ADD  CONSTRAINT [calificado] FOREIGN KEY([usuario_calificado])
REFERENCES [dbo].[tblusuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[tblcalidadservicio] CHECK CONSTRAINT [calificado]
GO
/****** Object:  ForeignKey [eventoa]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblcalidadservicio]  WITH CHECK ADD  CONSTRAINT [eventoa] FOREIGN KEY([evento])
REFERENCES [dbo].[tblevento] ([idEvento])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblcalidadservicio] CHECK CONSTRAINT [eventoa]
GO
/****** Object:  ForeignKey [incidente]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblcalidadservicio]  WITH CHECK ADD  CONSTRAINT [incidente] FOREIGN KEY([incidente])
REFERENCES [dbo].[tblincidente] ([numIncidente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblcalidadservicio] CHECK CONSTRAINT [incidente]
GO
/****** Object:  ForeignKey [evento]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblrequerimientoaevento]  WITH CHECK ADD  CONSTRAINT [evento] FOREIGN KEY([evento])
REFERENCES [dbo].[tblevento] ([idEvento])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblrequerimientoaevento] CHECK CONSTRAINT [evento]
GO
/****** Object:  ForeignKey [requerimiento]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblrequerimientoaevento]  WITH CHECK ADD  CONSTRAINT [requerimiento] FOREIGN KEY([requerimiento])
REFERENCES [dbo].[tblrequerimientos] ([idRequerimientos])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblrequerimientoaevento] CHECK CONSTRAINT [requerimiento]
GO
/****** Object:  ForeignKey [pregunta]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblrespuesta]  WITH CHECK ADD  CONSTRAINT [pregunta] FOREIGN KEY([pregunta])
REFERENCES [dbo].[tblpregunta] ([idPregunta])
GO
ALTER TABLE [dbo].[tblrespuesta] CHECK CONSTRAINT [pregunta]
GO
/****** Object:  ForeignKey [servicioCalidad]    Script Date: 11/10/2014 12:48:43 ******/
ALTER TABLE [dbo].[tblrespuesta]  WITH CHECK ADD  CONSTRAINT [servicioCalidad] FOREIGN KEY([calidadServicio])
REFERENCES [dbo].[tblcalidadservicio] ([idCalidad_Servicio])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblrespuesta] CHECK CONSTRAINT [servicioCalidad]
GO
