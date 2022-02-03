--Transaction und Locks

--so kurz wie möglich

--INS UP  DEL

--Transactions


-- INS UP DEL 

--Sperrniveaus: Zeile, Seite, Block, Partionen, Tabellen, DB
--jede Sperre kostet 91 bytes
--Sperren können nur so granular gesetzt werden, wie sie auch gefunden werden können..

--Indizes helfen...--> Zeilensperre!!


select * into kunden from customers

begin tran
select @@TRANCOUNT
update  kunden set city = 'Landshut' where customerid = 'ALFKI' --nur wenn IX, dann auch die Sperre für den einen Datensatz, sonst komplette Tabelle
select * from kunden

rollback --Rückgängig

commit --Bestätigen


--Alternativplan: Zeilenversionierung

USE [master]
GO
ALTER DATABASE [Northwind] SET READ_COMMITTED_SNAPSHOT ON WITH NO_WAIT
GO

GO
ALTER DATABASE [Northwind] SET ALLOW_SNAPSHOT_ISOLATION ON
GO


--ISOLATION LEVEL
--Ändern hindert Lesen
set transaction isolation level read committed
set transaction isolation level read uncommitted

--Lesen hindert das Ändern (update /delete)
set transaction isolation level repeatable read

--Lesen hindert nun auch zus. INS 
set transaction isolation level serializable







--PK als Gr IX..

--PK hat welche Aufgabe: Beziehungen 

--eindeutig kann auch NGR IX eindeutig

--USER A

use northwind;

--jeder I U D ist immer eine TX, aber du kannst nicht mehr rückgängig machen

begin tran

--Anweisungen

commit  --fixiert
rollback --Rückgängig

begin tran
update customers set city = 'MUC' where customerid = 'ALFKI'
update orders set freight = freight *1.01

select * from customers --zustand für Stadt ist unklar
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
--commit bestätigt nur die aktuelle Transaction

save transaction Innersave
select * from customers2

begin tran M2 with Mark
update customers2 set city = 'Z'
select * from customers2
commit
rollback tran Innersave --alle bei Y

Rollback

--zählt das Transactionlog

--2019 : ADR
























