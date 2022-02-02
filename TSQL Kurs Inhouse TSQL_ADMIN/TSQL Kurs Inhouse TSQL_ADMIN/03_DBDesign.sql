/*

Tabellen

Primärschlüssel  -- Beziehung--->Sekundärschl..


Normalisierung  Normalform
1.2.3.4.5


--SHOP

ARTIKEL   ( Bez , ArtNr, Preis)
KUNDEN ( KdNr, Nachnamem Vorname, Ort, Strasse, PLZ, Hnr, GebDatum)
BESTELLUNGEN (BNr, BDatum, Lieferkosten)+ RngSumme
BESTPOS (BPosNr, Bnr, ArtNr, Menge, Preis)

26  10  1 2.2.22 4,99
26  15  2 2.2.22 4,99



Normalisierung ist aber doof, wenn es um Performance geht
Redundanz ist schnell.. muss man halt pflegen
--evtl durch--> Trigger
---> Verbot UID auf BestPos -- SP darf

--> Datawarehouse
--> #tabellen

Datentyen:

'otto'

nvarchar(50)   'otto' 4 *2 =	8
varchar(50)    'Otto'				4
Char(50)          'Otto      '       50
nchar(50)        'Otto       '     2*50 = 100

unicode= Sonderzeichen, andere Sprachen (kana finnish swedish etc..)

unicode oder nicht = egal, da Platz auf der HDD vorhanden

Hat einen Tabelle 100MB , dann auch im RAM 100MB

*/
select country, customerid from customers----defintiv kein UNicod notwendig

select orderdate from orders --auf millisekunden.

--alle Best aus dem Jahr 1997 (orderdate)
--falsch
select * from orders where orderdate between '1.1.1997' and '1.1.1998'
--falsch
select * from orders where  orderdate between '1.1.1997' and '31.12.1997'
--falsches Ergebnis
select * from orders where  orderdate between '1.1.1997' and '31.12.1997 23:59:59.999'

--stimmt, aber mies 
select * from orders where  orderdate like '%1997%'

--stimm aber mies
select * from orders where  year(orderdate) = 1997

--stimmt aber mies
select * from orders where  datepart(yy,orderdate) = 1997

---ms ist nicht genau da datetime nur 2 bis 3 ms genau



..--Physische Design

create table tx (id int, spx char(4100), sp2 varchar(4100))

/*
1 DS mit 4100bytes--> 1 Seiten
1 MIO DS--> 1 MIO Seiten--> 8 GB (HDD und RAM je 8 GB), obwohl nur 4,1 GB


*/

use testdb



--gilt nur in einer Session
set statistics io, time on -- Anzahl der Seiten, CPU Dauer in ms und gesamt Dauer in ms

select * from t1 where id = 10--Lesevorgänge = Seiten = 20000

--20000*8 = 160MB

dbcc showcontig('t1')
--- Gescannte Seiten.........................................: 20000
--- Mittlere Seitendichte (voll).....................: 50.79%
set statistics io, time off


--Massnahmen: 
--Datentypen anpassen
--muss char sein muss n sein

--DB Redesign

--4100 -- 4000 + 100

-- 8GB       2DS/Seite = 500.000 Seiten  + 80DS/Seiten--> 12500--> 110 MB
					--4,1 GB

--geht s auch ohne Anw Redesign?



select count(*) from t1





