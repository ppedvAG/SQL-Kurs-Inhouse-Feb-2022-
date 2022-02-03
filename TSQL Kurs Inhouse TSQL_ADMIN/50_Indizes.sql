--INDIZES


/*
CL IX  --  gruppierter IX
= Tabelle in sortierter Form
nur 1 x pro Tabelle
super f�r Bereichsabfragen , auch git f�r eindeutige.. aber ihn gibts nur 1x

NON CL IX -- nicht gruppiert
ist eine zus. Menge an Daten 
ca 1000x pro Tabelle
Muss der IX einen Lookup machen ,dann muss die Menge der Ergebnisse sehr klein sein
damit SEEK gemacht wird

sehr klein? unter 1% ohne Lookup kann das auch 90% sein
typische Spalten f�r "rel wenig":  ID /  PK
Datentyoen: uniqueidentifier select newid()




---------------------------------------
eindeutiger IX
zusammengesetzter IX
IX mit eingeschl Spalten
gefilterte IX
part IX
ind Sicht
abdeckender IX
hypothetischer realer IX
------------------------------------------
columnstore ( CL und NON CL)


*/
set statistics io, time on
select * from ku where id = 1200

--TABLE SCAN ?? aber CL IX SCAN
--PK wird autom immer per Oberfl�che zum eindeutigen CL IX gemacht 
--ist oft Verschwndung
--PK als CL ge�ndert auf NON CL eindeutig
--Table Scan
select * from best