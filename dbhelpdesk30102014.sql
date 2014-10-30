/*
Navicat SQL Server Data Transfer

Source Server         : LocalSQL
Source Server Version : 100000
Source Host           : JESÚSOCAÑA-HP:1433
Source Database       : dbhelpdesk
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 100000
File Encoding         : 65001

Date: 2014-10-30 10:19:00
*/


-- ----------------------------
-- Table structure for [dbo].[tblarea]
-- ----------------------------
DROP TABLE [dbo].[tblarea]
GO
CREATE TABLE [dbo].[tblarea] (
[idArea] int NOT NULL IDENTITY(1,1) ,
[nomArea] varchar(50) NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tblarea]', RESEED, 10)
GO

-- ----------------------------
-- Records of tblarea
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblarea] ON
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'1', N'Biblioteca digital');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'2', N'Recepción ochenta');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'9', N'Salón de Música');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'4', N'Salón de la ciencia');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'6', N'Sustentabilidad');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'3', N'Taller de innovación');
GO
SET IDENTITY_INSERT [dbo].[tblarea] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[tblcalidadservicio]
-- ----------------------------
DROP TABLE [dbo].[tblcalidadservicio]
GO
CREATE TABLE [dbo].[tblcalidadservicio] (
[idCalidad_Servicio] int NOT NULL IDENTITY(1,1) ,
[observacionesServicio] varchar(200) NOT NULL ,
[incidente] int NULL ,
[statusCal_Servicio] bit NOT NULL ,
[evento] int NULL ,
[promedioCalidad] float(53) NULL ,
[usuario_calificado] int NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tblcalidadservicio]', RESEED, 83)
GO

-- ----------------------------
-- Records of tblcalidadservicio
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblcalidadservicio] ON
GO
INSERT INTO [dbo].[tblcalidadservicio] ([idCalidad_Servicio], [observacionesServicio], [incidente], [statusCal_Servicio], [evento], [promedioCalidad], [usuario_calificado]) VALUES (N'78', N'Muy maaal', null, N'1', N'68', N'2.33333325386047', N'5');
GO
INSERT INTO [dbo].[tblcalidadservicio] ([idCalidad_Servicio], [observacionesServicio], [incidente], [statusCal_Servicio], [evento], [promedioCalidad], [usuario_calificado]) VALUES (N'79', N'', N'57', N'1', null, N'6.66666650772095', N'5');
GO
INSERT INTO [dbo].[tblcalidadservicio] ([idCalidad_Servicio], [observacionesServicio], [incidente], [statusCal_Servicio], [evento], [promedioCalidad], [usuario_calificado]) VALUES (N'80', N'My bien', N'58', N'1', null, N'6.33333349227905', N'22');
GO
INSERT INTO [dbo].[tblcalidadservicio] ([idCalidad_Servicio], [observacionesServicio], [incidente], [statusCal_Servicio], [evento], [promedioCalidad], [usuario_calificado]) VALUES (N'81', N'Muy buen servicio', null, N'1', N'66', N'9.66666698455811', N'16');
GO
INSERT INTO [dbo].[tblcalidadservicio] ([idCalidad_Servicio], [observacionesServicio], [incidente], [statusCal_Servicio], [evento], [promedioCalidad], [usuario_calificado]) VALUES (N'82', N'', N'59', N'1', null, N'10', N'5');
GO
INSERT INTO [dbo].[tblcalidadservicio] ([idCalidad_Servicio], [observacionesServicio], [incidente], [statusCal_Servicio], [evento], [promedioCalidad], [usuario_calificado]) VALUES (N'83', N'Muy bien', N'60', N'1', null, N'10', N'5');
GO
SET IDENTITY_INSERT [dbo].[tblcalidadservicio] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[tblcoordinacion]
-- ----------------------------
DROP TABLE [dbo].[tblcoordinacion]
GO
CREATE TABLE [dbo].[tblcoordinacion] (
[idCoordinacion] int NOT NULL IDENTITY(1,1) ,
[nomCoordinacion] varchar(45) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tblcoordinacion]', RESEED, 13)
GO

-- ----------------------------
-- Records of tblcoordinacion
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblcoordinacion] ON
GO
INSERT INTO [dbo].[tblcoordinacion] ([idCoordinacion], [nomCoordinacion]) VALUES (N'13', N'Centro de desarrollo v2');
GO
INSERT INTO [dbo].[tblcoordinacion] ([idCoordinacion], [nomCoordinacion]) VALUES (N'1', N'Desarrollo e innovación tecnológica');
GO
INSERT INTO [dbo].[tblcoordinacion] ([idCoordinacion], [nomCoordinacion]) VALUES (N'3', N'Educación y tecnología');
GO
INSERT INTO [dbo].[tblcoordinacion] ([idCoordinacion], [nomCoordinacion]) VALUES (N'5', N'Investigación y sustentabilidad');
GO
INSERT INTO [dbo].[tblcoordinacion] ([idCoordinacion], [nomCoordinacion]) VALUES (N'7', N'Prueba');
GO
INSERT INTO [dbo].[tblcoordinacion] ([idCoordinacion], [nomCoordinacion]) VALUES (N'9', N'Prueba II');
GO
INSERT INTO [dbo].[tblcoordinacion] ([idCoordinacion], [nomCoordinacion]) VALUES (N'10', N'Prueba III');
GO
INSERT INTO [dbo].[tblcoordinacion] ([idCoordinacion], [nomCoordinacion]) VALUES (N'11', N'Prueba ochenta');
GO
INSERT INTO [dbo].[tblcoordinacion] ([idCoordinacion], [nomCoordinacion]) VALUES (N'4', N'Servicios administrativos');
GO
INSERT INTO [dbo].[tblcoordinacion] ([idCoordinacion], [nomCoordinacion]) VALUES (N'6', N'Servicios escolares');
GO
INSERT INTO [dbo].[tblcoordinacion] ([idCoordinacion], [nomCoordinacion]) VALUES (N'12', N'localhost');
GO
SET IDENTITY_INSERT [dbo].[tblcoordinacion] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[tbldepartamentos]
-- ----------------------------
DROP TABLE [dbo].[tbldepartamentos]
GO
CREATE TABLE [dbo].[tbldepartamentos] (
[idDepto] int NOT NULL IDENTITY(1,1) ,
[nomDepto] varchar(40) NOT NULL ,
[coordinacion] int NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tbldepartamentos]', RESEED, 8)
GO

-- ----------------------------
-- Records of tbldepartamentos
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tbldepartamentos] ON
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'1', N'Desarrollo tecnológico', N'1');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'2', N'Prueba ochocientos', N'7');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'3', N'Prueba', N'3');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'4', N'Hola mundo II', N'3');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'5', N'Sustentabilidad', N'5');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'6', N'Recursos Humanos', N'4');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'7', N'PruebaReal', N'3');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'8', N'Prueba III ', N'1');
GO
SET IDENTITY_INSERT [dbo].[tbldepartamentos] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[tblevento]
-- ----------------------------
DROP TABLE [dbo].[tblevento]
GO
CREATE TABLE [dbo].[tblevento] (
[idEvento] int NOT NULL IDENTITY(1,1) ,
[descripcion] varchar(200) NOT NULL ,
[solicitante] int NOT NULL ,
[responsable] int NOT NULL ,
[apoyo] int NOT NULL ,
[fecha_Sol] datetime NULL ,
[lugar] int NULL ,
[asistencia_aprox] int NULL ,
[tipo_evento] varchar(25) NULL ,
[acomodo] varchar(25) NULL ,
[horaIn] datetime NULL ,
[horaFn] datetime NULL ,
[fecha_cierre] datetime NULL ,
[status] int NOT NULL ,
[FechaInicio] datetime NULL ,
[observaciones] varchar(250) NULL ,
[titulo] varchar(40) NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tblevento]', RESEED, 68)
GO

-- ----------------------------
-- Records of tblevento
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblevento] ON
GO
INSERT INTO [dbo].[tblevento] ([idEvento], [descripcion], [solicitante], [responsable], [apoyo], [fecha_Sol], [lugar], [asistencia_aprox], [tipo_evento], [acomodo], [horaIn], [horaFn], [fecha_cierre], [status], [FechaInicio], [observaciones], [titulo]) VALUES (N'21', N'DASDQW QW EQW eqw as dqw dqwdq
wqeqweqweqweas as wqe qw asd asd 
asdasd', N'14', N'15', N'15', N'2014-07-21 00:00:00.000', N'3', N'500', N'Público', N'Escuela', N'2014-07-21 18:30:00.000', N'2014-07-21 19:00:00.000', null, N'3', N'2014-07-23 00:00:00.000', N'Sin observaciones', N'Un dia en el cie');
GO
INSERT INTO [dbo].[tblevento] ([idEvento], [descripcion], [solicitante], [responsable], [apoyo], [fecha_Sol], [lugar], [asistencia_aprox], [tipo_evento], [acomodo], [horaIn], [horaFn], [fecha_cierre], [status], [FechaInicio], [observaciones], [titulo]) VALUES (N'22', N'Hola mundo', N'14', N'15', N'15', N'2014-07-21 00:00:00.000', N'1', N'5555', N'Público', N'aaaa', N'2014-07-21 11:18:00.000', N'2014-07-21 11:18:00.000', null, N'3', N'2014-07-21 00:00:00.000', N'Sin observaciones', N'Hola mundo');
GO
INSERT INTO [dbo].[tblevento] ([idEvento], [descripcion], [solicitante], [responsable], [apoyo], [fecha_Sol], [lugar], [asistencia_aprox], [tipo_evento], [acomodo], [horaIn], [horaFn], [fecha_cierre], [status], [FechaInicio], [observaciones], [titulo]) VALUES (N'25', N'asdadadadadad
adadadadadad', N'14', N'15', N'15', N'2014-08-04 00:00:00.000', N'2', N'20', N'Público', N'Escuela', N'2014-08-04 18:30:00.000', N'2014-08-04 19:30:00.000', null, N'3', N'2014-08-20 00:00:00.000', N'Sin observaciones', N'Prueba');
GO
INSERT INTO [dbo].[tblevento] ([idEvento], [descripcion], [solicitante], [responsable], [apoyo], [fecha_Sol], [lugar], [asistencia_aprox], [tipo_evento], [acomodo], [horaIn], [horaFn], [fecha_cierre], [status], [FechaInicio], [observaciones], [titulo]) VALUES (N'26', N'A cierta hora se realizara tal evento dodnoasdasdads', N'14', N'15', N'15', N'2014-08-11 00:00:00.000', N'1', N'200', N'Público', N'Escuela', N'2014-08-11 15:00:00.000', N'2014-08-11 17:00:00.000', null, N'3', N'2014-08-19 00:00:00.000', N'Sin observaciones', N'Un día en el CIE');
GO
INSERT INTO [dbo].[tblevento] ([idEvento], [descripcion], [solicitante], [responsable], [apoyo], [fecha_Sol], [lugar], [asistencia_aprox], [tipo_evento], [acomodo], [horaIn], [horaFn], [fecha_cierre], [status], [FechaInicio], [observaciones], [titulo]) VALUES (N'30', N'1', N'5', N'5', N'5', N'2014-09-29 21:19:50.483', N'1', N'1', N'1', N'1', N'1900-01-01 13:00:00.000', N'1900-01-01 13:00:00.000', null, N'3', N'2014-11-11 00:00:00.000', N'Sin observaciones', N'2');
GO
INSERT INTO [dbo].[tblevento] ([idEvento], [descripcion], [solicitante], [responsable], [apoyo], [fecha_Sol], [lugar], [asistencia_aprox], [tipo_evento], [acomodo], [horaIn], [horaFn], [fecha_cierre], [status], [FechaInicio], [observaciones], [titulo]) VALUES (N'34', N'Un dia en el cie again', N'16', N'5', N'15', N'2014-09-30 12:06:44.823', N'1', N'100', N'Público', N'Escuela', N'2014-10-01 13:00:00.000', N'2014-10-01 14:00:00.000', null, N'3', N'2014-10-04 00:00:00.000', N'Sin observaciones', N'Un dia en el CIE');
GO
INSERT INTO [dbo].[tblevento] ([idEvento], [descripcion], [solicitante], [responsable], [apoyo], [fecha_Sol], [lugar], [asistencia_aprox], [tipo_evento], [acomodo], [horaIn], [horaFn], [fecha_cierre], [status], [FechaInicio], [observaciones], [titulo]) VALUES (N'49', N'Evento diario', N'5', N'5', N'15', N'2014-09-30 12:56:17.700', N'4', N'100', N'Público', N'Escuela', N'2014-10-07 01:00:00.000', N'2014-10-07 01:00:00.000', null, N'3', N'2014-01-01 00:00:00.000', N'- Comprar el material de apoyo', N'Un día en el CIE');
GO
INSERT INTO [dbo].[tblevento] ([idEvento], [descripcion], [solicitante], [responsable], [apoyo], [fecha_Sol], [lugar], [asistencia_aprox], [tipo_evento], [acomodo], [horaIn], [horaFn], [fecha_cierre], [status], [FechaInicio], [observaciones], [titulo]) VALUES (N'50', N'Hola mundo', N'5', N'15', N'15', N'2014-09-30 14:18:18.860', N'1', N'100', N'Público', N'Escuela', N'2014-09-30 01:00:00.000', N'2014-09-30 01:00:00.000', null, N'3', N'2014-09-15 00:00:00.000', N'Sin observaciones', N'Prueba 2');
GO
INSERT INTO [dbo].[tblevento] ([idEvento], [descripcion], [solicitante], [responsable], [apoyo], [fecha_Sol], [lugar], [asistencia_aprox], [tipo_evento], [acomodo], [horaIn], [horaFn], [fecha_cierre], [status], [FechaInicio], [observaciones], [titulo]) VALUES (N'51', N'Aparece', N'5', N'15', N'15', N'2014-09-30 14:25:03.803', N'1', N'10', N'Público', N'Escuela', N'2014-09-30 01:00:00.000', N'2014-09-30 01:00:00.000', null, N'3', N'2014-01-01 00:00:00.000', N'Sin observaciones', N'Hola mundo 15');
GO
INSERT INTO [dbo].[tblevento] ([idEvento], [descripcion], [solicitante], [responsable], [apoyo], [fecha_Sol], [lugar], [asistencia_aprox], [tipo_evento], [acomodo], [horaIn], [horaFn], [fecha_cierre], [status], [FechaInicio], [observaciones], [titulo]) VALUES (N'52', N'Un día en el CIE La revancha', N'5', N'5', N'5', N'2014-10-02 07:36:06.507', N'1', N'31', N'Público', N'Escuela', N'2014-10-02 17:00:00.000', N'2014-10-02 17:00:00.000', null, N'3', N'2015-01-01 00:00:00.000', N'Sin observaciones', N'Evento No. 1');
GO
INSERT INTO [dbo].[tblevento] ([idEvento], [descripcion], [solicitante], [responsable], [apoyo], [fecha_Sol], [lugar], [asistencia_aprox], [tipo_evento], [acomodo], [horaIn], [horaFn], [fecha_cierre], [status], [FechaInicio], [observaciones], [titulo]) VALUES (N'53', N'asdasdasd', N'5', N'15', N'15', N'2014-10-02 07:39:25.470', N'1', N'25', N'Público', N'Escuela', N'2014-10-02 13:00:00.000', N'2014-10-02 13:00:00.000', null, N'3', N'2015-01-02 00:00:00.000', N'Sin observaciones', N'Evento No. 2');
GO
INSERT INTO [dbo].[tblevento] ([idEvento], [descripcion], [solicitante], [responsable], [apoyo], [fecha_Sol], [lugar], [asistencia_aprox], [tipo_evento], [acomodo], [horaIn], [horaFn], [fecha_cierre], [status], [FechaInicio], [observaciones], [titulo]) VALUES (N'63', N'Evento 10', N'5', N'5', N'15', N'2014-10-10 16:49:59.383', N'1', N'11', N'Público', N'Escuela', N'2014-10-10 23:01:00.000', N'2014-10-10 23:01:00.000', null, N'3', N'2014-02-01 00:00:00.000', N'Sin observaciones', N'Un día en el cie');
GO
INSERT INTO [dbo].[tblevento] ([idEvento], [descripcion], [solicitante], [responsable], [apoyo], [fecha_Sol], [lugar], [asistencia_aprox], [tipo_evento], [acomodo], [horaIn], [horaFn], [fecha_cierre], [status], [FechaInicio], [observaciones], [titulo]) VALUES (N'65', N'Describa su evento', N'5', N'15', N'15', N'2014-10-12 15:51:23.230', N'1', N'18', N'Público', N'Escuela', N'2014-10-12 01:00:00.000', N'2014-10-12 01:00:00.000', null, N'3', N'2014-01-02 00:00:00.000', N'Sin observaciones', N'Evento 500');
GO
INSERT INTO [dbo].[tblevento] ([idEvento], [descripcion], [solicitante], [responsable], [apoyo], [fecha_Sol], [lugar], [asistencia_aprox], [tipo_evento], [acomodo], [horaIn], [horaFn], [fecha_cierre], [status], [FechaInicio], [observaciones], [titulo]) VALUES (N'66', N'Evento', N'5', N'16', N'5', N'2014-10-15 10:43:20.423', N'1', N'16', N'Público', N'Escuela', N'2014-10-28 13:00:00.000', N'2014-10-28 13:00:00.000', N'2014-10-29 15:25:55.333', N'2', N'2014-01-03 00:00:00.000', N'Sin observaciones', N'Evento 500');
GO
INSERT INTO [dbo].[tblevento] ([idEvento], [descripcion], [solicitante], [responsable], [apoyo], [fecha_Sol], [lugar], [asistencia_aprox], [tipo_evento], [acomodo], [horaIn], [horaFn], [fecha_cierre], [status], [FechaInicio], [observaciones], [titulo]) VALUES (N'68', N'Muy divertido', N'5', N'5', N'17', N'2014-10-27 13:16:24.953', N'1', N'25', N'Público', N'Escuela', N'2014-10-27 01:00:00.000', N'2014-10-27 01:00:00.000', N'2014-10-27 13:17:16.870', N'2', N'2014-01-01 00:00:00.000', N'Sin observaciones', N'Un dia en el cie');
GO
SET IDENTITY_INSERT [dbo].[tblevento] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[tblincidente]
-- ----------------------------
DROP TABLE [dbo].[tblincidente]
GO
CREATE TABLE [dbo].[tblincidente] (
[numIncidente] int NOT NULL IDENTITY(1,1) ,
[tipo] int NOT NULL ,
[descripcion] varchar(200) NULL ,
[solicitante] int NOT NULL ,
[prioridad] varchar(6) NULL ,
[fecha_Sol] datetime NULL ,
[status] int NOT NULL ,
[horaIn] datetime NULL ,
[horaFn] datetime NULL ,
[fecha_Cierre] datetime NULL ,
[soporte] int NOT NULL ,
[acciones] varchar(200) NULL ,
[solucion] varchar(200) NULL ,
[seguimiento] int NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tblincidente]', RESEED, 60)
GO

-- ----------------------------
-- Records of tblincidente
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblincidente] ON
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'32', N'1', N'No encendia el monitor', N'16', N'Alta', N'2014-07-15 00:00:00.000', N'3', N'2014-07-20 13:06:00.000', N'2014-07-20 13:31:00.000', N'2014-07-15 00:00:00.000', N'5', N'Se trabajo por separado para arreglar el problema
Se otorgaron cursos 
Se blablabla blablabla ', N'Era simplemente conectar el enchufe', N'15');
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'33', N'1', N'No se puede conectar a internet', N'14', N'Alta', N'2014-07-31 00:00:00.000', N'3', N'2014-07-31 16:03:57.973', null, null, N'5', N'S/A', N'S/A', N'15');
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'38', N'3', N'No sirve tal cosa', N'14', N'Media', N'2014-08-11 00:00:00.000', N'3', N'2014-08-11 22:30:02.840', null, null, N'15', N'S/A', N'S/A', N'15');
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'48', N'1', N'gggg', N'14', N'Media', N'2014-09-12 00:00:00.000', N'3', N'2014-09-12 17:36:00.173', null, null, N'15', N'S/A', N'S/A', N'15');
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'52', N'1', N'Hola mundo 15', N'18', N'Alta', N'2014-10-12 19:20:07.200', N'3', N'2014-10-12 19:20:07.200', null, null, N'5', N'S/A', N'S/A', N'5');
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'53', N'5', N'No enciende la computadora', N'5', N'S/A', N'2014-10-13 07:53:30.770', N'3', N'2014-10-13 07:53:30.770', null, null, N'15', N'S/A', N'S/A', N'15');
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'56', N'5', N'Se me apago la computadora', N'5', N'S/A', N'2014-10-15 14:18:19.700', N'3', N'2014-10-15 14:18:19.700', null, null, N'15', N'S/A', N'S/A', N'15');
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'57', N'1', N'No sirve mi computadora', N'16', N'Media', N'2014-10-27 13:09:26.847', N'2', N'2014-10-27 13:09:26.847', N'2014-10-28 12:54:21.967', N'2014-10-28 12:54:21.967', N'5', N'asdasdasd', N'asdasdasdasd', N'15');
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'58', N'3', N'No sirve mi computadora parte 2', N'5', N'Media', N'2014-10-27 13:11:41.443', N'2', N'2014-10-27 13:11:41.443', N'2014-10-29 11:47:11.397', N'2014-10-29 11:47:11.397', N'22', N'asdasd', N'asdasdasd', N'22');
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'59', N'3', N'Me duele la pansa', N'5', N'Normal', N'2014-10-29 15:19:52.660', N'2', N'2014-10-29 15:19:52.660', N'2014-10-29 15:29:03.787', N'2014-10-29 15:29:03.787', N'5', N'Mucha acción', N'Nada', N'17');
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'60', N'3', N'No enciende mi computadora
', N'5', N'Media', N'2014-10-29 15:30:05.833', N'2', N'2014-10-29 15:30:05.833', N'2014-10-29 15:30:29.310', N'2014-10-29 15:30:29.310', N'5', N'ASdasdasd', N'asdasdasd', N'16');
GO
SET IDENTITY_INSERT [dbo].[tblincidente] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[tblinstitucion]
-- ----------------------------
DROP TABLE [dbo].[tblinstitucion]
GO
CREATE TABLE [dbo].[tblinstitucion] (
[idInstitucion] int NOT NULL IDENTITY(1,1) ,
[nomInstitucion] varchar(40) NOT NULL ,
[correoInstitucion] varchar(20) NULL ,
[status] bit NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tblinstitucion]', RESEED, 5)
GO

-- ----------------------------
-- Records of tblinstitucion
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblinstitucion] ON
GO
INSERT INTO [dbo].[tblinstitucion] ([idInstitucion], [nomInstitucion], [correoInstitucion], [status]) VALUES (N'1', N'Centro de Innovación y Educación', N'cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblinstitucion] ([idInstitucion], [nomInstitucion], [correoInstitucion], [status]) VALUES (N'2', N'TRAPICHE Museo Interactivo', N'trapiche.org.mx', N'1');
GO
INSERT INTO [dbo].[tblinstitucion] ([idInstitucion], [nomInstitucion], [correoInstitucion], [status]) VALUES (N'3', N'Impulsora de la Cultura y las Artes', N'imcaiap.org.mx', N'1');
GO
INSERT INTO [dbo].[tblinstitucion] ([idInstitucion], [nomInstitucion], [correoInstitucion], [status]) VALUES (N'5', N'Centro de Innovación y Educación 2', N'cie.org.mx', N'1');
GO
SET IDENTITY_INSERT [dbo].[tblinstitucion] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[tbllugar]
-- ----------------------------
DROP TABLE [dbo].[tbllugar]
GO
CREATE TABLE [dbo].[tbllugar] (
[idLugar] int NOT NULL IDENTITY(1,1) ,
[nomLugar] varchar(40) NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tbllugar]', RESEED, 6)
GO

-- ----------------------------
-- Records of tbllugar
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tbllugar] ON
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'1', N'Biblioteca digital');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'6', N'Sala de Diálogos');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'3', N'Sala de Exposiciones');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'5', N'Sala de Taller');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'4', N'Sala de diálogo');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'2', N'Sala interactiva');
GO
SET IDENTITY_INSERT [dbo].[tbllugar] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[tblmarca]
-- ----------------------------
DROP TABLE [dbo].[tblmarca]
GO
CREATE TABLE [dbo].[tblmarca] (
[idMarca] int NOT NULL IDENTITY(1,1) ,
[nomMarca] varchar(25) NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tblmarca]', RESEED, 15)
GO

-- ----------------------------
-- Records of tblmarca
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblmarca] ON
GO
INSERT INTO [dbo].[tblmarca] ([idMarca], [nomMarca]) VALUES (N'6', N'Apple');
GO
INSERT INTO [dbo].[tblmarca] ([idMarca], [nomMarca]) VALUES (N'4', N'Dell');
GO
INSERT INTO [dbo].[tblmarca] ([idMarca], [nomMarca]) VALUES (N'5', N'HP');
GO
INSERT INTO [dbo].[tblmarca] ([idMarca], [nomMarca]) VALUES (N'13', N'Hitachi');
GO
INSERT INTO [dbo].[tblmarca] ([idMarca], [nomMarca]) VALUES (N'11', N'Intel');
GO
INSERT INTO [dbo].[tblmarca] ([idMarca], [nomMarca]) VALUES (N'15', N'Kokoro');
GO
INSERT INTO [dbo].[tblmarca] ([idMarca], [nomMarca]) VALUES (N'8', N'N/A');
GO
INSERT INTO [dbo].[tblmarca] ([idMarca], [nomMarca]) VALUES (N'7', N'Ni-san');
GO
INSERT INTO [dbo].[tblmarca] ([idMarca], [nomMarca]) VALUES (N'14', N'Opax');
GO
INSERT INTO [dbo].[tblmarca] ([idMarca], [nomMarca]) VALUES (N'10', N'Sony');
GO
INSERT INTO [dbo].[tblmarca] ([idMarca], [nomMarca]) VALUES (N'9', N'Toshiba');
GO
SET IDENTITY_INSERT [dbo].[tblmarca] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[tblpregunta]
-- ----------------------------
DROP TABLE [dbo].[tblpregunta]
GO
CREATE TABLE [dbo].[tblpregunta] (
[idPregunta] int NOT NULL ,
[txtPregunta] varchar(70) NOT NULL ,
[statusPregunta] bit NOT NULL ,
[afinidad] int NOT NULL 
)


GO

-- ----------------------------
-- Records of tblpregunta
-- ----------------------------
INSERT INTO [dbo].[tblpregunta] ([idPregunta], [txtPregunta], [statusPregunta], [afinidad]) VALUES (N'1', N'Se realizó de manera rapida y eficiente', N'1', N'2');
GO
INSERT INTO [dbo].[tblpregunta] ([idPregunta], [txtPregunta], [statusPregunta], [afinidad]) VALUES (N'2', N'Cumplió con sus expectativas', N'1', N'2');
GO
INSERT INTO [dbo].[tblpregunta] ([idPregunta], [txtPregunta], [statusPregunta], [afinidad]) VALUES (N'3', N'Trato', N'1', N'2');
GO

-- ----------------------------
-- Table structure for [dbo].[tblpuesto]
-- ----------------------------
DROP TABLE [dbo].[tblpuesto]
GO
CREATE TABLE [dbo].[tblpuesto] (
[idPuesto] int NOT NULL IDENTITY(1,1) ,
[nomPuesto] varchar(40) NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tblpuesto]', RESEED, 8)
GO

-- ----------------------------
-- Records of tblpuesto
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblpuesto] ON
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'1', N'Administrador de sesiones');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'5', N'Atención a usuarios');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'3', N'Encargado de almacen');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'8', N'Musico artista');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'6', N'Programador residente');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'7', N'Promotor Cultural');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'4', N'Recepcionista');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'2', N'Salón de Música');
GO
SET IDENTITY_INSERT [dbo].[tblpuesto] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[tblrequerimientoaevento]
-- ----------------------------
DROP TABLE [dbo].[tblrequerimientoaevento]
GO
CREATE TABLE [dbo].[tblrequerimientoaevento] (
[evento] int NOT NULL ,
[requerimiento] int NOT NULL ,
[cantidad] int NULL 
)


GO

-- ----------------------------
-- Records of tblrequerimientoaevento
-- ----------------------------

-- ----------------------------
-- Table structure for [dbo].[tblrequerimientos]
-- ----------------------------
DROP TABLE [dbo].[tblrequerimientos]
GO
CREATE TABLE [dbo].[tblrequerimientos] (
[idRequerimientos] int NOT NULL IDENTITY(1,1) ,
[nomRequerimiento] varchar(30) NOT NULL ,
[cuantificable] bit NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tblrequerimientos]', RESEED, 18)
GO

-- ----------------------------
-- Records of tblrequerimientos
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblrequerimientos] ON
GO
INSERT INTO [dbo].[tblrequerimientos] ([idRequerimientos], [nomRequerimiento], [cuantificable]) VALUES (N'16', N'Cañon', N'1');
GO
INSERT INTO [dbo].[tblrequerimientos] ([idRequerimientos], [nomRequerimiento], [cuantificable]) VALUES (N'17', N'Apuntador', N'1');
GO
INSERT INTO [dbo].[tblrequerimientos] ([idRequerimientos], [nomRequerimiento], [cuantificable]) VALUES (N'18', N'Mesa del presidium', N'0');
GO
SET IDENTITY_INSERT [dbo].[tblrequerimientos] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[tblresponsablequipo]
-- ----------------------------
DROP TABLE [dbo].[tblresponsablequipo]
GO
CREATE TABLE [dbo].[tblresponsablequipo] (
[idResponEq] int NOT NULL IDENTITY(1,1) ,
[responsable] int NOT NULL DEFAULT ((1)) ,
[tipoEquipo] int NOT NULL DEFAULT ((1)) ,
[marcaEquipo] int NOT NULL DEFAULT ((1)) ,
[serieEquipo] varchar(25) NOT NULL DEFAULT ((0)) ,
[memoriaRam] varchar(8) NULL DEFAULT ((0)) ,
[discoDuro] varchar(8) NULL DEFAULT ((0)) ,
[marcaMonitor] int NOT NULL DEFAULT ((1)) ,
[serieMonitor] varchar(25) NOT NULL DEFAULT ((0)) ,
[ip] varchar(15) NOT NULL DEFAULT ((0)) ,
[mac] varchar(17) NOT NULL DEFAULT ((0)) ,
[marcaMouse] int NOT NULL ,
[serieMouse] varchar(25) NOT NULL ,
[marcaTeclado] int NOT NULL ,
[serieTeclado] varchar(25) NOT NULL ,
[procesador] varchar(10) NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tblresponsablequipo]', RESEED, 16)
GO

-- ----------------------------
-- Records of tblresponsablequipo
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblresponsablequipo] ON
GO
INSERT INTO [dbo].[tblresponsablequipo] ([idResponEq], [responsable], [tipoEquipo], [marcaEquipo], [serieEquipo], [memoriaRam], [discoDuro], [marcaMonitor], [serieMonitor], [ip], [mac], [marcaMouse], [serieMouse], [marcaTeclado], [serieTeclado], [procesador]) VALUES (N'12', N'14', N'8', N'7', N'jsadasdasdak', N'S/A', N'S/A', N'8', N'N/A', N'0.0.0.0', N'00-00-00-00-00-00', N'8', N'N/A', N'8', N'N/A', N'S/A');
GO
INSERT INTO [dbo].[tblresponsablequipo] ([idResponEq], [responsable], [tipoEquipo], [marcaEquipo], [serieEquipo], [memoriaRam], [discoDuro], [marcaMonitor], [serieMonitor], [ip], [mac], [marcaMouse], [serieMouse], [marcaTeclado], [serieTeclado], [procesador]) VALUES (N'13', N'16', N'8', N'4', N'DAS5DASDASDCASDW', N'S/A', N'S/A', N'8', N'N/A', N'0.0.0.0', N'00-00-00-00-00-00', N'8', N'N/A', N'8', N'N/A', N'S/A');
GO
INSERT INTO [dbo].[tblresponsablequipo] ([idResponEq], [responsable], [tipoEquipo], [marcaEquipo], [serieEquipo], [memoriaRam], [discoDuro], [marcaMonitor], [serieMonitor], [ip], [mac], [marcaMouse], [serieMouse], [marcaTeclado], [serieTeclado], [procesador]) VALUES (N'14', N'16', N'8', N'4', N'DAS5DASDASDCASDW', N'S/A', N'S/A', N'8', N'N/A', N'0.0.0.0', N'00-00-00-00-00-00', N'8', N'N/A', N'8', N'N/A', N'S/A');
GO
INSERT INTO [dbo].[tblresponsablequipo] ([idResponEq], [responsable], [tipoEquipo], [marcaEquipo], [serieEquipo], [memoriaRam], [discoDuro], [marcaMonitor], [serieMonitor], [ip], [mac], [marcaMouse], [serieMouse], [marcaTeclado], [serieTeclado], [procesador]) VALUES (N'15', N'5', N'6', N'6', N'5456456', N'5 GB', N'5 GB', N'6', N'456456645', N'192.168.1.300', N'54-f6-6f-6f-f6-f6', N'6', N'456456456', N'4', N'456456546', N'5 GHz');
GO
INSERT INTO [dbo].[tblresponsablequipo] ([idResponEq], [responsable], [tipoEquipo], [marcaEquipo], [serieEquipo], [memoriaRam], [discoDuro], [marcaMonitor], [serieMonitor], [ip], [mac], [marcaMouse], [serieMouse], [marcaTeclado], [serieTeclado], [procesador]) VALUES (N'16', N'23', N'9', N'5', N'C17G61VFDHJF', N'8 GB', N'500 GB', N'8', N'N/A', N'192.168.1.75', N'00-17-F2-10-1C-A0', N'8', N'N/A', N'8', N'N/A', N'2.0 GHz');
GO
SET IDENTITY_INSERT [dbo].[tblresponsablequipo] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[tblrespuesta]
-- ----------------------------
DROP TABLE [dbo].[tblrespuesta]
GO
CREATE TABLE [dbo].[tblrespuesta] (
[idRespuesta] int NOT NULL IDENTITY(1,1) ,
[valorRespuesta] int NOT NULL ,
[pregunta] int NOT NULL ,
[calidadServicio] int NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tblrespuesta]', RESEED, 114)
GO

-- ----------------------------
-- Records of tblrespuesta
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblrespuesta] ON
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'97', N'3', N'1', N'78');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'98', N'2', N'2', N'78');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'99', N'2', N'3', N'78');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'100', N'4', N'1', N'79');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'101', N'7', N'2', N'79');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'102', N'9', N'3', N'79');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'103', N'5', N'1', N'80');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'104', N'8', N'2', N'80');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'105', N'6', N'3', N'80');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'106', N'9', N'1', N'81');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'107', N'10', N'2', N'81');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'108', N'10', N'3', N'81');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'109', N'10', N'1', N'82');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'110', N'10', N'2', N'82');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'111', N'10', N'3', N'82');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'112', N'10', N'1', N'83');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'113', N'10', N'2', N'83');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'114', N'10', N'3', N'83');
GO
SET IDENTITY_INSERT [dbo].[tblrespuesta] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[tbltipoequipo]
-- ----------------------------
DROP TABLE [dbo].[tbltipoequipo]
GO
CREATE TABLE [dbo].[tbltipoequipo] (
[idTipoEquipo] int NOT NULL IDENTITY(1,1) ,
[nomTipoEquipo] varchar(30) NOT NULL ,
[siMonitor] bit NOT NULL DEFAULT ((0)) ,
[siEquipo] bit NOT NULL DEFAULT ((0)) ,
[siDiscoDuro] bit NOT NULL DEFAULT ((0)) ,
[siMouse] bit NOT NULL DEFAULT ((0)) ,
[siTeclado] bit NOT NULL ,
[siRed] bit NOT NULL ,
[siRAM] bit NOT NULL ,
[siProcesador] bit NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tbltipoequipo]', RESEED, 77)
GO

-- ----------------------------
-- Records of tbltipoequipo
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tbltipoequipo] ON
GO
INSERT INTO [dbo].[tbltipoequipo] ([idTipoEquipo], [nomTipoEquipo], [siMonitor], [siEquipo], [siDiscoDuro], [siMouse], [siTeclado], [siRed], [siRAM], [siProcesador]) VALUES (N'6', N'Desktop', N'0', N'1', N'1', N'1', N'1', N'1', N'1', N'1');
GO
INSERT INTO [dbo].[tbltipoequipo] ([idTipoEquipo], [nomTipoEquipo], [siMonitor], [siEquipo], [siDiscoDuro], [siMouse], [siTeclado], [siRed], [siRAM], [siProcesador]) VALUES (N'7', N'Pantalla', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'0');
GO
INSERT INTO [dbo].[tbltipoequipo] ([idTipoEquipo], [nomTipoEquipo], [siMonitor], [siEquipo], [siDiscoDuro], [siMouse], [siTeclado], [siRed], [siRAM], [siProcesador]) VALUES (N'8', N'NoBreak', N'0', N'1', N'0', N'0', N'0', N'1', N'0', N'0');
GO
INSERT INTO [dbo].[tbltipoequipo] ([idTipoEquipo], [nomTipoEquipo], [siMonitor], [siEquipo], [siDiscoDuro], [siMouse], [siTeclado], [siRed], [siRAM], [siProcesador]) VALUES (N'9', N'Laptop', N'0', N'1', N'1', N'0', N'0', N'1', N'1', N'1');
GO
INSERT INTO [dbo].[tbltipoequipo] ([idTipoEquipo], [nomTipoEquipo], [siMonitor], [siEquipo], [siDiscoDuro], [siMouse], [siTeclado], [siRed], [siRAM], [siProcesador]) VALUES (N'14', N'Surface Pro', N'0', N'1', N'1', N'1', N'0', N'1', N'1', N'1');
GO
INSERT INTO [dbo].[tbltipoequipo] ([idTipoEquipo], [nomTipoEquipo], [siMonitor], [siEquipo], [siDiscoDuro], [siMouse], [siTeclado], [siRed], [siRAM], [siProcesador]) VALUES (N'16', N'Tablet ', N'0', N'1', N'1', N'0', N'0', N'0', N'0', N'0');
GO
INSERT INTO [dbo].[tbltipoequipo] ([idTipoEquipo], [nomTipoEquipo], [siMonitor], [siEquipo], [siDiscoDuro], [siMouse], [siTeclado], [siRed], [siRAM], [siProcesador]) VALUES (N'17', N'Tablas', N'1', N'1', N'1', N'1', N'1', N'1', N'1', N'1');
GO
INSERT INTO [dbo].[tbltipoequipo] ([idTipoEquipo], [nomTipoEquipo], [siMonitor], [siEquipo], [siDiscoDuro], [siMouse], [siTeclado], [siRed], [siRAM], [siProcesador]) VALUES (N'19', N'Prueba8', N'1', N'1', N'0', N'0', N'1', N'0', N'0', N'0');
GO
INSERT INTO [dbo].[tbltipoequipo] ([idTipoEquipo], [nomTipoEquipo], [siMonitor], [siEquipo], [siDiscoDuro], [siMouse], [siTeclado], [siRed], [siRAM], [siProcesador]) VALUES (N'20', N'asdadasd', N'0', N'1', N'0', N'1', N'1', N'0', N'0', N'0');
GO
INSERT INTO [dbo].[tbltipoequipo] ([idTipoEquipo], [nomTipoEquipo], [siMonitor], [siEquipo], [siDiscoDuro], [siMouse], [siTeclado], [siRed], [siRAM], [siProcesador]) VALUES (N'70', N'Hola mudno', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'0');
GO
INSERT INTO [dbo].[tbltipoequipo] ([idTipoEquipo], [nomTipoEquipo], [siMonitor], [siEquipo], [siDiscoDuro], [siMouse], [siTeclado], [siRed], [siRAM], [siProcesador]) VALUES (N'75', N'Yeah', N'1', N'1', N'0', N'0', N'1', N'0', N'0', N'0');
GO
INSERT INTO [dbo].[tbltipoequipo] ([idTipoEquipo], [nomTipoEquipo], [siMonitor], [siEquipo], [siDiscoDuro], [siMouse], [siTeclado], [siRed], [siRAM], [siProcesador]) VALUES (N'76', N'SDFSDFsd', N'0', N'1', N'0', N'0', N'0', N'0', N'0', N'0');
GO
INSERT INTO [dbo].[tbltipoequipo] ([idTipoEquipo], [nomTipoEquipo], [siMonitor], [siEquipo], [siDiscoDuro], [siMouse], [siTeclado], [siRed], [siRAM], [siProcesador]) VALUES (N'77', N'Surface', N'0', N'1', N'1', N'1', N'1', N'1', N'0', N'1');
GO
SET IDENTITY_INSERT [dbo].[tbltipoequipo] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[tbltipoincidencia]
-- ----------------------------
DROP TABLE [dbo].[tbltipoincidencia]
GO
CREATE TABLE [dbo].[tbltipoincidencia] (
[idTipoIncidente] int NOT NULL IDENTITY(1,1) ,
[nomTipoIncidente] varchar(25) NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tbltipoincidencia]', RESEED, 6)
GO

-- ----------------------------
-- Records of tbltipoincidencia
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tbltipoincidencia] ON
GO
INSERT INTO [dbo].[tbltipoincidencia] ([idTipoIncidente], [nomTipoIncidente]) VALUES (N'5', N'General');
GO
INSERT INTO [dbo].[tbltipoincidencia] ([idTipoIncidente], [nomTipoIncidente]) VALUES (N'3', N'Hardware');
GO
INSERT INTO [dbo].[tbltipoincidencia] ([idTipoIncidente], [nomTipoIncidente]) VALUES (N'1', N'Red');
GO
INSERT INTO [dbo].[tbltipoincidencia] ([idTipoIncidente], [nomTipoIncidente]) VALUES (N'2', N'Software');
GO
INSERT INTO [dbo].[tbltipoincidencia] ([idTipoIncidente], [nomTipoIncidente]) VALUES (N'6', N'Transmisión de datos');
GO
SET IDENTITY_INSERT [dbo].[tbltipoincidencia] OFF
GO

-- ----------------------------
-- Table structure for [dbo].[tblusuarios]
-- ----------------------------
DROP TABLE [dbo].[tblusuarios]
GO
CREATE TABLE [dbo].[tblusuarios] (
[idUsuario] int NOT NULL IDENTITY(1,1) ,
[nombre] varchar(60) NOT NULL ,
[username] varchar(25) NOT NULL ,
[password] varchar(25) NOT NULL ,
[tipoUsuario] int NOT NULL ,
[depto] int NOT NULL ,
[exTel] varchar(5) NULL DEFAULT ((0)) ,
[area] int NOT NULL ,
[puesto] int NOT NULL ,
[correo] varchar(50) NOT NULL ,
[institucion] int NOT NULL ,
[apellidos] varchar(60) NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tblusuarios]', RESEED, 25)
GO

-- ----------------------------
-- Records of tblusuarios
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblusuarios] ON
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nombre], [username], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion], [apellidos]) VALUES (N'5', N'Jesús Alberto ', N'JesusAlb', N'1', N'0', N'1', N'011', N'1', N'6', N'jocana@cie.org.mx', N'1', N'Ocaña Acosta');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nombre], [username], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion], [apellidos]) VALUES (N'14', N'Elena Marcela ', N'eGonzalez', N'1', N'1', N'1', N'123', N'6', N'5', N'egonzalez@cie.org.mx', N'1', N'González Almodobar');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nombre], [username], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion], [apellidos]) VALUES (N'15', N'S/A', N'S/A', N'1', N'0', N'1', N'1', N'1', N'1', N'asdsad@cie.org.mx', N'1', N'S/A');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nombre], [username], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion], [apellidos]) VALUES (N'16', N'Luiz ', N'R9Ronaldo', N'1', N'0', N'1', N'111', N'1', N'1', N'r9ronaldo@cie.org.mx', N'1', N'Nazario de Lima');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nombre], [username], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion], [apellidos]) VALUES (N'17', N'HH', N'HH', N'a', N'0', N'1', N'12', N'1', N'1', N'adsadas@cie.org.mx', N'1', N'HH');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nombre], [username], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion], [apellidos]) VALUES (N'18', N'Edgardo', N'eMartinez', N'1', N'1', N'2', N'112', N'1', N'1', N'emartinez@cie.org.mx', N'1', N'Martinez');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nombre], [username], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion], [apellidos]) VALUES (N'22', N'Hector', N'Admin', N'1', N'0', N'1', N'1', N'1', N'1', N'hherrera@cie.org.mx', N'1', N'Herrera');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nombre], [username], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion], [apellidos]) VALUES (N'23', N'Jesús Antonio ', N'jGallardo', N'123456789', N'1', N'6', N'113', N'6', N'1', N'jgallardo@cie.org.mx', N'1', N'Gallardo Mendoza');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nombre], [username], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion], [apellidos]) VALUES (N'25', N'asdasdasd', N'asdasdas', N'as', N'0', N'1', N'123', N'1', N'1', N'sadasd@asdasd.com', N'1', N'asas');
GO
SET IDENTITY_INSERT [dbo].[tblusuarios] OFF
GO

-- ----------------------------
-- View structure for [dbo].[ViewDepartamentos]
-- ----------------------------
DROP VIEW [dbo].[ViewDepartamentos]
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

-- ----------------------------
-- View structure for [dbo].[ViewEventoConRequerimientos]
-- ----------------------------
DROP VIEW [dbo].[ViewEventoConRequerimientos]
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

-- ----------------------------
-- View structure for [dbo].[ViewTipoIncidencia]
-- ----------------------------
DROP VIEW [dbo].[ViewTipoIncidencia]
GO
CREATE VIEW [dbo].[ViewTipoIncidencia] AS 
SELECT
dbo.tbltipoincidencia.idTipoIncidente,
dbo.tbltipoincidencia.nomTipoIncidente

FROM
dbo.tbltipoincidencia
GO

-- ----------------------------
-- View structure for [dbo].[ViewUsuarios]
-- ----------------------------
DROP VIEW [dbo].[ViewUsuarios]
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

-- ----------------------------
-- View structure for [dbo].[VistaEncuesta]
-- ----------------------------
DROP VIEW [dbo].[VistaEncuesta]
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

-- ----------------------------
-- View structure for [dbo].[VistaEquipoReporte]
-- ----------------------------
DROP VIEW [dbo].[VistaEquipoReporte]
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

-- ----------------------------
-- View structure for [dbo].[VistaEquipos]
-- ----------------------------
DROP VIEW [dbo].[VistaEquipos]
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

-- ----------------------------
-- View structure for [dbo].[VistaEventosCerrados]
-- ----------------------------
DROP VIEW [dbo].[VistaEventosCerrados]
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

-- ----------------------------
-- View structure for [dbo].[VistaEventosSinCerrar]
-- ----------------------------
DROP VIEW [dbo].[VistaEventosSinCerrar]
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

-- ----------------------------
-- View structure for [dbo].[VistaIncidentesCerrados]
-- ----------------------------
DROP VIEW [dbo].[VistaIncidentesCerrados]
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

-- ----------------------------
-- View structure for [dbo].[VistaIncidentesSinCerrar]
-- ----------------------------
DROP VIEW [dbo].[VistaIncidentesSinCerrar]
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
uSolicitante.username AS solicitante,
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

-- ----------------------------
-- View structure for [dbo].[VistaPregunta]
-- ----------------------------
DROP VIEW [dbo].[VistaPregunta]
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

-- ----------------------------
-- View structure for [dbo].[vistapromedioeventos]
-- ----------------------------
DROP VIEW [dbo].[vistapromedioeventos]
GO
CREATE VIEW [dbo].[vistapromedioeventos] AS 
SELECT
Avg(dbo.tblcalidadservicio.promedioCalidad) AS promedioEventos,
dbo.tblcalidadservicio.usuario_calificado AS usuario

FROM
dbo.tblcalidadservicio
WHERE
dbo.tblcalidadservicio.incidente IS NULL
GROUP BY
dbo.tblcalidadservicio.usuario_calificado
GO

-- ----------------------------
-- View structure for [dbo].[vistapromediogeneral]
-- ----------------------------
DROP VIEW [dbo].[vistapromediogeneral]
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
GROUP BY
dbo.tblusuarios.idUsuario,
dbo.vistapromedioeventos.promedioEventos,
dbo.vistapromedioincidentes.promedioIncidente
GO

-- ----------------------------
-- View structure for [dbo].[vistapromedioincidentes]
-- ----------------------------
DROP VIEW [dbo].[vistapromedioincidentes]
GO
CREATE VIEW [dbo].[vistapromedioincidentes] AS 
SELECT
dbo.tblcalidadservicio.usuario_calificado as soporte,
Avg(dbo.tblcalidadservicio.promedioCalidad) AS promedioIncidente

FROM
dbo.tblcalidadservicio
WHERE
dbo.tblcalidadservicio.evento IS NULL
GROUP BY
dbo.tblcalidadservicio.usuario_calificado
GO

-- ----------------------------
-- Procedure structure for [dbo].[cerrarEvento]
-- ----------------------------
DROP PROCEDURE [dbo].[cerrarEvento]
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

-- ----------------------------
-- Procedure structure for [dbo].[cerrarIncidente]
-- ----------------------------
DROP PROCEDURE [dbo].[cerrarIncidente]
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

-- ----------------------------
-- Procedure structure for [dbo].[insertarEvento]
-- ----------------------------
DROP PROCEDURE [dbo].[insertarEvento]
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

-- ----------------------------
-- Procedure structure for [dbo].[insertarIncidente]
-- ----------------------------
DROP PROCEDURE [dbo].[insertarIncidente]
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

-- ----------------------------
-- Procedure structure for [dbo].[numEventosPorMes]
-- ----------------------------
DROP PROCEDURE [dbo].[numEventosPorMes]
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

-- ----------------------------
-- Procedure structure for [dbo].[numEventosPorUsuario]
-- ----------------------------
DROP PROCEDURE [dbo].[numEventosPorUsuario]
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

-- ----------------------------
-- Procedure structure for [dbo].[numIncidentesPorDepto]
-- ----------------------------
DROP PROCEDURE [dbo].[numIncidentesPorDepto]
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

-- ----------------------------
-- Procedure structure for [dbo].[numIncidentesPorMes]
-- ----------------------------
DROP PROCEDURE [dbo].[numIncidentesPorMes]
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

-- ----------------------------
-- Procedure structure for [dbo].[numIncidentesPorTipo]
-- ----------------------------
DROP PROCEDURE [dbo].[numIncidentesPorTipo]
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

-- ----------------------------
-- Procedure structure for [dbo].[numIncidentesPorUsuario]
-- ----------------------------
DROP PROCEDURE [dbo].[numIncidentesPorUsuario]
GO
CREATE PROCEDURE [dbo].[numIncidentesPorUsuario]

@fechaInicio DateTime,
@fechaFinal DateTime

AS
BEGIN
SELECT

dbo.tblusuarios.nomUsuario AS Usuario, 
Count(dbo.tblincidente.numIncidente) AS Número

FROM
dbo.tblincidente
INNER JOIN dbo.tblusuarios ON dbo.tblincidente.soporte = dbo.tblusuarios.idUsuario
WHERE
dbo.tblincidente.status = 2 AND
dbo.tblincidente.fecha_Sol >= @fechaInicio AND
dbo.tblincidente.fecha_Sol <= @fechaFinal
GROUP BY dbo.tblusuarios.nomUsuario

ORDER BY Número DESC

END
GO

-- ----------------------------
-- Procedure structure for [dbo].[promedioCalidadPorDepto]
-- ----------------------------
DROP PROCEDURE [dbo].[promedioCalidadPorDepto]
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

-- ----------------------------
-- Procedure structure for [dbo].[promedioCalidadPorMesEv]
-- ----------------------------
DROP PROCEDURE [dbo].[promedioCalidadPorMesEv]
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

-- ----------------------------
-- Procedure structure for [dbo].[promedioCalidadPorMesIn]
-- ----------------------------
DROP PROCEDURE [dbo].[promedioCalidadPorMesIn]
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

-- ----------------------------
-- Procedure structure for [dbo].[promedioCalidadPorTipoIn]
-- ----------------------------
DROP PROCEDURE [dbo].[promedioCalidadPorTipoIn]
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

-- ----------------------------
-- Procedure structure for [dbo].[promedioCalidadPorUsuarioEv]
-- ----------------------------
DROP PROCEDURE [dbo].[promedioCalidadPorUsuarioEv]
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

-- ----------------------------
-- Procedure structure for [dbo].[promedioCalidadPorUsuarioIn]
-- ----------------------------
DROP PROCEDURE [dbo].[promedioCalidadPorUsuarioIn]
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

-- ----------------------------
-- Procedure structure for [dbo].[ReqAsignados]
-- ----------------------------
DROP PROCEDURE [dbo].[ReqAsignados]
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

-- ----------------------------
-- Procedure structure for [dbo].[requerimientosSinAsignar]
-- ----------------------------
DROP PROCEDURE [dbo].[requerimientosSinAsignar]
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

-- ----------------------------
-- Procedure structure for [dbo].[topCincoRecursosMasUsados]
-- ----------------------------
DROP PROCEDURE [dbo].[topCincoRecursosMasUsados]
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

-- ----------------------------
-- Procedure structure for [dbo].[topCincoRecursosMenosUsados]
-- ----------------------------
DROP PROCEDURE [dbo].[topCincoRecursosMenosUsados]
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

-- ----------------------------
-- Indexes structure for table tblarea
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[tblarea]
-- ----------------------------
ALTER TABLE [dbo].[tblarea] ADD PRIMARY KEY ([idArea])
GO

-- ----------------------------
-- Uniques structure for table [dbo].[tblarea]
-- ----------------------------
ALTER TABLE [dbo].[tblarea] ADD UNIQUE ([nomArea] ASC)
GO

-- ----------------------------
-- Indexes structure for table tblcalidadservicio
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[tblcalidadservicio]
-- ----------------------------
ALTER TABLE [dbo].[tblcalidadservicio] ADD PRIMARY KEY ([idCalidad_Servicio])
GO

-- ----------------------------
-- Indexes structure for table tblcoordinacion
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[tblcoordinacion]
-- ----------------------------
ALTER TABLE [dbo].[tblcoordinacion] ADD PRIMARY KEY ([idCoordinacion])
GO

-- ----------------------------
-- Uniques structure for table [dbo].[tblcoordinacion]
-- ----------------------------
ALTER TABLE [dbo].[tblcoordinacion] ADD UNIQUE ([nomCoordinacion] ASC)
GO

-- ----------------------------
-- Indexes structure for table tbldepartamentos
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[tbldepartamentos]
-- ----------------------------
ALTER TABLE [dbo].[tbldepartamentos] ADD PRIMARY KEY ([idDepto])
GO

-- ----------------------------
-- Uniques structure for table [dbo].[tbldepartamentos]
-- ----------------------------
ALTER TABLE [dbo].[tbldepartamentos] ADD UNIQUE ([nomDepto] ASC)
GO

-- ----------------------------
-- Indexes structure for table tblevento
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[tblevento]
-- ----------------------------
ALTER TABLE [dbo].[tblevento] ADD PRIMARY KEY ([idEvento])
GO

-- ----------------------------
-- Indexes structure for table tblincidente
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[tblincidente]
-- ----------------------------
ALTER TABLE [dbo].[tblincidente] ADD PRIMARY KEY ([numIncidente])
GO

-- ----------------------------
-- Indexes structure for table tblinstitucion
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[tblinstitucion]
-- ----------------------------
ALTER TABLE [dbo].[tblinstitucion] ADD PRIMARY KEY ([idInstitucion])
GO

-- ----------------------------
-- Uniques structure for table [dbo].[tblinstitucion]
-- ----------------------------
ALTER TABLE [dbo].[tblinstitucion] ADD UNIQUE ([nomInstitucion] ASC)
GO

-- ----------------------------
-- Indexes structure for table tbllugar
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[tbllugar]
-- ----------------------------
ALTER TABLE [dbo].[tbllugar] ADD PRIMARY KEY ([idLugar])
GO

-- ----------------------------
-- Uniques structure for table [dbo].[tbllugar]
-- ----------------------------
ALTER TABLE [dbo].[tbllugar] ADD UNIQUE ([nomLugar] ASC)
GO

-- ----------------------------
-- Indexes structure for table tblmarca
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[tblmarca]
-- ----------------------------
ALTER TABLE [dbo].[tblmarca] ADD PRIMARY KEY ([idMarca])
GO

-- ----------------------------
-- Uniques structure for table [dbo].[tblmarca]
-- ----------------------------
ALTER TABLE [dbo].[tblmarca] ADD UNIQUE ([nomMarca] ASC)
GO

-- ----------------------------
-- Indexes structure for table tblpregunta
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[tblpregunta]
-- ----------------------------
ALTER TABLE [dbo].[tblpregunta] ADD PRIMARY KEY ([idPregunta])
GO

-- ----------------------------
-- Indexes structure for table tblpuesto
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[tblpuesto]
-- ----------------------------
ALTER TABLE [dbo].[tblpuesto] ADD PRIMARY KEY ([idPuesto])
GO

-- ----------------------------
-- Uniques structure for table [dbo].[tblpuesto]
-- ----------------------------
ALTER TABLE [dbo].[tblpuesto] ADD UNIQUE ([nomPuesto] ASC)
GO

-- ----------------------------
-- Indexes structure for table tblrequerimientoaevento
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[tblrequerimientoaevento]
-- ----------------------------
ALTER TABLE [dbo].[tblrequerimientoaevento] ADD PRIMARY KEY ([evento], [requerimiento])
GO

-- ----------------------------
-- Indexes structure for table tblrequerimientos
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[tblrequerimientos]
-- ----------------------------
ALTER TABLE [dbo].[tblrequerimientos] ADD PRIMARY KEY ([idRequerimientos])
GO

-- ----------------------------
-- Uniques structure for table [dbo].[tblrequerimientos]
-- ----------------------------
ALTER TABLE [dbo].[tblrequerimientos] ADD UNIQUE ([nomRequerimiento] ASC)
GO

-- ----------------------------
-- Indexes structure for table tblresponsablequipo
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[tblresponsablequipo]
-- ----------------------------
ALTER TABLE [dbo].[tblresponsablequipo] ADD PRIMARY KEY ([idResponEq])
GO

-- ----------------------------
-- Indexes structure for table tblrespuesta
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[tblrespuesta]
-- ----------------------------
ALTER TABLE [dbo].[tblrespuesta] ADD PRIMARY KEY ([idRespuesta])
GO

-- ----------------------------
-- Indexes structure for table tbltipoequipo
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[tbltipoequipo]
-- ----------------------------
ALTER TABLE [dbo].[tbltipoequipo] ADD PRIMARY KEY ([idTipoEquipo])
GO

-- ----------------------------
-- Uniques structure for table [dbo].[tbltipoequipo]
-- ----------------------------
ALTER TABLE [dbo].[tbltipoequipo] ADD UNIQUE ([nomTipoEquipo] ASC)
GO

-- ----------------------------
-- Indexes structure for table tbltipoincidencia
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[tbltipoincidencia]
-- ----------------------------
ALTER TABLE [dbo].[tbltipoincidencia] ADD PRIMARY KEY ([idTipoIncidente])
GO

-- ----------------------------
-- Uniques structure for table [dbo].[tbltipoincidencia]
-- ----------------------------
ALTER TABLE [dbo].[tbltipoincidencia] ADD UNIQUE ([nomTipoIncidente] ASC)
GO

-- ----------------------------
-- Indexes structure for table tblusuarios
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[tblusuarios]
-- ----------------------------
ALTER TABLE [dbo].[tblusuarios] ADD PRIMARY KEY ([idUsuario])
GO

-- ----------------------------
-- Uniques structure for table [dbo].[tblusuarios]
-- ----------------------------
ALTER TABLE [dbo].[tblusuarios] ADD UNIQUE ([username] ASC)
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[tblcalidadservicio]
-- ----------------------------
ALTER TABLE [dbo].[tblcalidadservicio] ADD FOREIGN KEY ([usuario_calificado]) REFERENCES [dbo].[tblusuarios] ([idUsuario]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[tblcalidadservicio] ADD FOREIGN KEY ([evento]) REFERENCES [dbo].[tblevento] ([idEvento]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblcalidadservicio] ADD FOREIGN KEY ([incidente]) REFERENCES [dbo].[tblincidente] ([numIncidente]) ON DELETE CASCADE ON UPDATE CASCADE
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[tbldepartamentos]
-- ----------------------------
ALTER TABLE [dbo].[tbldepartamentos] ADD FOREIGN KEY ([coordinacion]) REFERENCES [dbo].[tblcoordinacion] ([idCoordinacion]) ON DELETE CASCADE ON UPDATE CASCADE
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[tblevento]
-- ----------------------------
ALTER TABLE [dbo].[tblevento] ADD FOREIGN KEY ([apoyo]) REFERENCES [dbo].[tblusuarios] ([idUsuario]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[tblevento] ADD FOREIGN KEY ([lugar]) REFERENCES [dbo].[tbllugar] ([idLugar]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblevento] ADD FOREIGN KEY ([responsable]) REFERENCES [dbo].[tblusuarios] ([idUsuario]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[tblevento] ADD FOREIGN KEY ([solicitante]) REFERENCES [dbo].[tblusuarios] ([idUsuario]) ON DELETE CASCADE ON UPDATE CASCADE
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[tblincidente]
-- ----------------------------
ALTER TABLE [dbo].[tblincidente] ADD FOREIGN KEY ([seguimiento]) REFERENCES [dbo].[tblusuarios] ([idUsuario]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[tblincidente] ADD FOREIGN KEY ([solicitante]) REFERENCES [dbo].[tblusuarios] ([idUsuario]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[tblincidente] ADD FOREIGN KEY ([soporte]) REFERENCES [dbo].[tblusuarios] ([idUsuario]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[tblincidente] ADD FOREIGN KEY ([tipo]) REFERENCES [dbo].[tbltipoincidencia] ([idTipoIncidente]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[tblrequerimientoaevento]
-- ----------------------------
ALTER TABLE [dbo].[tblrequerimientoaevento] ADD FOREIGN KEY ([evento]) REFERENCES [dbo].[tblevento] ([idEvento]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblrequerimientoaevento] ADD FOREIGN KEY ([requerimiento]) REFERENCES [dbo].[tblrequerimientos] ([idRequerimientos]) ON DELETE CASCADE ON UPDATE CASCADE
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[tblresponsablequipo]
-- ----------------------------
ALTER TABLE [dbo].[tblresponsablequipo] ADD FOREIGN KEY ([marcaEquipo]) REFERENCES [dbo].[tblmarca] ([idMarca]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[tblresponsablequipo] ADD FOREIGN KEY ([marcaMonitor]) REFERENCES [dbo].[tblmarca] ([idMarca]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[tblresponsablequipo] ADD FOREIGN KEY ([marcaMouse]) REFERENCES [dbo].[tblmarca] ([idMarca]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[tblresponsablequipo] ADD FOREIGN KEY ([marcaTeclado]) REFERENCES [dbo].[tblmarca] ([idMarca]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[tblresponsablequipo] ADD FOREIGN KEY ([responsable]) REFERENCES [dbo].[tblusuarios] ([idUsuario]) ON DELETE SET DEFAULT ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblresponsablequipo] ADD FOREIGN KEY ([tipoEquipo]) REFERENCES [dbo].[tbltipoequipo] ([idTipoEquipo]) ON DELETE SET DEFAULT ON UPDATE CASCADE
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[tblrespuesta]
-- ----------------------------
ALTER TABLE [dbo].[tblrespuesta] ADD FOREIGN KEY ([pregunta]) REFERENCES [dbo].[tblpregunta] ([idPregunta]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[tblrespuesta] ADD FOREIGN KEY ([calidadServicio]) REFERENCES [dbo].[tblcalidadservicio] ([idCalidad_Servicio]) ON DELETE CASCADE ON UPDATE CASCADE
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[tblusuarios]
-- ----------------------------
ALTER TABLE [dbo].[tblusuarios] ADD FOREIGN KEY ([institucion]) REFERENCES [dbo].[tblinstitucion] ([idInstitucion]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblusuarios] ADD FOREIGN KEY ([area]) REFERENCES [dbo].[tblarea] ([idArea]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblusuarios] ADD FOREIGN KEY ([depto]) REFERENCES [dbo].[tbldepartamentos] ([idDepto]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblusuarios] ADD FOREIGN KEY ([puesto]) REFERENCES [dbo].[tblpuesto] ([idPuesto]) ON DELETE CASCADE ON UPDATE CASCADE
GO
