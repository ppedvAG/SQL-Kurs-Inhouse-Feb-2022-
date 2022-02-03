--Transaction und Locks

--so kurz wie m�glich

--INS UP  DEL

--Transactions


-- INS UP DEL 

--Sperrniveaus: Zeile, Seite, Block, Partionen, Tabellen, DB
--jede Sperre kostet 91 bytes
--Sperren k�nnen nur so granular gesetzt werden, wie sie auch gefunden werden k�nnen..

--Indizes helfen...--> Zeilensperre!!


select * into kunden from customers

begin tran
select @@TRANCOUNT
update  kunden set city = 'Landshut' where customerid = 'ALFKI' --nur wenn IX, dann auch die Sperre f�r den einen Datensatz, sonst komplette Tabelle
select * from kunden

rollback --R�ckg�ngig

commit --Best�tigen


--Alternativplan: Zeilenversionierung

USE [master]
GO
ALTER DATABASE [Northwind] SET READ_COMMITTED_SNAPSHOT ON WITH NO_WAIT
GO

GO
ALTER DATABASE [Northwind] SET ALLOW_SNAPSHOT_ISOLATION ON
GO


--ISOLATION LEVEL
--�ndern hindert Lesen
set transaction isolation level read committed
set transaction isolation level read uncommitted

--Lesen hindert das �ndern (update /delete)
set transaction isolation level repeatable read

--Lesen hindert nun auch zus. INS 
set transaction isolation level serializable







--PK als Gr IX..

--PK hat welche Aufgabe: Beziehungen 

--eindeutig kann auch NGR IX eindeutig

--USER A

use northwind;

--jeder I U D ist immer eine TX, aber du kannst nicht mehr r�ckg�ngig machen

begin tran

--Anweisungen

commit  --fixiert
rollback --R�ckg�ngig

begin tran
update customers set city = 'MUC' where customerid = 'ALFKI'
update orders set freight = freight *1.01

select * from customers --zustand f�r Stadt ist unklar
rollback


--MARK  save (point)
--MARK .. einen restore
--save --bis zu einen Punkt rollback
select * into customers2 from customers

Begin tran t1
update customers2 set city = 'X'
select * from customers2 

begin tran M1 with Mark
update customers2 set city = 'Y'
select * from customers2

--Rollback --alles wird restored bis zum Ausgangspunkt
--commit best�tigt nur die aktuelle Transaction

save transaction Innersave
select * from customers2

begin tran M2 with Mark
update customers2 set city = 'Z'
select * from customers2
commit
rollback tran Innersave --alle bei Y

Rollback

--z�hlt das Transactionlog

--2019 : ADR
























