set statistics io, time on
--ist automatisch aktiv
--SQL Kann - was bisher nur der Columnstore IX konnte nun auch in "normalen" tabellen

ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ON_ROWSTORE = OFF; --muss natürlich ON sein

--BatchMode. eigtl dem ColumnStore vorbehalten..
--Seit SQL 1019 auch in RowStore verfügbar..
--fall ColStore nicht verwendet werden soll
--nicht bei im tabellen
--auch nicht bei XML oder sparse columns
--Cursor


--Im Plan beobachten und messen.... mal mit ON und mal mit OFF
set statistics io, time on
select customerid, sum(unitprice*quantity) from kundeumsatz group by customerid
