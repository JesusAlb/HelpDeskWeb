USE [master]
GO
/****** Object:  Database [dbhelpdesk]    Script Date: 11/15/2014 05:30:39 ******/
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
/****** Object:  StoredProcedure [dbo].[promedioCalidadPorUsuarioIn]    Script Date: 11/15/2014 05:30:40 ******/
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
/****** Object:  StoredProcedure [dbo].[promedioCalidadPorUsuarioEv]    Script Date: 11/15/2014 05:30:40 ******/
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
/****** Object:  StoredProcedure [dbo].[promedioCalidadPorTipoIn]    Script Date: 11/15/2014 05:30:40 ******/
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
/****** Object:  StoredProcedure [dbo].[promedioCalidadPorMesIn]    Script Date: 11/15/2014 05:30:40 ******/
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
/****** Object:  StoredProcedure [dbo].[promedioCalidadPorMesEv]    Script Date: 11/15/2014 05:30:40 ******/
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
/****** Object:  StoredProcedure [dbo].[promedioCalidadPorDepto]    Script Date: 11/15/2014 05:30:40 ******/
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
/****** Object:  Table [dbo].[tblcoordinacion]    Script Date: 11/15/2014 05:30:41 ******/
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
/****** Object:  Table [dbo].[tblcalidadservicio]    Script Date: 11/15/2014 05:30:41 ******/
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
/****** Object:  Table [dbo].[tblarea]    Script Date: 11/15/2014 05:30:41 ******/
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
/****** Object:  Table [dbo].[tblrecursos]    Script Date: 11/15/2014 05:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblrecursos](
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
/****** Object:  Table [dbo].[tblpuesto]    Script Date: 11/15/2014 05:30:41 ******/
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
/****** Object:  Table [dbo].[tblpregunta]    Script Date: 11/15/2014 05:30:41 ******/
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
/****** Object:  Table [dbo].[tblmarca]    Script Date: 11/15/2014 05:30:41 ******/
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
/****** Object:  Table [dbo].[tbllugar]    Script Date: 11/15/2014 05:30:41 ******/
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
/****** Object:  Table [dbo].[tblinstitucion]    Script Date: 11/15/2014 05:30:41 ******/
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
/****** Object:  Table [dbo].[tbltipoincidencia]    Script Date: 11/15/2014 05:30:41 ******/
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
/****** Object:  Table [dbo].[tbltipoequipo]    Script Date: 11/15/2014 05:30:41 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_requerimientos_sin_asignar]    Script Date: 11/15/2014 05:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_requerimientos_sin_asignar]

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
/****** Object:  StoredProcedure [dbo].[numIncidentesPorDepto]    Script Date: 11/15/2014 05:30:41 ******/
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
/****** Object:  StoredProcedure [dbo].[numEventosPorUsuario]    Script Date: 11/15/2014 05:30:41 ******/
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
/****** Object:  Table [dbo].[tbldepartamentos]    Script Date: 11/15/2014 05:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbldepartamentos](
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
/****** Object:  Table [dbo].[tblrespuesta]    Script Date: 11/15/2014 05:30:41 ******/
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
/****** Object:  View [dbo].[vt_preguntas]    Script Date: 11/15/2014 05:30:42 ******/
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
/****** Object:  Table [dbo].[tblusuarios]    Script Date: 11/15/2014 05:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblusuarios](
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
/****** Object:  View [dbo].[vt_encuestas]    Script Date: 11/15/2014 05:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_encuestas] AS 
SELECT
dbo.vt_preguntas.numero as numero_pregunta,
dbo.vt_preguntas.id as idpregunta,
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
/****** Object:  View [dbo].[vt_departamentos]    Script Date: 11/15/2014 05:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_departamentos] AS 
SELECT
dbo.tbldepartamentos.id,
dbo.tbldepartamentos.nombre,
dbo.tblcoordinacion.nombre as nom_coordinacion

FROM
dbo.tbldepartamentos,dbo.tblcoordinacion
WHERE
dbo.tbldepartamentos.fk_idcoordinacion = dbo.tblcoordinacion.id
GO
/****** Object:  Table [dbo].[tblservicio]    Script Date: 11/15/2014 05:30:42 ******/
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
/****** Object:  Table [dbo].[tblequiposasignados]    Script Date: 11/15/2014 05:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblequiposasignados](
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
/****** Object:  View [dbo].[vt_usuarios]    Script Date: 11/15/2014 05:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_usuarios] AS 
SELECT
dbo.tblusuarios.id,
dbo.tblusuarios.nombre_usuario,
(dbo.tblusuarios.nombre + ' ' + dbo.tblusuarios.apellidos) as nomCompleto,
dbo.tblusuarios.password,
tipoUsuarioString = CASE dbo.tblusuarios.tipo
WHEN 0 THEN 'Soporte'
WHEN 1 THEN 'Solicitante'
ELSE 'S/N'
END,
dbo.tblusuarios.extension_telefonica,
dbo.tbldepartamentos.nomDepto as nomDepto,
dbo.tblcoordinacion.nomCoordinacion,
dbo.tblarea.nombre as nomArea,
dbo.tblpuesto.nombre as nomPuesto,
dbo.tblusuarios.tipo,
dbo.tblusuarios.correo,
dbo.tblinstitucion.nombre nomInstitucion

FROM
dbo.tblusuarios
INNER JOIN dbo.tbldepartamentos ON dbo.tbldepartamentos.idDepto = dbo.tblusuarios.fk_iddepto
INNER JOIN dbo.tblcoordinacion ON dbo.tblcoordinacion.idCoordinacion = dbo.tbldepartamentos.coordinacion
INNER JOIN dbo.tblarea ON dbo.tblusuarios.fk_idarea = dbo.tblarea.id
INNER JOIN dbo.tblpuesto ON dbo.tblpuesto.id = dbo.tblusuarios.fk_idpuesto
INNER JOIN dbo.tblinstitucion ON dbo.tblusuarios.fk_idinstitucion = dbo.tblinstitucion.id
WHERE
dbo.tbldepartamentos.coordinacion = dbo.tblcoordinacion.idCoordinacion AND
dbo.tblusuarios.fk_iddepto = dbo.tbldepartamentos.idDepto
GO
/****** Object:  View [dbo].[vt_equipos]    Script Date: 11/15/2014 05:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_equipos] AS 
SELECT
dbo.tblequiposasignados.id,
dbo.tblusuarios.nombre + ' ' + dbo.tblusuarios.apellidos as nombre_completo,
dbo.tbltipoequipo.nombre as nomTipoEquipo,
MarcaEquipo.nombre AS nomMarcaEquipo,
dbo.tblequiposasignados.serie_equipo,
dbo.tblequiposasignados.ram as memoriaRam,
dbo.tblequiposasignados.disco_duro,
MarcaMonitor.nombre AS nomMarcaMonitor,
dbo.tblequiposasignados.serie_monitor,
dbo.tblequiposasignados.ip,
dbo.tblequiposasignados.mac,
MarcaMouse.nombre AS nomMarcaMouse,
dbo.tblequiposasignados.serie_mouse,
MarcaTeclado.nombre AS nomMarcaTeclado,
dbo.tblequiposasignados.serie_teclado,
dbo.tblequiposasignados.procesador

FROM
dbo.tblequiposasignados
INNER JOIN dbo.tblusuarios ON dbo.tblequiposasignados.fk_idusuario_responsable = dbo.tblusuarios.id
INNER JOIN dbo.tbltipoequipo ON dbo.tblequiposasignados.fk_tipoequipo = dbo.tbltipoequipo.id
INNER JOIN dbo.tblmarca AS MarcaEquipo ON dbo.tblequiposasignados.fk_idmarca_equipo = MarcaEquipo.id
INNER JOIN dbo.tblmarca AS MarcaMonitor ON dbo.tblequiposasignados.fk_idmarca_monitor = MarcaMonitor.id
INNER JOIN dbo.tblmarca AS MarcaMouse ON dbo.tblequiposasignados.fk_idmarca_mouse = MarcaMouse.id
INNER JOIN dbo.tblmarca AS MarcaTeclado ON dbo.tblequiposasignados.fk_idmarca_teclado = MarcaTeclado.id
GO
/****** Object:  View [dbo].[vt_reporte_equipos]    Script Date: 11/15/2014 05:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_reporte_equipos] AS 
SELECT
dbo.tblequiposasignados.id,
dbo.tbltipoequipo.nombre as nomTipoEquipo,
MarcaEquipo.nombre AS nomMarcaEquipo,
dbo.tblequiposasignados.serie_equipo,
dbo.tblequiposasignados.ram as memoriaRam,
dbo.tblequiposasignados.disco_duro,
MarcaMonitor.nombre AS nomMarcaMonitor,
dbo.tblequiposasignados.serie_monitor,
dbo.tblequiposasignados.ip,
dbo.tblequiposasignados.mac,
MarcaMouse.nombre AS nomMarcaMouse,
dbo.tblequiposasignados.serie_mouse,
MarcaTeclado.nombre AS nomMarcaTeclado,
dbo.tblequiposasignados.serie_teclado,
dbo.tblequiposasignados.procesador,
dbo.vt_usuarios.nomCompleto,
dbo.vt_usuarios.nomArea,
dbo.vt_usuarios.nomCoordinacion,
dbo.vt_usuarios.nomDepto,
dbo.vt_usuarios.nomPuesto

FROM
dbo.tblequiposasignados
INNER JOIN dbo.vt_usuarios ON dbo.tblequiposasignados.fk_idusuario_responsable = dbo.vt_usuarios.id
INNER JOIN dbo.tbltipoequipo ON dbo.tblequiposasignados.fk_tipoequipo = dbo.tbltipoequipo.id
INNER JOIN dbo.tblmarca AS MarcaEquipo ON dbo.tblequiposasignados.fk_idmarca_equipo = MarcaEquipo.id
INNER JOIN dbo.tblmarca AS MarcaMonitor ON dbo.tblequiposasignados.fk_idmarca_monitor = MarcaMonitor.id
INNER JOIN dbo.tblmarca AS MarcaMouse ON dbo.tblequiposasignados.fk_idmarca_mouse = MarcaMouse.id
INNER JOIN dbo.tblmarca AS MarcaTeclado ON dbo.tblequiposasignados.fk_idmarca_teclado = MarcaTeclado.id
GO
/****** Object:  Table [dbo].[tblincidente]    Script Date: 11/15/2014 05:30:42 ******/
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
/****** Object:  Table [dbo].[tblevento]    Script Date: 11/15/2014 05:30:42 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_insertar_incidente]    Script Date: 11/15/2014 05:30:42 ******/
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
			DECLARE @idUserNA INT = (SELECT tblusuarios.id FROM tblusuarios WHERE tblusuarios.nombre_usuario = 'S/A');
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
/****** Object:  StoredProcedure [dbo].[sp_insertar_evento]    Script Date: 11/15/2014 05:30:42 ******/
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

		DECLARE @idUserNA INT = (SELECT tblusuarios.id FROM tblusuarios WHERE tblusuarios.nombre_usuario = 'S/A')

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
/****** Object:  StoredProcedure [dbo].[sp_cerrar_incidente]    Script Date: 11/15/2014 05:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_cerrar_incidente]

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
/****** Object:  StoredProcedure [dbo].[sp_cerrar_evento]    Script Date: 11/15/2014 05:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_cerrar_evento]

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
/****** Object:  StoredProcedure [dbo].[numIncidentesPorUsuario]    Script Date: 11/15/2014 05:30:42 ******/
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
/****** Object:  StoredProcedure [dbo].[numIncidentesPorTipo]    Script Date: 11/15/2014 05:30:42 ******/
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
/****** Object:  StoredProcedure [dbo].[numIncidentesPorMes]    Script Date: 11/15/2014 05:30:42 ******/
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
/****** Object:  StoredProcedure [dbo].[ReqAsignados]    Script Date: 11/15/2014 05:30:42 ******/
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
/****** Object:  Table [dbo].[tblrecursosasingados]    Script Date: 11/15/2014 05:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblrecursosasingados](
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
/****** Object:  StoredProcedure [dbo].[numEventosPorMes]    Script Date: 11/15/2014 05:30:42 ******/
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
/****** Object:  View [dbo].[vt_incidente]    Script Date: 11/15/2014 05:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_incidente] AS 
SELECT
dbo.tblincidente.id,
dbo.tblincidente.tipo,
dbo.tblincidente.prioridad,
dbo.tblincidente.acciones,
dbo.tblincidente.solucion,
dbo.tblservicio.fk_idusuario_solicitante as idsolicitante,
dbo.tblservicio.fk_idusuario_soporte as idsoporte,
dbo.tblservicio.fk_idusuario_apoyo as idapoyo,
dbo.tblservicio.fecha_solicitud,
dbo.tblservicio.fecha_cierre,
dbo.tblservicio.hora_inicial,
dbo.tblservicio.hora_final,
dbo.tblservicio.estatus as estatus_evento,
us_solicitante.nombre +' '+ us_solicitante.apellidos AS solicitante,
us_soporte.nombre_usuario as soporte,
us_apoyo.nombre_usuario as apoyo,
dbo.tblincidente.fk_idservicio as idservicio,
dbo.tblcalidadservicio.id as idcalidad,
dbo.tblcalidadservicio.estatus as estatus_calidad,
dbo.tblcalidadservicio.observaciones as observacion_calidad,
dbo.tblcalidadservicio.promedio as promedio_calidad


FROM
dbo.tblservicio
INNER JOIN dbo.tblincidente ON dbo.tblservicio.id = dbo.tblincidente.fk_idservicio
INNER JOIN dbo.tblusuarios AS us_solicitante ON us_solicitante.id = dbo.tblservicio.fk_idusuario_solicitante
INNER JOIN dbo.tblusuarios AS us_soporte ON us_soporte.id = dbo.tblservicio.fk_idusuario_soporte
INNER JOIN dbo.tblusuarios AS us_apoyo ON us_apoyo.id = dbo.tblservicio.fk_idusuario_apoyo
INNER JOIN dbo.tbltipoincidencia ON dbo.tbltipoincidencia.id = dbo.tblincidente.tipo
FULL OUTER JOIN dbo.tblcalidadservicio ON dbo.tblcalidadservicio.fk_idservicio = dbo.tblservicio.id
GO
/****** Object:  View [dbo].[vt_eventos]    Script Date: 11/15/2014 05:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_eventos] AS 
SELECT
dbo.tblevento.id,
dbo.tblevento.nombre,
dbo.tblservicio.descripcion,
dbo.tblservicio.fk_idusuario_solicitante as idsolicitante,
dbo.tblservicio.fk_idusuario_soporte as idsoporte,
dbo.tblservicio.fk_idusuario_apoyo as idapoyo,
dbo.tblservicio.fecha_solicitud,
dbo.tblservicio.fecha_cierre,
dbo.tblservicio.hora_inicial,
dbo.tblservicio.hora_final,
dbo.tblservicio.estatus as estatus_evento,
us_solicitante.nombre +' '+ us_solicitante.apellidos AS solicitante,
us_soporte.nombre_usuario as soporte,
us_apoyo.nombre_usuario as apoyo,
dbo.tblevento.tipo,
dbo.tbllugar.nombre AS lugar,
dbo.tblevento.asistencia,
dbo.tblevento.acomodo,
dbo.tblevento.fecha_realizacion,
dbo.tblevento.observacion as observacion_evento,
dbo.tblevento.fk_idservicio as idservicio,
dbo.tblcalidadservicio.id as idcalidad,
dbo.tblcalidadservicio.estatus as estatus_calidad,
dbo.tblcalidadservicio.observaciones as observacion_calidad,
dbo.tblcalidadservicio.promedio as promedio_calidad


FROM
dbo.tblservicio
INNER JOIN dbo.tblevento ON dbo.tblservicio.id = dbo.tblevento.fk_idservicio
INNER JOIN dbo.tblusuarios AS us_solicitante ON us_solicitante.id = dbo.tblservicio.fk_idusuario_solicitante
INNER JOIN dbo.tblusuarios AS us_soporte ON us_soporte.id = dbo.tblservicio.fk_idusuario_soporte
INNER JOIN dbo.tblusuarios AS us_apoyo ON us_apoyo.id = dbo.tblservicio.fk_idusuario_apoyo
INNER JOIN dbo.tbllugar ON dbo.tbllugar.id = dbo.tblevento.fk_idlugar
FULL OUTER JOIN dbo.tblcalidadservicio ON dbo.tblcalidadservicio.fk_idservicio = dbo.tblservicio.id
GO
/****** Object:  StoredProcedure [dbo].[topCincoRecursosMenosUsados]    Script Date: 11/15/2014 05:30:42 ******/
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
/****** Object:  StoredProcedure [dbo].[topCincoRecursosMasUsados]    Script Date: 11/15/2014 05:30:42 ******/
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
/****** Object:  View [dbo].[vt_promedio_eventos]    Script Date: 11/15/2014 05:30:42 ******/
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
/****** Object:  View [dbo].[vt_promedio_incidentes]    Script Date: 11/15/2014 05:30:42 ******/
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
INNER JOIN dbo.tblincidente ON dbo.tblincidente.fk_idservicio = dbo.tblcalidadservicio.fk_idservicio
INNER JOIN dbo.tblservicio ON dbo.tblservicio.id = dbo.tblcalidadservicio.fk_idservicio
WHERE
dbo.tblcalidadservicio.estatus = 1
GROUP BY
dbo.tblservicio.fk_idusuario_soporte
GO
/****** Object:  View [dbo].[vt_requerimientos_asignados]    Script Date: 11/15/2014 05:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_requerimientos_asignados] AS 
SELECT
dbo.tblrecursosasingados.fk_idevento as idevento,
dbo.vt_eventos.solicitante,
dbo.tblrecursosasingados.cantidad,
dbo.vt_eventos.asistencia,
dbo.vt_eventos.tipo,
dbo.vt_eventos.acomodo,
dbo.vt_eventos.hora_inicial,
dbo.vt_eventos.hora_final,
dbo.vt_eventos.fecha_realizacion,
dbo.vt_eventos.observacion_evento,
dbo.vt_eventos.nombre as nom_evento,
dbo.vt_eventos.lugar,
dbo.vt_usuarios.nomCoordinacion,
dbo.tblrecursos.nombre as nom_recurso,
dbo.tblrecursos.id

FROM
dbo.tblrecursosasingados
INNER JOIN dbo.vt_eventos ON dbo.vt_eventos.id = dbo.tblrecursosasingados.fk_idevento
INNER JOIN dbo.tblrecursos ON dbo.tblrecursos.id = dbo.tblrecursosasingados.fk_idrequerimiento
INNER JOIN dbo.vt_usuarios ON dbo.vt_usuarios.id = dbo.vt_eventos.solicitante
GO
/****** Object:  View [dbo].[vt_promedio_general]    Script Date: 11/15/2014 05:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vt_promedio_general] AS 
SELECT TOP 100
ROW_NUMBER() OVER(ORDER BY (Avg(dbo.tblcalidadservicio.promedio)) DESC) AS posicion,
dbo.tblusuarios.id,
dbo.vt_promedio_eventos.promedio_evento,
dbo.vt_promedio_incidentes.promedio_incidente,
Avg(dbo.tblcalidadservicio.promedio) AS PromedioTotal

FROM
dbo.tblcalidadservicio
LEFT JOIN dbo.tblservicio ON dbo.tblservicio.id = dbo.tblcalidadservicio.fk_idservicio
LEFT JOIN dbo.vt_promedio_eventos ON dbo.vt_promedio_eventos.soporte = dbo.tblservicio.id
LEFT JOIN dbo.vt_promedio_incidentes ON dbo.vt_promedio_incidentes.soporte = dbo.tblservicio.id
RIGHT OUTER JOIN dbo.tblusuarios ON dbo.tblusuarios.id = dbo.tblservicio.fk_idusuario_solicitante
WHERE 
dbo.tblusuarios.tipo = 0
GROUP BY
dbo.tblusuarios.id,
dbo.vt_promedio_eventos.promedio_evento,
dbo.vt_promedio_incidentes.promedio_incidente
GO
/****** Object:  Default [DF__tbltipoeq__siMon__74AE54BC]    Script Date: 11/15/2014 05:30:41 ******/
ALTER TABLE [dbo].[tbltipoequipo] ADD  DEFAULT ((0)) FOR [monitor]
GO
/****** Object:  Default [DF__tbltipoeq__siEqu__75A278F5]    Script Date: 11/15/2014 05:30:41 ******/
ALTER TABLE [dbo].[tbltipoequipo] ADD  DEFAULT ((0)) FOR [equipo]
GO
/****** Object:  Default [DF__tbltipoeq__siDis__76969D2E]    Script Date: 11/15/2014 05:30:41 ******/
ALTER TABLE [dbo].[tbltipoequipo] ADD  DEFAULT ((0)) FOR [disco_duro]
GO
/****** Object:  Default [DF__tbltipoeq__siMou__778AC167]    Script Date: 11/15/2014 05:30:41 ******/
ALTER TABLE [dbo].[tbltipoequipo] ADD  DEFAULT ((0)) FOR [mouse]
GO
/****** Object:  Default [DF__tblusuari__exTel__787EE5A0]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblusuarios] ADD  DEFAULT ((0)) FOR [extension_telefonica]
GO
/****** Object:  Default [DF__tblrespon__respo__6B24EA82]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblequiposasignados] ADD  DEFAULT ((1)) FOR [fk_idusuario_responsable]
GO
/****** Object:  Default [DF__tblrespon__tipoE__6C190EBB]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblequiposasignados] ADD  DEFAULT ((1)) FOR [fk_tipoequipo]
GO
/****** Object:  Default [DF__tblrespon__marca__6D0D32F4]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblequiposasignados] ADD  DEFAULT ((1)) FOR [fk_idmarca_equipo]
GO
/****** Object:  Default [DF__tblrespon__serie__6E01572D]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblequiposasignados] ADD  DEFAULT ((0)) FOR [serie_equipo]
GO
/****** Object:  Default [DF__tblrespon__memor__6EF57B66]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblequiposasignados] ADD  DEFAULT ((0)) FOR [ram]
GO
/****** Object:  Default [DF__tblrespon__disco__6FE99F9F]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblequiposasignados] ADD  DEFAULT ((0)) FOR [disco_duro]
GO
/****** Object:  Default [DF__tblrespon__marca__70DDC3D8]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblequiposasignados] ADD  DEFAULT ((1)) FOR [fk_idmarca_monitor]
GO
/****** Object:  Default [DF__tblrespon__serie__71D1E811]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblequiposasignados] ADD  DEFAULT ((0)) FOR [serie_monitor]
GO
/****** Object:  Default [DF__tblresponsab__ip__72C60C4A]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblequiposasignados] ADD  DEFAULT ((0)) FOR [ip]
GO
/****** Object:  Default [DF__tblresponsa__mac__73BA3083]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblequiposasignados] ADD  DEFAULT ((0)) FOR [mac]
GO
/****** Object:  ForeignKey [fk_coordinacion]    Script Date: 11/15/2014 05:30:41 ******/
ALTER TABLE [dbo].[tbldepartamentos]  WITH CHECK ADD  CONSTRAINT [fk_coordinacion] FOREIGN KEY([fk_idcoordinacion])
REFERENCES [dbo].[tblcoordinacion] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbldepartamentos] CHECK CONSTRAINT [fk_coordinacion]
GO
/****** Object:  ForeignKey [fk_calidad]    Script Date: 11/15/2014 05:30:41 ******/
ALTER TABLE [dbo].[tblrespuesta]  WITH CHECK ADD  CONSTRAINT [fk_calidad] FOREIGN KEY([fk_idcalidad])
REFERENCES [dbo].[tblcalidadservicio] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblrespuesta] CHECK CONSTRAINT [fk_calidad]
GO
/****** Object:  ForeignKey [fk_pregunta]    Script Date: 11/15/2014 05:30:41 ******/
ALTER TABLE [dbo].[tblrespuesta]  WITH CHECK ADD  CONSTRAINT [fk_pregunta] FOREIGN KEY([fk_idpregunta])
REFERENCES [dbo].[tblpregunta] ([id])
GO
ALTER TABLE [dbo].[tblrespuesta] CHECK CONSTRAINT [fk_pregunta]
GO
/****** Object:  ForeignKey [fk_area]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblusuarios]  WITH CHECK ADD  CONSTRAINT [fk_area] FOREIGN KEY([fk_idarea])
REFERENCES [dbo].[tblarea] ([id])
GO
ALTER TABLE [dbo].[tblusuarios] CHECK CONSTRAINT [fk_area]
GO
/****** Object:  ForeignKey [fk_depto]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblusuarios]  WITH CHECK ADD  CONSTRAINT [fk_depto] FOREIGN KEY([fk_iddepto])
REFERENCES [dbo].[tbldepartamentos] ([id])
GO
ALTER TABLE [dbo].[tblusuarios] CHECK CONSTRAINT [fk_depto]
GO
/****** Object:  ForeignKey [fk_institucion]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblusuarios]  WITH CHECK ADD  CONSTRAINT [fk_institucion] FOREIGN KEY([fk_idinstitucion])
REFERENCES [dbo].[tblinstitucion] ([id])
GO
ALTER TABLE [dbo].[tblusuarios] CHECK CONSTRAINT [fk_institucion]
GO
/****** Object:  ForeignKey [fk_puesto]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblusuarios]  WITH CHECK ADD  CONSTRAINT [fk_puesto] FOREIGN KEY([fk_idpuesto])
REFERENCES [dbo].[tblpuesto] ([id])
GO
ALTER TABLE [dbo].[tblusuarios] CHECK CONSTRAINT [fk_puesto]
GO
/****** Object:  ForeignKey [fk_idapoyo]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblservicio]  WITH CHECK ADD  CONSTRAINT [fk_idapoyo] FOREIGN KEY([fk_idusuario_apoyo])
REFERENCES [dbo].[tblusuarios] ([id])
GO
ALTER TABLE [dbo].[tblservicio] CHECK CONSTRAINT [fk_idapoyo]
GO
/****** Object:  ForeignKey [fk_idsolicitante]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblservicio]  WITH CHECK ADD  CONSTRAINT [fk_idsolicitante] FOREIGN KEY([fk_idusuario_solicitante])
REFERENCES [dbo].[tblusuarios] ([id])
GO
ALTER TABLE [dbo].[tblservicio] CHECK CONSTRAINT [fk_idsolicitante]
GO
/****** Object:  ForeignKey [fk_idsoporte]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblservicio]  WITH CHECK ADD  CONSTRAINT [fk_idsoporte] FOREIGN KEY([fk_idusuario_soporte])
REFERENCES [dbo].[tblusuarios] ([id])
GO
ALTER TABLE [dbo].[tblservicio] CHECK CONSTRAINT [fk_idsoporte]
GO
/****** Object:  ForeignKey [fk_marca_equipo]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblequiposasignados]  WITH NOCHECK ADD  CONSTRAINT [fk_marca_equipo] FOREIGN KEY([fk_idmarca_equipo])
REFERENCES [dbo].[tblmarca] ([id])
GO
ALTER TABLE [dbo].[tblequiposasignados] NOCHECK CONSTRAINT [fk_marca_equipo]
GO
/****** Object:  ForeignKey [fk_marca_monitor]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblequiposasignados]  WITH CHECK ADD  CONSTRAINT [fk_marca_monitor] FOREIGN KEY([fk_idmarca_monitor])
REFERENCES [dbo].[tblmarca] ([id])
GO
ALTER TABLE [dbo].[tblequiposasignados] CHECK CONSTRAINT [fk_marca_monitor]
GO
/****** Object:  ForeignKey [fk_marca_mouse]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblequiposasignados]  WITH CHECK ADD  CONSTRAINT [fk_marca_mouse] FOREIGN KEY([fk_idmarca_mouse])
REFERENCES [dbo].[tblmarca] ([id])
GO
ALTER TABLE [dbo].[tblequiposasignados] CHECK CONSTRAINT [fk_marca_mouse]
GO
/****** Object:  ForeignKey [fk_marca_teclado]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblequiposasignados]  WITH CHECK ADD  CONSTRAINT [fk_marca_teclado] FOREIGN KEY([fk_idmarca_teclado])
REFERENCES [dbo].[tblmarca] ([id])
GO
ALTER TABLE [dbo].[tblequiposasignados] CHECK CONSTRAINT [fk_marca_teclado]
GO
/****** Object:  ForeignKey [fk_tipo_equipo]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblequiposasignados]  WITH CHECK ADD  CONSTRAINT [fk_tipo_equipo] FOREIGN KEY([fk_tipoequipo])
REFERENCES [dbo].[tbltipoequipo] ([id])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[tblequiposasignados] CHECK CONSTRAINT [fk_tipo_equipo]
GO
/****** Object:  ForeignKey [fk_usuario_responsable]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblequiposasignados]  WITH CHECK ADD  CONSTRAINT [fk_usuario_responsable] FOREIGN KEY([fk_idusuario_responsable])
REFERENCES [dbo].[tblusuarios] ([id])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[tblequiposasignados] CHECK CONSTRAINT [fk_usuario_responsable]
GO
/****** Object:  ForeignKey [fk_idservicio_incidente]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblincidente]  WITH CHECK ADD  CONSTRAINT [fk_idservicio_incidente] FOREIGN KEY([fk_idservicio])
REFERENCES [dbo].[tblservicio] ([id])
GO
ALTER TABLE [dbo].[tblincidente] CHECK CONSTRAINT [fk_idservicio_incidente]
GO
/****** Object:  ForeignKey [fk_tipo]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblincidente]  WITH CHECK ADD  CONSTRAINT [fk_tipo] FOREIGN KEY([tipo])
REFERENCES [dbo].[tbltipoincidencia] ([id])
GO
ALTER TABLE [dbo].[tblincidente] CHECK CONSTRAINT [fk_tipo]
GO
/****** Object:  ForeignKey [fk_idservicio]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblevento]  WITH CHECK ADD  CONSTRAINT [fk_idservicio] FOREIGN KEY([fk_idservicio])
REFERENCES [dbo].[tblservicio] ([id])
GO
ALTER TABLE [dbo].[tblevento] CHECK CONSTRAINT [fk_idservicio]
GO
/****** Object:  ForeignKey [fk_lugar]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblevento]  WITH CHECK ADD  CONSTRAINT [fk_lugar] FOREIGN KEY([fk_idlugar])
REFERENCES [dbo].[tbllugar] ([id])
GO
ALTER TABLE [dbo].[tblevento] CHECK CONSTRAINT [fk_lugar]
GO
/****** Object:  ForeignKey [fk_evento_en_uso]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblrecursosasingados]  WITH CHECK ADD  CONSTRAINT [fk_evento_en_uso] FOREIGN KEY([fk_idevento])
REFERENCES [dbo].[tblevento] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblrecursosasingados] CHECK CONSTRAINT [fk_evento_en_uso]
GO
/****** Object:  ForeignKey [fk_recurso_asignado]    Script Date: 11/15/2014 05:30:42 ******/
ALTER TABLE [dbo].[tblrecursosasingados]  WITH CHECK ADD  CONSTRAINT [fk_recurso_asignado] FOREIGN KEY([fk_idrequerimiento])
REFERENCES [dbo].[tblrecursos] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblrecursosasingados] CHECK CONSTRAINT [fk_recurso_asignado]
GO
