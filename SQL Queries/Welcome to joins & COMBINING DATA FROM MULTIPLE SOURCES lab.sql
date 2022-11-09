/*
Name: Aquel Daley
Lesson:  Welcome to joins & COMBINING DATA FROM MULTIPLE SOURCES lab
Date: 8/21/2022
*/








CREATE TABLE dbo.stg_emp2 (EmdID int, EmpName varchar(50))
INSERT INTO dbo.stg_emp2 (EmdID, EmpName)
SELECT 1,'JohnDoe' union
SELECT 2,'JaneDoe' union
SELECT 3,'SallyMae'.

Select * FROM stg_emp2


SELECT * FROM Emp_List

SELECT       stg_emp2.EmdID,
stg_emp2.EmpName
AS"New Employee", 
E.EmpID 
AS"Senority Level" 
FROM   dbo.stg_emp2 
LEFT OUTER JOIN Emp_List E
ON     EmpID = E.EmpID 
WHERE.EmpID IS NULL

SELECT   EmpID 
AS"Current Status",
EmpName AS"Former Employees", 
EmpID
FROM Emp_List
LEFT OUTER JOIN stg_emp2
ON EmpID = EmpID 
WHERE EmpID IS NULL

SELECT * FROM [Sales].[SalesOrderHeader] 
SELECT * FROM [Sales].[CreditCard] 
SELECT   S.SalesOrderID, S.[CreditCardID], C.[CardType] 
FROM[Sales].[SalesOrderHeader] S
Inner JOIN[Sales].[CreditCard] C 
ON S.CreditCardID = C.CreditCardID 
WHERE[CardType] = 'Vista' 
AND S.OrderDate BETWEEN'2012-10-01' AND '2012-10-31'

SELECT * FROM [Sales].[SalesOrderHeader] 

SELECT * FROM [Sales].[CreditCard]
DECLARE @SalesOrders INT
SELECT @SalesOrders = COUNT(*) 
FROM Sales.SalesOrderHeader a
Inner JOIN Sales.CreditCard b
ON a.CreditCardID=b.CreditCardID 
WHERE b.CardType = 'Vista' 
AND a.OrderDate between '2012-10-01' AND '2012-10-31' 
SELECT @SalesOrders AS SalesOrder

SELECT * FROM [Sales].[SalesOrderHeader] 
SELECT * FROM [Sales].[CreditCard]


CREATE FUNCTION fx_VistaCardSalesOrders 
(
@OrderStartDate date = '10/01/2012', 
@OrderEndDate date = '10/31/2012' 
) 
RETURNS TABLE 
AS 
RETURN 

SELECT cc.[CreditCardID], 
COUNT([SalesOrderID]) AS NumberOfSales,
cc.[CardType], so.[OrderDate] 
FROM [Sales].[SalesOrderHeader] so 
JOIN [Sales].[CreditCard] cc 
ON so.CreditCardID = cc.CreditCardID 
WHERE [CardType] = 'Vista' 
AND OrderDate BETWEEN @OrderStartDate AND @OrderEndDate 
GROUP BY cc.[CreditCardID], cc.[CardType],so.OrderDate )
GO

SELECT *
FROM fx_VistaCardSalesOrders('10/01/2012','10/31/2012')
ORDER BY CardType

SELECT * FROM [Sales].[SalesOrderHeader]
SELECT * FROM [Sales].[SalesTerritory] 

SELECT so.[TerritoryID],
 st.[Group],
 SUM(TotalDue) NATGroupTotalRevenue,
 DATEPART(YY, DueDate) DueDate
FROM [Sales].[SalesOrderHeader] so
INNER JOIN [Sales].[SalesTerritory] st
ON so.[TerritoryID] = st.TerritoryID
WHERE [Group] = 'North America'
AND DATEPART(YY, DueDate) BETWEEN 2012 AND 2014
GROUP BY so.[TerritoryID], st.[Group], so.[DueDate]
ORDER BY TerritoryID, DueDate ASC 

SELECT * FROM [Person].[StateProvince]
SELECT * FROM [Sales].[SalesTaxRate] 

SELECT st.[TaxRate], sp.[StateProvinceCode], sp.
[CountryRegionCode]
FROM [Sales].[SalesTaxRate] st
INNER JOIN [Person].[StateProvince] sp
ON st.[StateProvinceID] = sp.[StateProvinceID]
WHERE sp.Name = 'Texas'

SELECT * FROM [Person].[StateProvince]
SELECT * FROM [Sales].[SalesTaxRate] 


DECLARE @TexasTaxRate Table (
 TaxRate smallmoney,
 StateProvinceCode nchar(3),
 CountryRegionCode nchar(3)
 )
INSERT INTO @TexasTaxRate
SELECT st.[TaxRate], sp.[StateProvinceCode], sp.
[CountryRegionCode]
FROM [Sales].[SalesTaxRate] st
INNER JOIN [Person].[StateProvince] sp
ON st.[StateProvinceID] = sp.[StateProvinceID]
WHERE sp.Name = 'Texas'
SELECT *
FROM @TexasTaxRate

CREATE FUNCTION Fx_StateProvTaxInfo (@Name varchar(50))
RETURNS TABLE
AS
RETURN
(
 SELECT st.[TaxRate], sp.[StateProvinceCode], sp.[CountryRegionCode]
 FROM [Sales].[SalesTaxRate] st
 INNER JOIN [Person].[StateProvince] sp
 ON st.StateProvinceID = sp.StateProvinceID
 WHERE sp.[Name] = @Name
) 

SELECT *
FROM [dbo].[Fx_StateProvTaxInfo]('Texas') 

SELECT * FROM [Sales].[SalesOrderDetail]
SELECT * FROM [Production].[Product]

SELECT p.Color, COUNT(Color) AS SalesCnt, SUM(s.OrderQty*s.UnitPrice) AS
SalesAmt
FROM [Production].[Product] p 
INNER JOIN [Sales].[SalesOrderDetail] s
ON p.[ProductID] = s.ProductID
WHERE Color IS NOT NULL
GROUP BY p.Color
HAVING SUM(s.OrderQty*s.UnitPrice) > 5000

SELECT * FROM [Production].[ProductInventory]
SELECT * FROM [Production].[Product]
SELECT * FROM [Production].[Location]
SELECT * FROM [Production].[ProductSubCategory] 


SELECT pr.[ProductID],
 pr.[Name] AS ProductName,
 ps.[Name] AS SubCategoryName,
 pr.Color,
 loc.[Name] AS LocationName,
 COUNT(Quantity) AS InventoryQuantity
FROM [Production].[Product] pr
INNER JOIN [Production].[ProductSubcategory] ps
ON pr.[ProductSubcategoryID] = ps.[ProductSubcategoryID]
INNER JOIN [Production].[ProductInventory] pi
ON pr.[ProductID] = pi.ProductID
INNER JOIN [Production].[Location] loc
ON loc.LocationID = pi.[LocationID]
WHERE Color IS NOT NULL
GROUP BY pr.[ProductID], pr.[Name], ps.[Name], loc.[Name], pr.[Color]
ORDER BY pr.[ProductID]

--------------------------------------------------------