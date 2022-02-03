--INDIZES


/*
CL IX  --  gruppierter IX
= Tabelle in sortierter Form
nur 1 x pro Tabelle
super für Bereichsabfragen , auch git für eindeutige.. aber ihn gibts nur 1x

NON CL IX -- nicht gruppiert
ist eine zus. Menge an Daten 
ca 1000x pro Tabelle
Muss der IX einen Lookup machen ,dann muss die Menge der Ergebnisse sehr klein sein
damit SEEK gemacht wird

sehr klein? unter 1% ohne Lookup kann das auch 90% sein
typische Spalten für "rel wenig":  ID /  PK
Datentyoen: uniqueidentifier select newid()


---------------------------------------
eindeutiger IX !
zusammengesetzter IX !
IX mit eingeschl Spalten !
gefilterte IX !
part IX
ind Sicht
abdeckender IX ! im Plan reiner SEEK
hypothetischer realer IX
------------------------------------------
columnstore ( CL und NON CL)


*/
set statistics io, time on
select * from ku where id = 1200

--TABLE SCAN ?? aber CL IX SCAN
--PK wird autom immer per Oberfläche zum eindeutigen CL IX gemacht 
--ist oft Verschwndung
--PK als CL geändert auf NON CL eindeutig
--Table Scan
select * from best

--HEAP

--CL IX auf OrderDate
set statistics io, time on
select id from ku where id = 100 --94025  TABLE SCAN

--NCL IX--> IX SEEK-->3-->0
select id from ku where id = 100

--NIX IX Seek mit Lookup
select id,  productname from ku where id = 100

--je mehr Lookups detso teurer
select id,  productname from ku where id < 100


select id,  productname from ku where id < 21307-- ab dieser Zahl eine Table Scan
select count(*) from ku
--1,6%

--besser, wenn PrName in IX mit rein
--NIX_ID_PN
select id,  productname from ku where id <1200000 --IX Seek
--auch bei dem..
select id,  productname from ku--- IX SCAN --8800 Seiten statt 94000

--hier wieder Table scan
select id,  productname,orderid from ku where id <23000


--Zusammengestzter wie der NIX_ID_PN kann nicht mehr as 16 Spalten haben
--die Kombi aus den Spalten darf nicht mehr als 900 bytes

--besser IX mit eingeschl Spalten
select id,  productname from ku where id <23000 --warum immer noch der alte



--ideale IX  
--bei or in where kann der SQL Server nichts mehr vorschlagen
select country, city, sum(unitprice*quantity)
from ku
where employeeid = 2 or Freight < 1
group by country, city



SELECT lastname, freight, orderid from ku where freight < 1 and country = 'UK'

--gefilterte iX nur dann , wenn weniger Ebenen!




select * into ku2 from ku

select top 3 * from ku
--Abfrage Umsatz pro Mitarbeiter pro Land, Jahr 1997

select Country, lastname, sum(UnitPrice*quantity) 
from ku
where orderdate between '1.1.1997' and '31.12.1997 23:59:59.996'
group by country, lastname


--KU Tábelle = 1 GB , die KU2 dagegen 6,3 MB --4,3 nach Archivkompression
select Country, lastname, sum(UnitPrice*quantity) 
from ku2
where orderdate between '1.1.1997' and '31.12.1997 23:59:59.996'
group by country, lastname

--Wie jeder IX optimal bei seltenen U I D
-- 








