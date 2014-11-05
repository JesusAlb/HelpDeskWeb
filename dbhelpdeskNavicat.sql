/*
Navicat SQL Server Data Transfer

Source Server         : innovadesa
Source Server Version : 90000
Source Host           : INNOVADESA\SQLEXPRESS:1433
Source Database       : dbhelpdesk
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 90000
File Encoding         : 65001

Date: 2014-11-05 15:14:10
*/


-- ----------------------------
-- Table structure for [dbo].[sysdiagrams]
-- ----------------------------
DROP TABLE [dbo].[sysdiagrams]
GO
CREATE TABLE [dbo].[sysdiagrams] (
[name] sysname NOT NULL ,
[principal_id] int NOT NULL ,
[diagram_id] int NOT NULL IDENTITY(1,1) ,
[version] int NULL ,
[definition] varbinary(MAX) NULL 
)


GO

-- ----------------------------
-- Records of sysdiagrams
-- ----------------------------
SET IDENTITY_INSERT [dbo].[sysdiagrams] ON
GO
SET IDENTITY_INSERT [dbo].[sysdiagrams] OFF
GO

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
DBCC CHECKIDENT(N'[dbo].[tblarea]', RESEED, 38)
GO

-- ----------------------------
-- Records of tblarea
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblarea] ON
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'36', N'Atención a Comunidades');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'3', N'Atención Escolar');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'4', N'Aula de Alfabetización Tecnológica ');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'5', N'Aula de Innovación Educativa');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'1', N'Biblioteca Digital');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'6', N'Cabina');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'7', N'Checador de Arte y Cultura');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'8', N'Comunicación');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'9', N'Coordinación de Arte y Cultura');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'30', N'Coordinacion de contenidos de programas');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'29', N'coordinacion de contenidos y programas');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'10', N'Coordinación de Gestión y Calidad');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'11', N'Coordinación de Investigación y Sustentabilidad');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'34', N'Coordinacion de Rel Inst y comunicacion');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'31', N'Coordinación de Servicios Financieros');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'13', N'Departamento de Educación y Tecnología');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'12', N'Departamento de Servicios Administrativos');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'14', N'Desarrollo Tecnológico e Innovación');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'15', N'Dirección');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'16', N'Dirección OSCIJ');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'17', N'Diseño e Imagen Institucional');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'18', N'Educación y Tecnología');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'38', N'enseñanza y divulgacion de la ciencia');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'19', N'Entrada del CIE');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'20', N'Formación y Educación Artistica y Cultural');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'21', N'Gestión de la Calidad');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'22', N'Info CIE');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'2', N'Innovación Cultural');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'24', N'Mercadotecnia y Servicios');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'35', N'Modulo de Bienvenida');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'25', N'Programas de Arte y Cultura');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'26', N'Salón de la Ciencia');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'33', N'Seguridad y Responsabilidad Civil');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'32', N'Servicios Adminitrativos');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'28', N'Taller de Mantenimiento');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'27', N'Taller de Soporte Tecnico');
GO
INSERT INTO [dbo].[tblarea] ([idArea], [nomArea]) VALUES (N'37', N'Tecnologia Educativa');
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
[promedioCalidad] float(53) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tblcalidadservicio]', RESEED, 14)
GO

-- ----------------------------
-- Records of tblcalidadservicio
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblcalidadservicio] ON
GO
INSERT INTO [dbo].[tblcalidadservicio] ([idCalidad_Servicio], [observacionesServicio], [incidente], [statusCal_Servicio], [evento], [promedioCalidad]) VALUES (N'1', N'Sin observaciones', N'1', N'1', null, N'10');
GO
INSERT INTO [dbo].[tblcalidadservicio] ([idCalidad_Servicio], [observacionesServicio], [incidente], [statusCal_Servicio], [evento], [promedioCalidad]) VALUES (N'2', N'Sin observaciones', N'2', N'1', null, N'10');
GO
INSERT INTO [dbo].[tblcalidadservicio] ([idCalidad_Servicio], [observacionesServicio], [incidente], [statusCal_Servicio], [evento], [promedioCalidad]) VALUES (N'3', N'Gracias Alex', N'3', N'1', null, N'1');
GO
INSERT INTO [dbo].[tblcalidadservicio] ([idCalidad_Servicio], [observacionesServicio], [incidente], [statusCal_Servicio], [evento], [promedioCalidad]) VALUES (N'4', N'S/A', N'4', N'0', null, N'0');
GO
INSERT INTO [dbo].[tblcalidadservicio] ([idCalidad_Servicio], [observacionesServicio], [incidente], [statusCal_Servicio], [evento], [promedioCalidad]) VALUES (N'5', N'S/A', N'5', N'0', null, N'0');
GO
INSERT INTO [dbo].[tblcalidadservicio] ([idCalidad_Servicio], [observacionesServicio], [incidente], [statusCal_Servicio], [evento], [promedioCalidad]) VALUES (N'6', N'S/A', N'6', N'0', null, N'0');
GO
INSERT INTO [dbo].[tblcalidadservicio] ([idCalidad_Servicio], [observacionesServicio], [incidente], [statusCal_Servicio], [evento], [promedioCalidad]) VALUES (N'7', N'S/A', null, N'0', N'1', N'0');
GO
INSERT INTO [dbo].[tblcalidadservicio] ([idCalidad_Servicio], [observacionesServicio], [incidente], [statusCal_Servicio], [evento], [promedioCalidad]) VALUES (N'8', N'S/A', N'7', N'0', null, N'0');
GO
INSERT INTO [dbo].[tblcalidadservicio] ([idCalidad_Servicio], [observacionesServicio], [incidente], [statusCal_Servicio], [evento], [promedioCalidad]) VALUES (N'9', N'Sin observaciones', N'8', N'1', null, N'1');
GO
INSERT INTO [dbo].[tblcalidadservicio] ([idCalidad_Servicio], [observacionesServicio], [incidente], [statusCal_Servicio], [evento], [promedioCalidad]) VALUES (N'10', N'Me gustaría poder seguir teniendo mis mails en el celular tambien y que no se marcaran como leidos', N'9', N'1', null, N'6');
GO
INSERT INTO [dbo].[tblcalidadservicio] ([idCalidad_Servicio], [observacionesServicio], [incidente], [statusCal_Servicio], [evento], [promedioCalidad]) VALUES (N'11', N'S/A', N'10', N'0', null, N'0');
GO
INSERT INTO [dbo].[tblcalidadservicio] ([idCalidad_Servicio], [observacionesServicio], [incidente], [statusCal_Servicio], [evento], [promedioCalidad]) VALUES (N'12', N'Sin observaciones', N'11', N'1', null, N'9.66666698455811');
GO
INSERT INTO [dbo].[tblcalidadservicio] ([idCalidad_Servicio], [observacionesServicio], [incidente], [statusCal_Servicio], [evento], [promedioCalidad]) VALUES (N'13', N'S/A', N'12', N'0', null, N'0');
GO
INSERT INTO [dbo].[tblcalidadservicio] ([idCalidad_Servicio], [observacionesServicio], [incidente], [statusCal_Servicio], [evento], [promedioCalidad]) VALUES (N'14', N'S/A', N'13', N'0', null, N'0');
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
[nomCoordinacion] varchar(60) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tblcoordinacion]', RESEED, 9)
GO

-- ----------------------------
-- Records of tblcoordinacion
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblcoordinacion] ON
GO
INSERT INTO [dbo].[tblcoordinacion] ([idCoordinacion], [nomCoordinacion]) VALUES (N'1', N'Contenidos de Programas');
GO
INSERT INTO [dbo].[tblcoordinacion] ([idCoordinacion], [nomCoordinacion]) VALUES (N'8', N'Coordinación Operativa');
GO
INSERT INTO [dbo].[tblcoordinacion] ([idCoordinacion], [nomCoordinacion]) VALUES (N'6', N'Desarrollo Tecnológico e Innovación');
GO
INSERT INTO [dbo].[tblcoordinacion] ([idCoordinacion], [nomCoordinacion]) VALUES (N'9', N'Dirección');
GO
INSERT INTO [dbo].[tblcoordinacion] ([idCoordinacion], [nomCoordinacion]) VALUES (N'7', N'Eduación y Tecnología');
GO
INSERT INTO [dbo].[tblcoordinacion] ([idCoordinacion], [nomCoordinacion]) VALUES (N'4', N'Gestión de Calidad y Seguridad');
GO
INSERT INTO [dbo].[tblcoordinacion] ([idCoordinacion], [nomCoordinacion]) VALUES (N'5', N'Relaciones institucionales y comunicación');
GO
INSERT INTO [dbo].[tblcoordinacion] ([idCoordinacion], [nomCoordinacion]) VALUES (N'3', N'Servicios Administrativos');
GO
INSERT INTO [dbo].[tblcoordinacion] ([idCoordinacion], [nomCoordinacion]) VALUES (N'2', N'Servicios Financieros');
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
[nomDepto] varchar(60) NULL ,
[coordinacion] int NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tbldepartamentos]', RESEED, 25)
GO

-- ----------------------------
-- Records of tbldepartamentos
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tbldepartamentos] ON
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'1', N'Contenidos de Programas', N'1');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'2', N'Servicios Financieros', N'2');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'3', N'Directora Ejecutiva', N'9');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'4', N'Asistente de Dirección', N'9');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'5', N'Ingresos y Egresos', N'2');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'6', N'Servicios Administrativos', N'3');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'7', N'Recursos Materiales', N'3');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'8', N'Recursos Humanos', N'3');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'9', N'Gestión de Calidad y Seguridad', N'4');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'10', N'Procesos y Certificacion', N'4');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'11', N'Seguridad y Responsabilidad Civil', N'4');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'12', N'Mantenimiento y Logística', N'4');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'13', N'Relaciones Institucionales y Comunicación', N'5');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'14', N'Comunicación', N'5');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'15', N'Mercadotecnia y Servicios', N'5');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'16', N'Soporte Tecnólogico y Redes', N'6');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'17', N'Desarrollo Tecnológico e Innovación', N'6');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'18', N'Educación y Tecnología', N'7');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'19', N'Formación Social', N'7');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'20', N'Tecnología Educativa', N'7');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'21', N'Enseñanza y Divulgación de la Ciencia', N'7');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'22', N'Arte y Cultura', N'7');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'23', N'Museografía y Logística Cultural', N'7');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'24', N'Operativa', N'8');
GO
INSERT INTO [dbo].[tbldepartamentos] ([idDepto], [nomDepto], [coordinacion]) VALUES (N'25', N'depto de electronica', N'6');
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

-- ----------------------------
-- Records of tblevento
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblevento] ON
GO
INSERT INTO [dbo].[tblevento] ([idEvento], [descripcion], [solicitante], [responsable], [apoyo], [fecha_Sol], [lugar], [asistencia_aprox], [tipo_evento], [acomodo], [horaIn], [horaFn], [fecha_cierre], [status], [FechaInicio], [observaciones], [titulo]) VALUES (N'1', N'Junta de Consejo', N'12', N'1', N'1', N'2014-08-21 00:00:00.000', N'21', N'10', N'Privado', N'Herradura', N'2014-08-21 04:00:00.000', N'2014-08-21 06:00:00.000', null, N'0', N'2014-08-21 00:00:00.000', N'Sin observaciones', N'Ticket001');
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
DBCC CHECKIDENT(N'[dbo].[tblincidente]', RESEED, 13)
GO

-- ----------------------------
-- Records of tblincidente
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblincidente] ON
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'1', N'1', N'No hay internet', N'4', N'Normal', N'2014-08-13 00:00:00.000', N'2', N'2014-08-13 12:12:14.333', N'2014-08-14 10:59:37.887', N'2014-08-14 00:00:00.000', N'2', N'se notifico a megacable y se arreglo el que tenia internt', N'megacable cambio el equipo', N'2');
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'2', N'1', N'Creación de una cuenta de correo electrónico llamada mmtogral imcaiaorgmx', N'3', N'Media', N'2014-08-19 00:00:00.000', N'2', N'2014-08-19 11:38:03.667', N'2014-08-19 12:13:42.543', N'2014-08-19 00:00:00.000', N'10', N'Se realizo la solicitud de alta de usuario y se le envio correo a la coordinadora valeria valdez', N'NA', N'10');
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'3', N'3', N'Impresora de Cinthya

Mi impresora esta desahuciada de vdd..... esta más loca que nada', N'12', N'Media', N'2014-08-20 00:00:00.000', N'2', N'2014-08-20 13:03:32.177', N'2014-08-21 09:08:33.963', N'2014-08-21 00:00:00.000', N'2', N'Impresora no imprime correctamente mancha las hojas', N'Se reinició la impresora e imprimió correctamente', N'10');
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'4', N'2', N'Configurar la impresora de la licenciada en la computadora de Mayte', N'12', N'Alta', N'2014-08-20 00:00:00.000', N'1', N'2014-08-20 15:11:28.890', null, null, N'2', N'S/A', N'S/A', N'9');
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'5', N'2', N'Buenos días compañeros me podrían de favor ayudar con una asesoria para comprimir un archivo con fotos y poder enviarlo por mail ', N'5', N'Normal', N'2014-08-21 00:00:00.000', N'2', N'2014-08-21 08:27:45.437', N'2014-08-21 08:41:00.587', N'2014-08-21 00:00:00.000', N'10', N'Se le explico a comprimir imagenes con el Paint y que le agrege los imagenes por medio directa no copiar y pegar', N'cambiar el tamaño de las imagenes', N'10');
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'6', N'1', N'Crear una carpeta compartida en la computadora de Valeria

1 Tendrán acceso todo el personal de impulsora
2 Será de solo lectura', N'12', N'Media', N'2014-08-21 00:00:00.000', N'1', N'2014-08-21 16:00:45.693', null, null, N'11', N'S/A', N'S/A', N'2');
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'7', N'3', N'Cambio de teclado para thelma  hoy 22 de agosto se gestiono la adquisisción de uno', N'12', N'Normal', N'2014-08-22 00:00:00.000', N'1', N'2014-08-22 12:41:18.313', null, null, N'11', N'S/A', N'S/A', N'11');
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'8', N'3', N'Cambio de ubicación de equipo de cómputo de instructores de Windows 8 a Berenice Desea que esten en una sola linea  debe de quedar para el sábado', N'12', N'Media', N'2014-08-22 00:00:00.000', N'2', N'2014-08-22 12:43:12.413', N'2014-08-25 18:41:02.700', N'2014-08-25 00:00:00.000', N'11', N'cambiar la ubicacion de los equiop', N'cambiamos los Equipos de lugar ', N'10');
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'9', N'4', N'Mis correos nuevos se marcan como leidos aun cuando todavia no les doy click por lo que en ocasiones no me percato de que un correo me llego', N'3', N'Alta', N'2014-08-25 00:00:00.000', N'2', N'2014-08-25 11:46:11.613', N'2014-08-25 18:45:29.687', N'2014-08-25 00:00:00.000', N'10', N'Analizar por que los correos no se envian', N'Se observo que se soluciono solo esta en observacion ', N'10');
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'10', N'2', N'No puedo imprimir me parece impresora desconectada', N'4', N'Normal', N'2014-09-01 00:00:00.000', N'2', N'2014-09-01 12:13:29.397', N'2014-09-01 12:46:48.250', N'2014-09-01 00:00:00.000', N'11', N'nada', N'se soluciono sola', N'11');
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'11', N'1', N'Cambiar de nombre a link donde se guardarán los documentos del sistema de calidad
De Repositorio de documentos 
A Sistema de gestión de calidad', N'3', N'Normal', N'2014-09-12 00:00:00.000', N'2', N'2014-09-12 10:13:31.447', N'2014-09-12 10:56:10.837', N'2014-09-12 00:00:00.000', N'10', N'Se paso al área de desarrollo para que se realize la modificación', N'Cambio de etiqueta', N'9');
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'12', N'2', N'Compra de 4 licencias de Visio para el siguiente personal:
- Valeria Valdez 
- Thema Carrillo
- Francisco Rivera
- Ariathne Ibarra ', N'3', N'Normal', N'2014-09-19 00:00:00.000', N'1', N'2014-09-19 16:04:15.167', null, null, N'2', N'S/A', N'S/A', N'2');
GO
INSERT INTO [dbo].[tblincidente] ([numIncidente], [tipo], [descripcion], [solicitante], [prioridad], [fecha_Sol], [status], [horaIn], [horaFn], [fecha_Cierre], [soporte], [acciones], [solucion], [seguimiento]) VALUES (N'13', N'2', N'Se solicita la capacitación en el software MP utilizado para la y programación de los mantenimientos preventivos y correctivos del mobiliario, equipo ', N'3', N'Media', N'2014-09-19 00:00:00.000', N'1', N'2014-09-19 16:05:06.527', null, null, N'10', N'S/A', N'S/A', N'10');
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

-- ----------------------------
-- Records of tblinstitucion
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblinstitucion] ON
GO
INSERT INTO [dbo].[tblinstitucion] ([idInstitucion], [nomInstitucion], [correoInstitucion], [status]) VALUES (N'1', N'Centro de Innovación y Educación', N'cie.org.mx', N'1');
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
[nomLugar] varchar(60) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tbllugar]', RESEED, 21)
GO

-- ----------------------------
-- Records of tbllugar
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tbllugar] ON
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'3', N'Aula de Alfabetización Tecnológica');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'17', N'Aula de Cuerdas');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'4', N'Aula de Innovación Cultural');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'10', N'Aula de Innovación Educativa');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'11', N'Aula de Lectura Digital');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'14', N'Aula de Maderas');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'15', N'Aula de Metales');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'16', N'Aula de Percusiones');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'20', N'Aula Didáctica');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'5', N'Galeria de Arte');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'13', N'Gran Salón');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'7', N'Plaza Auditorio');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'1', N'Sala de Diálogos');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'6', N'Sala de Exposiciones');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'2', N'Sala de Talleres');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'12', N'Sala de Usos Múltiples ');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'19', N'Sala para Coro');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'18', N'Salón de Instrumentos');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'8', N'Salón de la Ciencia');
GO
INSERT INTO [dbo].[tbllugar] ([idLugar], [nomLugar]) VALUES (N'21', N'Trapiche Sala de Juntas');
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
DBCC CHECKIDENT(N'[dbo].[tblmarca]', RESEED, 2)
GO

-- ----------------------------
-- Records of tblmarca
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblmarca] ON
GO
INSERT INTO [dbo].[tblmarca] ([idMarca], [nomMarca]) VALUES (N'2', N'Apple');
GO
INSERT INTO [dbo].[tblmarca] ([idMarca], [nomMarca]) VALUES (N'1', N'N/A');
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
[nomPuesto] varchar(60) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tblpuesto]', RESEED, 46)
GO

-- ----------------------------
-- Records of tblpuesto
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblpuesto] ON
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'2', N'Asistente de Dirección');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'26', N'Atención a Comunidades');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'20', N'Atención a Usuarios');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'28', N'Atención Escolar');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'24', N'Audio e Iluminación');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'14', N'Auxiliar de Diseño Gráfico');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'34', N'Auxiliar de Mantenimiento Especial');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'38', N'Auxiliar de Museografía');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'37', N'Auxiliar de Obra Trapiche Museo Interactivo');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'36', N'Auxiliar de Recursos Humanos');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'10', N'Auxiliar de Servicios Generales');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'22', N'Auxiliar de Soporte Tecnico');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'18', N'Camarógrafo y Editor de Video');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'7', N'Chofer de autobus Institucional');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'4', N'Coordinadora');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'35', N'Coordinadora Operativa');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'45', N'departamento de electronica');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'25', N'Departamento de Electrónica');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'5', N'Departamento de Ingresos y Egresos');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'41', N'Departamento de Ingresos y Engresos');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'40', N'Desarrollador junior');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'23', N'Desarrollo e Innovación');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'1', N'Directora Ejecutiva');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'30', N'Diseño Instruccional');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'15', N'Editor Web y Redes Sociales');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'16', N'Fotografía y Diseño Gráfico');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'13', N'Imagén Institucional');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'19', N'Información y Comunicación Insitucional');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'27', N'Instructor');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'29', N'Instructor de Tecnología Educativa');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'11', N'Intendencia Especial');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'6', N'Jefe de Departamento');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'12', N'Logística');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'3', N'Mantenimiento');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'21', N'Mercadotecnia y Servicios');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'33', N'Promotor e Instructor de Arte y Cultura');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'43', N'Recursos Humanos');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'42', N'Recursos Materiales');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'8', N'Responsable de Seguridad y Primeros Auxilios');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'32', N'Salón de la Ciencia');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'9', N'Seguridad Interna');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'39', N'Servicios Generales');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'31', N'Tecnología Educativa');
GO
INSERT INTO [dbo].[tblpuesto] ([idPuesto], [nomPuesto]) VALUES (N'17', N'Terminados y Logística ');
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
INSERT INTO [dbo].[tblrequerimientoaevento] ([evento], [requerimiento], [cantidad]) VALUES (N'1', N'2', N'1');
GO
INSERT INTO [dbo].[tblrequerimientoaevento] ([evento], [requerimiento], [cantidad]) VALUES (N'1', N'3', N'1');
GO
INSERT INTO [dbo].[tblrequerimientoaevento] ([evento], [requerimiento], [cantidad]) VALUES (N'1', N'4', N'1');
GO

-- ----------------------------
-- Table structure for [dbo].[tblrequerimientos]
-- ----------------------------
DROP TABLE [dbo].[tblrequerimientos]
GO
CREATE TABLE [dbo].[tblrequerimientos] (
[idRequerimientos] int NOT NULL IDENTITY(1,1) ,
[tipo] varchar(25) NULL ,
[nomRequerimiento] varchar(50) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tblrequerimientos]', RESEED, 4)
GO

-- ----------------------------
-- Records of tblrequerimientos
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblrequerimientos] ON
GO
INSERT INTO [dbo].[tblrequerimientos] ([idRequerimientos], [tipo], [nomRequerimiento]) VALUES (N'1', N'Cuantificable', N'Sillas');
GO
INSERT INTO [dbo].[tblrequerimientos] ([idRequerimientos], [tipo], [nomRequerimiento]) VALUES (N'2', N'Cuantificable', N'Cañon');
GO
INSERT INTO [dbo].[tblrequerimientos] ([idRequerimientos], [tipo], [nomRequerimiento]) VALUES (N'3', N'Cuantificable', N'Laptop');
GO
INSERT INTO [dbo].[tblrequerimientos] ([idRequerimientos], [tipo], [nomRequerimiento]) VALUES (N'4', N'Cuantificable', N'Apuntador');
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

-- ----------------------------
-- Records of tblresponsablequipo
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblresponsablequipo] ON
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
DBCC CHECKIDENT(N'[dbo].[tblrespuesta]', RESEED, 18)
GO

-- ----------------------------
-- Records of tblrespuesta
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblrespuesta] ON
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'1', N'1', N'1', N'3');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'2', N'1', N'2', N'3');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'3', N'1', N'3', N'3');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'4', N'10', N'1', N'1');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'5', N'10', N'2', N'1');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'6', N'10', N'3', N'1');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'7', N'10', N'1', N'2');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'8', N'10', N'2', N'2');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'9', N'10', N'3', N'2');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'10', N'1', N'1', N'9');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'11', N'1', N'2', N'9');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'12', N'1', N'3', N'9');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'13', N'5', N'1', N'10');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'14', N'5', N'2', N'10');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'15', N'8', N'3', N'10');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'16', N'10', N'1', N'12');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'17', N'9', N'2', N'12');
GO
INSERT INTO [dbo].[tblrespuesta] ([idRespuesta], [valorRespuesta], [pregunta], [calidadServicio]) VALUES (N'18', N'10', N'3', N'12');
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

-- ----------------------------
-- Records of tbltipoequipo
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tbltipoequipo] ON
GO
INSERT INTO [dbo].[tbltipoequipo] ([idTipoEquipo], [nomTipoEquipo], [siMonitor], [siEquipo], [siDiscoDuro], [siMouse], [siTeclado], [siRed], [siRAM], [siProcesador]) VALUES (N'1', N'Tablet', N'0', N'1', N'1', N'0', N'0', N'0', N'0', N'0');
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
DBCC CHECKIDENT(N'[dbo].[tbltipoincidencia]', RESEED, 5)
GO

-- ----------------------------
-- Records of tbltipoincidencia
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tbltipoincidencia] ON
GO
INSERT INTO [dbo].[tbltipoincidencia] ([idTipoIncidente], [nomTipoIncidente]) VALUES (N'4', N'Correo');
GO
INSERT INTO [dbo].[tbltipoincidencia] ([idTipoIncidente], [nomTipoIncidente]) VALUES (N'3', N'Hardware');
GO
INSERT INTO [dbo].[tbltipoincidencia] ([idTipoIncidente], [nomTipoIncidente]) VALUES (N'1', N'Red');
GO
INSERT INTO [dbo].[tbltipoincidencia] ([idTipoIncidente], [nomTipoIncidente]) VALUES (N'2', N'Software');
GO
INSERT INTO [dbo].[tbltipoincidencia] ([idTipoIncidente], [nomTipoIncidente]) VALUES (N'5', N'Telefonia');
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
[nomCompleto] varchar(80) NULL ,
[nomUsuario] varchar(25) NOT NULL ,
[password] varchar(25) NOT NULL ,
[tipoUsuario] int NOT NULL ,
[depto] int NOT NULL ,
[exTel] varchar(5) NULL DEFAULT ((0)) ,
[area] int NOT NULL ,
[puesto] int NOT NULL ,
[correo] varchar(50) NOT NULL ,
[institucion] int NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tblusuarios]', RESEED, 50)
GO

-- ----------------------------
-- Records of tblusuarios
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tblusuarios] ON
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'1', N'S/A', N'S/A', N'S/A', N'0', N'1', N'1', N'1', N'1', N'SA@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'2', N'Jorge Enrique Cañedo García', N'jcañedo', N'str123', N'0', N'1', N'115', N'1', N'1', N'jcanedo@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'3', N'Valeria Alejandra Valdez Rivera', N'vvaldez', N'123', N'1', N'9', N'102', N'12', N'4', N'vvaldez@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'4', N'Thelma Emilene Carrillo González', N'tcarrillo', N'1234', N'1', N'10', N'114', N'10', N'6', N'tcarrillo@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'5', N'Ariathne María Ibarra Javier', N'aibarra', N'123', N'1', N'11', N'204', N'10', N'6', N'aibarra@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'6', N'Fancisco de Jesús Rivera Noriega', N'frivera', N'123', N'1', N'12', N'205', N'12', N'6', N'frivera@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'7', N'Margarita Gil Ramírez', N'mgil', N'maggy1006', N'1', N'12', N'205', N'10', N'39', N'mgil@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'8', N'Obed Evelio López Gámez', N'olopez', N'123', N'1', N'12', N'119', N'28', N'3', N'olopez@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'9', N'Blanca de Jesús Solano Hernandez', N'bsolano', N'S1stemas2014', N'0', N'17', N'209', N'14', N'4', N'bsolano@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'10', N'Alejandro Osuna Iza', N'aosuna', N'jm220284', N'0', N'17', N'115', N'14', N'6', N'aosuna@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'11', N'Abigail Gamez', N'agamez', N'1', N'0', N'16', N'115', N'14', N'22', N'agamez@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'12', N'Blanca Solano', N'bsolanoh', N'S1stemas2014', N'1', N'16', N'115', N'13', N'4', N'bsolano@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'13', N'Jesús Alberto Ocaña Acosta', N'jocaña', N'jaoa123', N'0', N'17', N'', N'1', N'40', N'jocana@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'14', N'Jorge Cañedo', N'jcanedo', N'str123', N'1', N'16', N'115', N'14', N'6', N'jcanedo@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'15', N'Rosa Irma Peñuelas Castro', N'rosairma', N'123', N'1', N'3', N'105', N'15', N'1', N'rosairma@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'16', N'Mayte Maribel Javalera Holguín', N'mjavalera', N'123', N'1', N'4', N'108', N'15', N'2', N'mjavalera@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'17', N'Diana Celina  García Lugo', N'dcgarcia', N'123', N'1', N'1', N'103', N'30', N'4', N'dcgarcia@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'18', N'Grace García Félix', N'ggarcia', N'123', N'1', N'2', N'202', N'31', N'4', N'ggarcia@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'19', N'Adelina Rosas Leyva', N'arosas', N'123', N'1', N'5', N'211', N'31', N'41', N'arosas@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'20', N'Ana Laura Sánchez Heredia', N'lsanchez', N'123', N'1', N'6', N'101', N'32', N'4', N'lsanchez@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'21', N'Ana Laura Burgos  Santana', N'aburgos', N'123', N'1', N'7', N'113', N'32', N'42', N'aburgos@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'22', N'Nubia Sandoval Gonzales', N'nsandoval', N'123', N'1', N'8', N'118', N'12', N'43', N'nsandoval@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'24', N'Jose Alfredo Solórzano Vázquez', N'jsolorzano', N'123', N'1', N'9', N'204', N'33', N'8', N'jsolorzano@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'25', N'Roxana Sosa Peña', N'rsosa', N'123', N'1', N'13', N'106', N'8', N'4', N'rsosa@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'26', N'Santos Rivas Cota', N'srivas', N'123', N'1', N'12', N'205', N'28', N'10', N'srivas@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'28', N'Marisol Soto Estrada', N'msoto', N'123', N'1', N'14', N'109', N'17', N'13', N'msoto@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'29', N'Omar de Jesus Corrales', N'ocorrales', N'123', N'1', N'14', N'109', N'17', N'14', N'ocorrales@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'30', N'Joel Leal Lugo', N'jleal', N'123', N'1', N'14', N'109', N'8', N'15', N'jleal@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'31', N'Ana Aracely Ramírez Polo', N'aramirez', N'123', N'1', N'14', N'109', N'8', N'16', N'aramirez@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'32', N'Juan Francisco Sauceda López', N'jsauceda', N'123', N'1', N'14', N'109', N'8', N'17', N'jsauceda@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'33', N'Jesús Antonio Chávez Lizárraga', N'jchavez', N'123', N'1', N'14', N'112', N'8', N'18', N'jchavez@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'34', N'Carlos López Molina', N'clopez', N'123', N'1', N'14', N'112', N'8', N'18', N'clopez@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'35', N'Brigido Hernández Astorga', N'bhernandez', N'123', N'1', N'14', N'112', N'8', N'19', N'bhernandez@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'36', N'María Luisa Vega Sotomayor', N'mlvega', N'123', N'1', N'15', N'200', N'24', N'6', N'mlvega@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'37', N'Elena Marcela González Almodobar', N'egonzalez', N'123', N'1', N'15', N'100', N'35', N'20', N'egonzalez@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'38', N'Abigail Soto Fernández', N'asoto', N'123', N'1', N'15', N'117', N'24', N'21', N'asoto@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'39', N'Cristian Pedro Armenta Guerrero', N'carmenta', N'123', N'0', N'25', N'110', N'27', N'45', N'carmenta@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'40', N'Rolando Omar Ríos Montoya', N'orios', N'123', N'0', N'25', N'201', N'6', N'24', N'orios@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'41', N'Chinthya Ibarra López', N'cibarra', N'123', N'1', N'18', N'104', N'18', N'4', N'cibarra@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'42', N'Rosa Irene Gil Mndoza', N'rgil', N'123', N'1', N'19', N'208', N'36', N'26', N'rgil@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'43', N'Daniela Mendivil Flores', N'dmendivil', N'123', N'1', N'19', N'206', N'13', N'27', N'dmendivil@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'44', N'Daniela María Higuera Morado', N'dmorado', N'123', N'1', N'18', N'208', N'3', N'28', N'dmorado@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'45', N'Gerardo López Romero', N'gromero', N'123', N'1', N'18', N'203', N'37', N'6', N'gromero@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'46', N'Joel Elpidio Romero Gómez', N'jeromero', N'123', N'1', N'20', N'', N'37', N'27', N'jeromero@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'47', N'Berenice Vega Camacho', N'bvega', N'123', N'1', N'20', N'117', N'1', N'27', N'bvega@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'48', N'Roxana Denisse Cota Mora', N'rcota', N'123', N'1', N'20', N'203', N'37', N'30', N'rcota@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'49', N'Jesus Alberto Mendivil Ochoa', N'amendivil', N'123', N'1', N'20', N'', N'37', N'31', N'amendivil@cie.org.mx', N'1');
GO
INSERT INTO [dbo].[tblusuarios] ([idUsuario], [nomCompleto], [nomUsuario], [password], [tipoUsuario], [depto], [exTel], [area], [puesto], [correo], [institucion]) VALUES (N'50', N'Enrique Miguel Bermúdez Álvarez', N'ebermudez', N'123', N'1', N'21', N'203', N'38', N'6', N'ebermudez@cie.org.mx', N'1');
GO
SET IDENTITY_INSERT [dbo].[tblusuarios] OFF
GO

-- ----------------------------
-- View structure for [dbo].[cantidadincidentespordepto]
-- ----------------------------
DROP VIEW [dbo].[cantidadincidentespordepto]
GO
CREATE VIEW [dbo].[cantidadincidentespordepto] AS 
SELECT
dbo.ViewUsuarios.nomDepto AS Departamento,
Count(dbo.VistaIncidentes.numIncidente) AS Cantidad

FROM
dbo.ViewUsuarios
INNER JOIN dbo.VistaIncidentes ON dbo.ViewUsuarios.idUsuario = dbo.VistaIncidentes.idSolicitante
WHERE
dbo.VistaIncidentes.status = 2
GROUP BY
dbo.ViewUsuarios.nomDepto
GO

-- ----------------------------
-- View structure for [dbo].[ViewCoordinacion]
-- ----------------------------
DROP VIEW [dbo].[ViewCoordinacion]
GO
CREATE VIEW [dbo].[ViewCoordinacion] AS 
SELECT
dbo.tblcoordinacion.idCoordinacion,
dbo.tblcoordinacion.nomCoordinacion

FROM
dbo.tblcoordinacion
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
-- View structure for [dbo].[ViewMarca]
-- ----------------------------
DROP VIEW [dbo].[ViewMarca]
GO
CREATE VIEW [dbo].[ViewMarca] AS 
SELECT
dbo.tblmarca.idMarca,
dbo.tblmarca.nomMarca

FROM
dbo.tblmarca
GO

-- ----------------------------
-- View structure for [dbo].[ViewRequerimientos]
-- ----------------------------
DROP VIEW [dbo].[ViewRequerimientos]
GO
CREATE VIEW [dbo].[ViewRequerimientos] AS 
SELECT
dbo.tblrequerimientos.idRequerimientos,
dbo.tblrequerimientos.tipo,
dbo.tblrequerimientos.nomRequerimiento

FROM
dbo.tblrequerimientos
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
dbo.tblusuarios.nomCompleto,
dbo.tblusuarios.nomUsuario,
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
dbo.tblusuarios.nomCompleto,
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
-- View structure for [dbo].[VistaEventos]
-- ----------------------------
DROP VIEW [dbo].[VistaEventos]
GO
CREATE VIEW [dbo].[VistaEventos] AS 
SELECT
dbo.tblevento.idEvento,
dbo.tblevento.descripcion,
uSolicitante.nomCompleto AS solicitante,
uResponsable.nomUsuario AS responsable,
uApoyo.nomUsuario AS apoyo,
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
GO

-- ----------------------------
-- View structure for [dbo].[VistaIncidentes]
-- ----------------------------
DROP VIEW [dbo].[VistaIncidentes]
GO
CREATE VIEW [dbo].[VistaIncidentes] AS 
SELECT
dbo.tblincidente.numIncidente,
dbo.tblincidente.descripcion,
uSolicitante.nomCompleto AS solicitante,
dbo.tblincidente.prioridad,
dbo.tblincidente.fecha_Sol,
dbo.tblincidente.status,
dbo.tblincidente.horaIn,
dbo.tblincidente.horaFn,
dbo.tblincidente.fecha_Cierre,
uSoporte.nomUsuario AS soporte,
dbo.tblincidente.acciones,
dbo.tblincidente.solucion,
uSeguimiento.nomUsuario AS seguimiento,
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
-- Procedure structure for [dbo].[cerrarIncidente]
-- ----------------------------
DROP PROCEDURE [dbo].[cerrarIncidente]
GO
CREATE PROCEDURE [dbo].[cerrarIncidente]

@idIn int,
@Tipo int,
@Acci varchar,
@Solu varchar


AS
BEGIN
UPDATE [dbhelpdesk].[dbo].[tblincidente]
   SET [tipo] = @Tipo
      ,[status] = 3
      ,[horaFn] = CURRENT_TIMESTAMP
      ,[fecha_Cierre] = GETDATE()
      ,[acciones] = @Acci
      ,[solucion] = @Solu
 WHERE [tipo] = @idIn
END

GO

-- ----------------------------
-- Procedure structure for [dbo].[EventosXStatus]
-- ----------------------------
DROP PROCEDURE [dbo].[EventosXStatus]
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EventosXStatus]

@status int

AS
BEGIN
SELECT * FROM tblevento 
WHERE status = @status
END

GO

-- ----------------------------
-- Procedure structure for [dbo].[IncidentesXStatus]
-- ----------------------------
DROP PROCEDURE [dbo].[IncidentesXStatus]
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[IncidentesXStatus]

@status int

AS
BEGIN
SELECT * FROM tblincidente 
WHERE status = @status
END

GO

-- ----------------------------
-- Procedure structure for [dbo].[insertarIncidente]
-- ----------------------------
DROP PROCEDURE [dbo].[insertarIncidente]
GO
CREATE PROCEDURE [dbo].[insertarIncidente]

@Tipo int,
@Desc varchar,
@Soli int,
@Prio varchar,
@Stat int

AS
BEGIN
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
           (@Tipo
           ,@Desc
           ,@Soli
           ,@Prio
           ,GETDATE()
           ,@Stat
           ,CURRENT_TIMESTAMP
           ,NULL
           ,NULL
           ,1
           ,''
           ,''
           ,1)
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
dbo.tblrequerimientos.tipo

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
-- Procedure structure for [dbo].[UltimoEvento]
-- ----------------------------
DROP PROCEDURE [dbo].[UltimoEvento]
GO
CREATE PROCEDURE [dbo].[UltimoEvento]
AS
BEGIN
SELECT MAX(tblevento.idEvento) 
FROM tblevento
END

GO

-- ----------------------------
-- Indexes structure for table sysdiagrams
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table [dbo].[sysdiagrams]
-- ----------------------------
ALTER TABLE [dbo].[sysdiagrams] ADD PRIMARY KEY ([diagram_id])
GO

-- ----------------------------
-- Uniques structure for table [dbo].[sysdiagrams]
-- ----------------------------
ALTER TABLE [dbo].[sysdiagrams] ADD UNIQUE ([principal_id] ASC, [name] ASC)
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
ALTER TABLE [dbo].[tblusuarios] ADD UNIQUE ([nomUsuario] ASC)
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[tblcalidadservicio]
-- ----------------------------
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
ALTER TABLE [dbo].[tblrespuesta] ADD FOREIGN KEY ([pregunta]) REFERENCES [dbo].[tblpregunta] ([idPregunta]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblrespuesta] ADD FOREIGN KEY ([calidadServicio]) REFERENCES [dbo].[tblcalidadservicio] ([idCalidad_Servicio]) ON DELETE CASCADE ON UPDATE CASCADE
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[tblusuarios]
-- ----------------------------
ALTER TABLE [dbo].[tblusuarios] ADD FOREIGN KEY ([area]) REFERENCES [dbo].[tblarea] ([idArea]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblusuarios] ADD FOREIGN KEY ([depto]) REFERENCES [dbo].[tbldepartamentos] ([idDepto]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblusuarios] ADD FOREIGN KEY ([institucion]) REFERENCES [dbo].[tblinstitucion] ([idInstitucion]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblusuarios] ADD FOREIGN KEY ([puesto]) REFERENCES [dbo].[tblpuesto] ([idPuesto]) ON DELETE CASCADE ON UPDATE CASCADE
GO
