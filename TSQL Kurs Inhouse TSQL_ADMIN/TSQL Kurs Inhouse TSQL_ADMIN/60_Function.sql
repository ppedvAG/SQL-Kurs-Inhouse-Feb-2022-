--Warum sind F() schlecht


--aus Tabelle Kundeumsatz suchen wie alle Best aus dem Jahr 1996


select * from KundeUmsatz
where  orderdate between '1.1.1996'  and '31.12.1996 23:59:59.999'


select * from KundeUmsatz
where  year(orderdate) = 1996



--RngSumme
--Im tatsächlichen Plan taucht die Tabelle Order details nicht auf.. !! auch in statistics nicht !!!!!!
--obwohl der größte aufwand genau dort erfolgt...

create function rngSumme (@oid int) returns money
as
begin
return (select sum(UnitPrice*quantity) from [Order Details] where orderid = @oid)
end


alter table orders add RngSumme as dbo.rngsumme(orderid)

set statistics io, time on
select * from orders



select dbo.fRNgSumme(10248)--- 440


select * from [Order Details]












