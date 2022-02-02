--MAXDOP.. wieviel CPUS nimmt eine Abfrage her:
--1 oder alle, ausser es wurde ein MAXDOP Wert eingestellt
--Regel: Anzahl der Kerne max 8
--Gut wäre den Kostenschwellwert von 5 auf 25 (OLAP) bzw 50 bei OLTP zu erhöhen
-- neu ab SQL 2016 (Scoped database) kann auch pro DB der MAXDOP definiert werden

--aber auch MAXDOP pro Abfrage möglich

--==> Mehr Kerne pro Abfrage kosten schlichtweg auch mehr CPU Aufwand..!




SELECT Customers.CustomerID, Customers.CompanyName, Customers.ContactName, Customers.ContactTitle, Customers.City, Customers.Country, Orders.EmployeeID, Orders.OrderDate, Orders.Freight, Orders.ShipCity, Orders.ShipCountry, Employees.LastName, Employees.FirstName, Employees.BirthDate, [Order Details].OrderID, 
            [Order Details].ProductID, [Order Details].UnitPrice, [Order Details].Quantity, Products.ProductName, Products.UnitsInStock, Territories.TerritoryDescription, Region.RegionDescription
INTO KU
FROM   Territories INNER JOIN
            Region ON Territories.RegionID = Region.RegionID INNER JOIN
            EmployeeTerritories ON Territories.TerritoryID = EmployeeTerritories.TerritoryID INNER JOIN
            Customers INNER JOIN
            Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
            Employees ON Orders.EmployeeID = Employees.EmployeeID INNER JOIN
            [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
            Products ON [Order Details].ProductID = Products.ProductID ON EmployeeTerritories.EmployeeID = Employees.EmployeeID


insert into ku
select * from ku

set statistics io, time off


alter table ku add id int identity --6 sekunden


set statistics io, time on
--HEAP:
select * from ku where id = 100

--Im Plan : Paralellismus verwendet
select country, city, sum(unitprice*quantity)
from ku
group by country, city option (maxdop 1)

--war es ok.. mehr CPUs einzusetzen?
--, CPU-Zeit = 581 ms, verstrichene Zeit = 98 ms.--lohnt sich

--,mit 1 Kernen: , CPU-Zeit = 297 ms, verstrichene Zeit = 294 ms.

select country, city, sum(unitprice*quantity)
from ku
group by country, city option (maxdop 6)

--mit weniger Kernen gleich schnell aber weniger CPU Aufwand
--Einstellbar:  
--Kostenschwellwert: 5 ..sehr niedrig
--Maxdop = Anzahl der Kerne, aber maximal 8

--es gilt immer der MAXDOP Wert der am nachsten an der Abfrage definiert wurde
--Server 8    DB 4  Abfrage 1 --> 1

--Server 4   DB 6  Abfrage 0 --> 6

----Server 4   DB 0  Abfrage 0 --> 4




