---
select * into ku4 from ku

set statistics io, time on
select * from ku4 where id < 2 --83088

--mit IX NIX ID ..seek mit Lookup

select * from ku4 where id < 1000000

/*
a) adhoc
b) Sicht 
c) F()
d) Proz

--langsam----> schnell
d  --   c  --- b   ---  a
a -- b --  c--- d
*/


create proc gpsucheId @par int
as
select * from ku4 where id < @par

--erste Aufruf entscheidet

exec gpSucheID 1000000

dbcc freeproccache

exec gpSucheID 1000000 --idelaer mit Tab Scan 83000 statt 1 MIO
exec gpSucheID 2

--welcher Plan wäre auf Dauer besser... Häufigkeit und anzahl der Ergebniszeilen



create proc gpsucheId @par int
as
IF @par < 23000
exec gpSuchid1 --seek
else
exec gpsuchid2 --scan



create proc gpdemo @par int
as
If @par < 100
select * from orders where ....
else
select * from cutomers where..

select * from customers where customerid = 'ALFKI'

exec gpSucheKunden 'ALFKI' -- 1

exec gpSucheKunden 'A' -- 4 alle mit A beginnend

exec gpSucheKunden '%'  -- alle
--customerid nchar(5)


create proc gpSucheKunde @kdid varchar(10)='%'
as
select * from customers where customerid  like @kdid +'%'


exec gpSucheKunde 'ALFKI' --1 IX Seek

exec gpSucheKunde 'A' --1 IX Seek

exec gpSucheKunde  --1 IX Seek





exec gpSucheId 10
waitfor delay '00:00:15'
GO 10




select * from ku4 where id < @par






