--5.Debe realizar un servidor de auditoría que permita almacenar las transacciones realizadas en la base de datos 5pts



USE master;

--Se crea primero el servidor de la auditoria en el master
CREATE SERVER AUDIT ProyectoBases_Auditoria
    TO FILE (FILEPATH = 'D:\TEC\Bases II\Proyecto\Auditoria') --Donde se van a guardar los archivos
    WITH (QUEUE_DELAY = 1000, ON_FAILURE = CONTINUE);

ALTER SERVER AUDIT ProyectoBases_Auditoria
    WITH (STATE = ON); 

GO


--Se crea la auditoria en la base de datos y especificando que datos se van a enviar
USE ProyectoBases;

CREATE DATABASE AUDIT SPECIFICATION ProyectoBases_AuditSpec
    FOR SERVER AUDIT ProyectoBases_Auditoria
    ADD (SELECT, INSERT, UPDATE, DELETE, EXECUTE ON SCHEMA::[dbo] BY [public]),
	ADD (SELECT, INSERT, UPDATE, DELETE, EXECUTE ON SCHEMA::[application_train] BY [public]),
	ADD (SELECT, INSERT, UPDATE, DELETE, EXECUTE ON SCHEMA::[bureau] BY [public]),
	ADD (SELECT, INSERT, UPDATE, DELETE, EXECUTE ON SCHEMA::[previous] BY [public]),
    ADD (SCHEMA_OBJECT_CHANGE_GROUP),
    ADD (DATABASE_OBJECT_CHANGE_GROUP),
    ADD (DATABASE_PRINCIPAL_CHANGE_GROUP),
    ADD (DATABASE_ROLE_MEMBER_CHANGE_GROUP)
    WITH (STATE = ON);