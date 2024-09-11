
--10.Deben crear un usuario administrador (con permisos de súper usuario), 
--un usuario normal, el cual solo tendrá acceso a las tablas y funciones. 
--Un usuario respaldo que solo podrá realizar respaldo de base de datos. 5pts

USE ProyectoBases;
GO


--Usuario Administrador
-- Login para el usuario administrador
CREATE LOGIN userAdmin WITH PASSWORD = 'clave123';
GO

-- Usuario administrador en la base de datos
CREATE USER userAdmin FOR LOGIN userAdmin;
GO

-- Permisos de control total al usuario administrador
ALTER ROLE db_owner ADD MEMBER userAdmin;
ALTER SERVER ROLE [sysadmin] ADD MEMBER [userAdmin];
GO




--Usuario Normal
-- Login para el usuario normal
CREATE LOGIN userNormal WITH PASSWORD = 'clave123';
GO

-- Usuario normal en la base de datos 
CREATE USER userNormal FOR LOGIN userNormal;
GO

GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON SCHEMA::dbo TO userNormal;
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON SCHEMA::application_train TO userNormal;
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON SCHEMA::bureau TO userNormal;
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON SCHEMA::previous TO userNormal;






--Usuario Respaldo
-- Login para el usuario respaldo
CREATE LOGIN userBackup WITH PASSWORD = 'clave123';
GO

-- Usuario respaldo en la base de datos
CREATE USER userBackup FOR LOGIN userBackup;
GO

-- Permisos para realizar copias de seguridad de la base de datos
GRANT BACKUP DATABASE TO userBackup;
ALTER ROLE db_backupoperator ADD MEMBER userBackup;