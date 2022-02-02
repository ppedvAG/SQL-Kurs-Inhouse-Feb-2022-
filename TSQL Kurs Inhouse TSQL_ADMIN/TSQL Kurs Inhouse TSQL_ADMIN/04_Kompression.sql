
--Kompression

--Zeilenkompression oder Seitenkompression pro Tabelle

--zu erwarten: 40 bis 60% Kompression

--kostet CPU dafür Sparen von IO und RAM


'OTTO                          '
'OT TO'

--Zeilen 
--oder Seiten (zuerst Zeilenkompression)


select * into t3 from t1 --1 Sekunde--GO


--vor Kompression
--Neustart:  TaskManager : RAM  SQL Server:  1294---1458

set statistics io, time on
select * from testdb.dbo.t3

--Seiten:   20001  CPU 156   Dauer: 1270

--nach Kompression
--Tabellengröße: sehr viel weniger
--Neustart:  TaskManager : RAM  SQL Server:  gleich---weniger

set statistics io, time on
select * from testdb.dbo.t1 where id = 10

--Seiten:33   weniger  CPU 297    Dauer: 1008

--Kompression nur bei Tabellen, die sich sehr gut komprimieren lasen
--große Archivtabellen , a 20-30%











