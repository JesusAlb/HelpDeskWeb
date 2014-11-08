--Script de instalación de registros para el sistema Help Desk IMCA--

--Alta de coordinacion (1)
INSERT INTO [dbhelpdesk].[dbo].[tblcoordinacion]
           ([nomCoordinacion])
     VALUES
           ('Desarrollo Tecnológico e Innovación')
GO
-- Alta de departamento (1.1)
INSERT INTO [dbhelpdesk].[dbo].[tbldepartamentos]
           ([nomDepto]
           ,[coordinacion])
     VALUES
           ('Soporte Tecnológico y Redes',1)
GO
----------- Alta de la Coordinación de Gestión de Calidad y Seguridad, con sus departamentos que lo integran -----------------
-- Alta de coordinación (2) --
INSERT INTO [dbhelpdesk].[dbo].[tblcoordinacion]
           ([nomCoordinacion])
     VALUES
           ('Gestión de Calidad y Seguridad')
GO
--Alta de departamento (2.1) --
INSERT INTO [dbhelpdesk].[dbo].[tbldepartamentos]
           ([nomDepto]
           ,[coordinacion])
     VALUES
           ('Gestión de Calidad y Seguridad',2)
GO
-- Alta de departamento (2.2) --
INSERT INTO [dbhelpdesk].[dbo].[tbldepartamentos]
           ([nomDepto]
           ,[coordinacion])
     VALUES
           ('Procesos y Certificación',2)
GO
-- Alde del departamento (2.3)
INSERT INTO [dbhelpdesk].[dbo].[tbldepartamentos]
           ([nomDepto]
           ,[coordinacion])
     VALUES
           ('Mantenimiento y Servicios Generales',2)
GO
----------------------------------------------------------------------------------------------------------------------------------

--Alta de áreas
INSERT INTO [dbhelpdesk].[dbo].[tblarea]
           ([nomArea])
     VALUES
           ('Desarrollo e Innovación')
GO
--Alta de puestos
INSERT INTO [dbhelpdesk].[dbo].[tblpuesto]
           ([nomPuesto])
     VALUES
           ('Jefe de Departamento')
GO 

-------------------------------------------- Alta de instituciones ------------------------------------------
-- Alta del Centro de Innovación y Educación--
INSERT INTO [dbhelpdesk].[dbo].[tblinstitucion]
           ([nomInstitucion]
           ,[correoInstitucion]
           ,[status])
     VALUES
           ('Centro de Innovación y Educación'
           ,'cie.org.mx', 1)
GO
-- Alta del Trapiche --
INSERT INTO [dbhelpdesk].[dbo].[tblinstitucion]
           ([nomInstitucion]
           ,[correoInstitucion]
           ,[status])
     VALUES
           ('Trapiche Museo Interactivo'
           ,'trapiche.org.mx', 1)
GO
-- Alta de IMCA --
INSERT INTO [dbhelpdesk].[dbo].[tblinstitucion]
           ([nomInstitucion]
           ,[correoInstitucion]
           ,[status])
     VALUES
           ('Impulsora de la Cultura y de las Artes IAP'
           ,'imcaiap.org.mx', 1)
GO
-----------------------------------------------------------------------------------------------------------

--Alta del usuario por defecto
INSERT INTO [dbhelpdesk].[dbo].[tblusuarios]
           ([nombre]
					 ,[apellidos]
           ,[username]
           ,[password]
           ,[tipoUsuario]
           ,[depto]
           ,[exTel]
           ,[area]
           ,[puesto]
           ,[correo]
           ,[institucion])
     VALUES
           ('Sin'
           ,'asignar'
           ,'S/A'
					 ,'1'
           ,0
           ,1
           ,1
           ,1
           ,1
           ,'SA@cie.org.mx'
           ,1)
GO
-- Alta del jefe de departamento de soporte 
INSERT INTO [dbhelpdesk].[dbo].[tblusuarios]
           ([nombre]
					 ,[apellidos]
           ,[username]
           ,[password]
           ,[tipoUsuario]
           ,[depto]
           ,[exTel]
           ,[area]
           ,[puesto]
           ,[correo]
           ,[institucion])
     VALUES
           ('Jorge Enrique'
           ,'Cañedo García'
					 ,'jcanedo'
           ,'1'
           ,0
           ,1
           ,1
           ,1
           ,1
           ,'jcanedo@cie.org.mx'
           ,1)
GO
--Alta de tipos de equipos
INSERT INTO [dbhelpdesk].[dbo].[tbltipoequipo]
           ([nomTipoEquipo]
           ,[siMonitor]
           ,[siEquipo]
           ,[siDiscoDuro]
           ,[siMouse]
           ,[siTeclado]
           ,[siRed]
           ,[siRAM]
           ,[siProcesador])
     VALUES
           ('Desktop'
           ,1
           ,1
           ,1
           ,1
           ,1
           ,1
           ,1
           ,1)
GO
-- Alta de marca por defecto
INSERT INTO [dbhelpdesk].[dbo].[tblmarca]
           ([nomMarca])
     VALUES
           ('N/A')
GO
-- Alta de marcas
INSERT INTO [dbhelpdesk].[dbo].[tblmarca]
           ([nomMarca])
     VALUES
           ('Apple')
GO
-- Alta del tipo de incidente por defecto
INSERT INTO [dbhelpdesk].[dbo].[tbltipoincidencia]
           ([nombre])
     VALUES
           ('General')
GO
-- Alta de los tipos de incidentes más comunes
INSERT INTO [dbhelpdesk].[dbo].[tbltipoincidencia]
           ([nombre])
     VALUES
           ('Hardware')
GO
INSERT INTO [dbhelpdesk].[dbo].[tbltipoincidencia]
           ([nombre])
     VALUES
           ('Software')
GO
INSERT INTO [dbhelpdesk].[dbo].[tbltipoincidencia]
           ([nombre])
     VALUES
           ('Red')
-- Alta de los lugares para eventos
INSERT INTO [dbhelpdesk].[dbo].[tbllugar]
           ([nomLugar])
     VALUES
           ('Sala de Diálogos')
GO
-- Alta de un requerimiento para evento
INSERT INTO [dbhelpdesk].[dbo].[tblrequerimientos]
           ([tipo]
           ,[nombreReq])
     VALUES
           (1
           , 'Sillas')
GO



