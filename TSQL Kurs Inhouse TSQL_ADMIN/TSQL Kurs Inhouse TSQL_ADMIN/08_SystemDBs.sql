--SystemDBs..

/*
master
Logins, Datenbanken, Konfiguration
Backup: jaaah!


model
create database KopiederModel
Wiederherstellungsmodel
-- Umfang von dem , was ins TLog geschrieben wird
Kompabilit�tslevel
USE [master]
GO
ALTER DATABASE [model] SET RECOVERY BULK_LOGGED WITH NO_WAIT
GO

Backup Model:  im Prinzip 


msdb
..f�r den Agent (Jobs, Verlauf, Emailsystem; Warnungen)
Backup: jaaaahhh!




tempdb
#tab ##tab
Zeilenversionierung....

Backup: no




*/