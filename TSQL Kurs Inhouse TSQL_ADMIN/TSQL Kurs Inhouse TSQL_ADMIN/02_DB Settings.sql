/*
DB : testdb

Wie gro� ist die DB jetzt per default? 
ab SQL 2016 : 16 MB      8 MB Daten     8 MB Logfile
fr�her                 7MB      5                         2

Wachstum:
ab SQL 2016 :    Daten            Logdatei
                              64MB           64MB
fr�her                      1 MB          10%



REGEL!!!!!
Vermeide IO Aktivit�t
--> keine !!!!



*/
create database testdb;
GO


use testdb;
GO

create table t1 ( id int identity, spx char(4100));
GO


--Frage: Wie gro� ein DS? 4kb

insert into t1
select 'XY'
GO 20000 --11 Sekunden --80MB



select 155*3 --0,5 Sec


create table t2 ( id int identity, spx char(4100));
GO


--Frage: Wie gro� ein DS? 4kb

insert into t2
select 'XY'
GO 20000 --9 Sekunden --80MB

--kein fragm, Datentr�ger


--Fazit: besser wenn keine Vergr��erung
--Aber w�re die ideale Anfangsgr��e?
--Lebenszeit
--Wachstum muss reg. kontrolliert
--Wachstumraten deutlich h�her stellen. 1 GB (auch Logfile)











