--exec sp_Restore_AdventureDBs
--AdventureWorks2014 kann man sich auf Github besorgen

--SQL Server schätzt F() mit Tabellenvariablen  ein mit 1 oder 100 Ergebniszeilen. Egal wieviel tats drin sind..!
--Der Plan dazu kann also nur suboptimal sein, da  weder 1 noch 100 die Realität wiederspiegelen
-- Arbeitsspeicherschätzung.. CPU steigt etc.... IX Wahl usw..


USE AdventureWorks2014
GO

-- Multi-Statement Table Valued Function
CREATE OR ALTER FUNCTION GetOrdersByCustomer (@CustomerID INT )
RETURNS 
@Result TABLE(SalesOrderID INT, OrderDate DATETIME, 
							SalesOrderNumber VARCHAR(100))
AS
BEGIN
	INSERT INTO @Result
	SELECT SalesOrderID, OrderDate, SalesOrderNumber FROM Sales.SalesOrderHeader
	RETURN
END
GO

-- Set the Compatibility Level to SQL Server 2012
ALTER DATABASE AdventureWorks2014 SET COMPATIBILITY_LEVEL = 110
GO

-- Up to SQL Server 2012 we get an "estimation" of 1 row...
SELECT * FROM dbo.GetOrdersByCustomer(11000)
ORDER BY SalesOrderNumber
GO

-- Set the Compatibility Level to SQL Server 2014
ALTER DATABASE AdventureWorks2014 SET COMPATIBILITY_LEVEL = 120
GO

-- Since SQL Server 2014 we get an "estimation" of 100 rows...
SELECT * FROM dbo.GetOrdersByCustomer(11000)
ORDER BY SalesOrderNumber
GO

-- Set the Compatibility Level to SQL Server 2017
ALTER DATABASE AdventureWorks2014 SET COMPATIBILITY_LEVEL = 140
GO

-- SQL Server 2017 uses now the Interleaved Execution for Multi-Statement Table Valued Functions.
-- And this provides us now finally accurate estimations - 31465 rows!
-- And the Sort Operator doesn't need to spill over to TempDb anymore.
SELECT * FROM dbo.GetOrdersByCustomer(11000)
ORDER BY SalesOrderNumber
GO


ALTER DATABASE AdventureWorks2014 SET COMPATIBILITY_LEVEL = 150

SELECT * FROM dbo.GetOrdersByCustomer(11000)
ORDER BY SalesOrderNumber
GO

-- The Interleaved Execution doesn't work in combination with the CROSS APPLY...




SELECT  top 10000 * FROM Sales.Customer c
CROSS APPLY dbo.GetOrdersByCustomer(c.CustomerID)
GO

-- Clean up
DROP FUNCTION GetOrdersByCustomer
GO