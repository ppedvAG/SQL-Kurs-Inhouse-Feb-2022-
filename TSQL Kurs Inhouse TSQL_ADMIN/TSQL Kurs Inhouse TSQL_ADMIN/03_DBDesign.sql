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