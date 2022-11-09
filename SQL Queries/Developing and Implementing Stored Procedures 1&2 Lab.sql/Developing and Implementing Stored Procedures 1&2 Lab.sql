/*
Aquel Daley
08/23/2022
Developing and Implementing Stored Procedures 1&2 Lab
*/ 


CREATE PROCEDURE proc_SalesByTerritory
@TerritoryName varchar(50)
AS
BEGIN
SET NOCOUNT ON;
SELECT
t.Name, YEAR(OrderDate) AS Year, SUM(TOTALDUE) AS TotalSales
FROM
Sales.SalesOrderHeader S
LEFT OUTER JOIN Person.StateProvince T
ON S.TerritoryID = T.TerritoryID
WHERE T.Name = @TerritoryName
GROUP BY Name, YEAR(OrderDate)
ORDER BY YEAR(orderdate)
END
EXEC proc_SalesByTerritory Georgia 

CREATE PROCEDURE proc_TerritoryTopssales_Byproduct
@TerritoryName varchar(50)
AS
BEGIN
SET NOCOUNT ON;
DECLARE @YEAR INT
SET @YEAR = (SELECT TOP 1 YEAR(orderdate)
FROM Sales.SalesorderHeader)
CREATE TABLE #Products (TerName varchar(50), Prodname varchar(50),
Totalsales money, [year] int)
INSERT INTO #Products (Tername, Prodname, Totalsales, year)
SELECT t.name, p.Name, SUM(TOTALDUE) Totalsales,YEAR(orderdate) Year
FROM Sales.SalesOrderHeader S
LEFT OUTER JOIN Person.StateProvince t
ON s.TerritoryID = t. TerritoryID
LEFT OUTER JOIN sales.salesorderdetail d
ON S.SalesOrderID =D.SalesOrderID
LEFT OUTER JOIN Production.Product p
ON D.ProductID = p.ProductID
WHERE t.Name = @TerritoryName
GROUP BY t.Name, p.Name, YEAR (Orderdate)
ORDER BY Year (OrderDate) desc, SUM(TotalDue) desc
CREATE TABLE #YearTopSProducts (Tername varchar(50), Prodname
varchar(50), Totalsales money, [Year] int)
WHILE @YEAR IS NOT NULL
BEGIN
INSERT INTO #YearTopSProducts (TerName, Prodname, totalsales, [Year])
SELECT TOP 5 TerName, Prodname, totalsales, [Year]
FROM #Products
WHERE [YEAR] = @YEAR
ORDER BY [year] DESC,Totalsales DESC
DELETE FROM #Products
WHERE [year] = @YEAR
SET @YEAR = (SELECT TOP 1 [YEAR]
 FROM #Products)
END
SELECT * FROM #YearTopSProducts
ORDER BY [Year]
END 



CREATE PROCEDURE proc_findHerID
@empID INT,
@mgrID INT OUTPUT
AS
BEGIN
SET NOCOUNT ON;
SELECT EMP_ID
FROM EMP
WHERE EMP_ID = @empID
END
DECLARE @emp INT = 4
DECLARE @Manager_name varchar(50)
DECLARE @managerID INT
EXEC proc_findHerID @emp,@mgrID=@managerID OUTPUT
SELECT EMP_NAME
FROM EMP
WHERE EMP_ID=@managerID 











CREATE TABLE A
(
FILED1 INT
);
CREATE TABLE B
(
FILED1 INT
);
INSERT INTO A
VALUES ( 1),( 2),( 3),( 4),( 4),( 5),( 6)
INSERT INTO B 
VALUES ( 5),( 5),( 7),( 6),( 3),( 3),( 9)

Create PROCEDURE proc_5
 @SalesOrderID int
AS
BEGIN 
 SET NOCOUNT ON;
 SELECT s.SalesOrderID, s.OrderDate, s.ShipDate, a.City,st.Name
 FROM Sales.SalesOrderHeader s
 INNER JOIN Person.Address a
 ON s.ShipToAddressID = a.AddressID
 INNER JOIN Person.StateProvince st
 ON s.TerritoryID=st.TerritoryID
 WHERE s.SalesOrderID = @SalesOrderID
END 


CREATE PROCEDURE PROC_6
 @TerritoryName VARCHAR(50)
AS
BEGIN
 SELECT ST.[Group] AS [Territory Group], ST.CountryRegionCode,
 COUNT(DISTINCT SOD.SalesOrderID) AS [Count of SalesHeaders],
COUNT(SOH.SalesOrderID) AS [Count of SalesDetails]
 FROM Sales.SalesTerritory ST JOIN Sales.SalesOrderHeader SOH
 ON ST.TerritoryID = SOH.TerritoryID
 JOIN Sales.SalesOrderDetail SOD
 ON SOH.SalesOrderID = SOD.SalesOrderID
 WHERE YEAR(OrderDate) = 2001 AND ST.Name = @TerritoryName
 GROUP BY ST.[Group], ST.CountryRegionCode
END;



CREATE PROCEDURE PROC_7
 @ProductName VARCHAR(50)
AS
BEGIN
 SELECT P.Name AS [Product Name], MIN(SOD.UnitPrice) AS [Lowest Price],
MAX(SOD.UnitPrice) AS [Highest Price],
 COUNT(SOH.SalesOrderID) AS [Count of SalesDetails], SUM(LineTotal) AS
[Sum of LineTotal]
 FROM Production.Product P JOIN Sales.SalesOrderDetail SOD
 ON P.ProductID = SOD.ProductID 
 JOIN Sales.SalesOrderHeader SOH ON SOH.SalesOrderID =
SOD.SalesOrderID
 WHERE P.Name = @ProductName
 GROUP BY P.ProductID, P.Name
END; 



CREATE PROCEDURE PROC_8
 @OrderYear INT
AS
BEGIN
 SELECT YEAR(OrderDate) AS [OrderYear], COUNT(DISTINCT
SOD.SalesOrderID) AS [Count of SalesHeaders],
 COUNT(SOH.SalesOrderID) AS [Count of SalesDetails]
 FROM Sales.SalesOrderHeader SOH JOIN Sales.SalesOrderDetail SOD
 ON SOH.SalesOrderID = SOD.SalesOrderID
 WHERE YEAR(OrderDate) = @OrderYear
 GROUP BY YEAR(OrderDate)
END; 



