--Script de instalación de registros para el sistema Help Desk IMCA--
--Alta de coordinacion
INSERT INTO [dbhelpdesk].[dbo].[tblcoordinacion]
           ([nomCoordinacion])
     VALUES
           ('Desarrollo Tecnológico e Innovación')
GO
-- Alta de departamento
INSERT INTO [dbhelpdesk].[dbo].[tbldepartamentos]
           ([nomDepto]
           ,[coordinacion])
     VALUES
           ('Soporte Tecnológico y Redes',1)
GO
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
--Alta de la institución
INSERT INTO [dbhelpdesk].[dbo].[tblinstitucion]
           ([nomInstitucion]
           ,[correoInstitucion]
           ,[status])
     VALUES
           ('Centro de Innovación y Educación'
           ,'cie.org.mx', 1)
GO
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
           ,'SA'
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



