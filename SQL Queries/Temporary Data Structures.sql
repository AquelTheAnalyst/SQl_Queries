/*
Name: Aquel Daley
Lesson: Temporary Data Structures
Date: 8/20/2022
*/

SELECT BusinessEntityID,LoginID,JobTitle,HireDate
INTO #Employee 
FROM HumanResources.Employee 
WHERE JobTitle LIKE  'Design Engineer' 
AND BusinessEntityID BETWEEN 1 AND 10
SELECT *
FROM #Employee


(
SELECT BusinessEntityID,LoginID,JobTitle,HireDate
 FROM HumanResources.Employee
 WHERE JobTitle LIKE 'Design Engineer'
 AND BusinessEntityID BETWEEN 1 AND 10
 )
 select *
 from CTE, Employee  

 Declare @employee Table (BusinessEntityID INT,
 LoginID nvarchar(256),
 JobTitle nvarchar(50),
 HireDate Date)
 INSERT INTO @employee (BusinessEntityID,LoginID,JobTitle,HireDate)
 SELECT BusinessEntityID,LoginID,JobTitle,HireDate
 FROM HumanResources.Employee
 WHERE JobTitle LIKE 'Design Engineer'
 AND BusinessEntityID BETWEEN 1 AND 10

 SELECT * 
 FROM @employee

 SELECT ProductID,Name,SafetyStockLevel
 INTO #Product
 FROM Production.Product
 WHERE Color IN ('Red','Black')
 AND SafetyStockLevel NOT IN (100,500)
 select *
 from #Product

 WITH CTE_Product (ProductID,Name,SafetyStockLevel)
 AS
 (
 SELECT ProductID,Name,SafetyStockLevel
 FROM Production.Product
 WHERE Color IN ('Red','Black')
 AND SafetyStockLevel NOT IN (100,500)
 )
 SELECT *
 FROM CTE_Product 


 DECLARE @Product Table (ProductID INT,[Name]
nvarchar(50),SafetyStockLevel smallint)
 INSERT INTO @Product
 SELECT ProductID,Name,SafetyStockLevel
 FROM Production.Product
 WHERE Color IN ('Red','Black')
 AND SafetyStockLevel NOT IN (100,500)
 SELECT *
 FROM @Product
GO

SELECT SalesOrderID,COUNT(ProductID)AS
NUMBEROFPRODUCT,SUM(UnitPrice)AS TOTALPRICE
INTO #SALES
FROM SALES.SalesOrderDetail
GROUP BY SalesOrderID
SELECT *
FROM #SALES

WITH CTE_SALES (SalesOrderID,ProductID,UnitPrice)
AS
(
SELECT SalesOrderID,COUNT(ProductID)AS
NUMBEROFPRODUCT,SUM(UnitPrice)AS TOTALPRICE
FROM SALES.SalesOrderDetail
GROUP BY SalesOrderID
)
SELECT *
FROM CTE_SALES

DECLARE @SALES TABLE (SalesOrderID INT, ProductID INT, UnitPrice MONEY)
INSERT INTO @SALES
SELECT SalesOrderID,COUNT(ProductID)AS
NUMBEROFPRODUCT,SUM(UnitPrice)AS TOTALPRICE
FROM SALES.SalesOrderDetail
GROUP BY SalesOrderID
SELECT *
FROM @SALES 

SELECT TerritoryID, Name,CountryRegionCode,[Group]
FROM SALES.SalesTerritory
UNION
SELECT TerritoryID, Name,CountryRegionCode,[Group]
FROM SALES.SalesTerritory

SELECT TerritoryID, Name,CountryRegionCode,[Group]
INTO #SalesTerritory
FROM SALES.SalesTerritory 
WHERE TerritoryID > 10
UNION
SELECT TerritoryID, Name,CountryRegionCode,[Group]
FROM SALES.SalesTerritory
SELECT *
FROM #SalesTerritory 


WITH CTE_SalesTerritory (TerritoryID, Name,CountryRegionCode,[Group])
AS
(
SELECT TerritoryID, Name,CountryRegionCode,[Group]
FROM SALES.SalesTerritory
WHERE TerritoryID > 10
UNION
SELECT TerritoryID, Name,CountryRegionCode,[Group]
FROM SALES.SalesTerritory
)
SELECT *
FROM CTE_SalesTerritory 

DECLARE @SALESTerritory TABLE ( TerritoryID int, Name nvarchar
(50),CountryRegionCode Nvarchar(3),[Group] Nvarchar)
Insert INTO @SALESTerritory
SELECT TerritoryID, [Name],CountryRegionCode,[Group]
FROM SALES.SalesTerritory
UNION
SELECT TerritoryID, Name,CountryRegionCode,[Group]
FROM SALES.SalesTerritory
SELECT *
FROM @SALESTerritory 


SELECT * FROM [Person].[Person]
CREATE TABLE #Person
(
BusinessEntityID INT PRIMARY KEY
IDENTITY (1, 1), 
PersonType NCHAR(2),
FirstName NVARCHAR(50),
LastName NVARCHAR(50)
) 


INSERT INTO #Person ( BusinessEntityID,PersonType, FirstName, LastName )
SELECT [BusinessEntityID], [PersonType],[FirstName], [LastName]
FROM [Person].[Person]
WHERE [BusinessEntityID] <= 15

--SET IDENTITY_INSERT #PERSON OFF
SELECT *
FROM #Person
SELECT [BusinessEntityID], [PersonType],
[FirstName], [LastName]
FROM [Person].[Person]
WHERE [BusinessEntityID] <= 15
DROPTABLE #Person 




 (
 SELECT [BusinessEntityID],
[PersonType], [FirstName], [LastName]
 FROM [Person].[Person]
 WHERE[BusinessEntityID] <= 15
 )
 SELECT *
 FROM CTE_Person



 DECLARE @Person TABLE (BusinessEntityID INT PRIMARY KEY IDENTITY (1, 1),
 PersonType NCHAR(2),
 FirstName NVARCHAR(50),
 LastName NVARCHAR(50)
 )

INSERT INTO @Person ([PersonType],[FirstName],[LastName])
SELECT [PersonType],[FirstName],[LastName]
FROM [Person].[Person] 
WHERE [BusinessEntityID] <= 15
SELECT *
FROM @Person 


SELECT * FROM [Sales].[SalesTerritory]
SELECT [TerritoryID], [Name],[CountryRegionCode], [Group], [SalesLastYear]
INTO #SalesTerritory
FROM [Sales].[SalesTerritory]
WHERE [CountryRegionCode] = 'US'
SELECT *
FROM #SalesTerritory

WITH CTE_SalesTerritory ([TerritoryID], [Name],
[CountryRegionCode], [Group], [SalesLastYear])
AS
(
SELECT TOP 5[SalesLastYear], [TerritoryID], [Name], [CountryRegionCode],
[Group]
FROM [Sales].[SalesTerritory]
WHERE[CountryRegionCode] = 'US'
ORDER BY [SalesLastYear]
ASC
)
SELECT *
FROM CTE_SalesTerritory

DECLARE @SalesTerritory
TABLE ([TerritoryID]
INT, [Name] NVARCHAR(50), [CountryRegionCode] NVARCHAR(3), [Group]
NVARCHAR(50), [SalesLastYear] MONEY)
INSERT INTO @SalesTerritory
SELECT [TerritoryID], [Name],[CountryRegionCode], [Group], [SalesLastYear]
FROM [Sales].[SalesTerritory]
WHERE [CountryRegionCode] = 'US'
SELECT *
FROM @SalesTerritory

SELECT [Group], SUM([SalesLastYear])SalesLastYear
INTO #SalesTerritoryTwo
FROM [Sales].[SalesTerritory]
GROUP BY [Group]
HAVING SUM([SalesLastYear]) > 3500000
SELECT *
FROM #SalesTerritoryTwo

WITH CTE_SalesTerritoryTwo ( [Group], SalesLastYear)
AS
(
SELECT [Group],
SUM([SalesLastYear]) SalesLastYear
FROM [Sales].[SalesTerritory]
GROUP BY [Group]
HAVING
SUM([SalesLastYear]) > 3500000
)
SELECT *
FROM CTE_SalesTerritoryTwo 


DECLARE @SalesTerritoryOne TABLE( [Group] NVARCHAR(50), SalesLastYear
MONEY)
INSERT INTO @SalesTerritoryOne
SELECT [Group], SUM([SalesLastYear])SalesLastYear
FROM [Sales].[SalesTerritory]
GROUP BY [Group]
HAVING SUM([SalesLastYear]) > 3500000
SELECT *
FROM @SalesTerritoryOne 

SELECT [Group],SUM([SalesLastYear])SalesLastYear
INTO #SalesTerritoryOne
FROM [Sales].[SalesTerritory]
GROUP BY [Group]
HAVING SUM([SalesLastYear]) > 3500000
SELECT *
FROM #SalesTerritoryOne WITH CTE_SalesTerritoryOne ( [Group], SalesLastYear)
AS
(
SELECT [Group],
SUM([SalesLastYear]) SalesLastYear
FROM [Sales].[SalesTerritory]
GROUP BY [Group]
HAVING
SUM([SalesLastYear]) > 3500000
)
SELECT *
FROM CTE_SalesTerritoryOne DECLARE @SalesTerritoryOne
TABLE( [Group] NVARCHAR(50), SalesLastYear MONEY)
INSERT INTO @SalesTerritoryOne
SELECT [Group], SUM([SalesLastYear])SalesLastYear
FROM [Sales].[SalesTerritory]
GROUP BY [Group]
HAVING SUM([SalesLastYear]) > 3500000
SELECT *
FROM @SalesTerritoryOneWITH CTE_TerritorySales3 (SalesLastYear, CountryRegionCode,[Group] )
AS
 (
SELECT TOP 3 SUM(SalesLastYear)
AS SalesLastYear,CountryRegionCode ,[Group]
FROM AdventureWorks2019.Sales.SalesTerritory
WHERE [Group] = 'North America' OR [Group] = 'Europe'
GROUP BY CountryRegionCode ,[Group]
HAVING SUM(SalesLastYear) > 1400000 ORDER BY SalesLastYear DESC
 )
SELECT *
FROM CTE_TerritorySales3DECLARE @TerritorySales3 TABLE (CountryRegionCode NVARCHAR(3),
[Group] NVARCHAR(50), SalesLastYear MONEY)
INSERT INTO @TerritorySales3
SELECT CountryRegionCode,[Group] , SUM(SalesLastYear) AS SalesLastYear
FROM AdventureWorks2019.Sales.SalesTerritory
WHERE [Group] = 'North America' OR [Group] = 'Europe'
GROUP BY CountryRegionCode,[Group]
HAVING SUM([SalesLastYear]) > 1400000
SELECT *
FROM @TerritorySales3SELECT BusinessEntityID, AccountNumber, [Name],
SUBSTRING (AccountNumber, CHARINDEX ( '0' ,AccountNumber),
LEN( AccountNumber)) AS AccNumberLastFour
INTO #Vendor
FROM AdventureWorks2019.Purchasing.Vendor
SELECT *
FROM #VendorWITH CTE_Vendor (BusinessEntityID, AccountNumber,
[Name],AccNumberLastFour)
AS
(
SELECT BusinessEntityID, AccountNumber, [Name],
SUBSTRING (AccountNumber, CHARINDEX ( '0'
,AccountNumber ),
LEN(AccountNumber )) AS AccNumberLastFour
FROM AdventureWorks2019.Purchasing.Vendor
)
SELECT *
FROM CTE_VendorDECLARE @Vendor TABLE (
BusinessEntityID INT,
AccountNumber NVARCHAR(15),
[Name] NVARCHAR(50),
AccNumberLastFour NVARCHAR(15)
)INSERT INTO @Vendor (BusinessEntityID, AccountNumber,
[Name],AccNumberLastFour)
SELECT BusinessEntityID, AccountNumber, [Name],
SUBSTRING (AccountNumber, CHARINDEX
( '0',AccountNumber ),
LEN( AccountNumber )) AS AccNumberLastFour
FROM AdventureWorks2019.Purchasing.Vendor
SELECT *
FROM @Vendor SELECT BusinessEntityID, PersonType, UPPER (CONCAT(FirstName,
SPACE(1),LastName)) AS Name
INTO #PersonInfo
FROM AdventureWorks2019.Person.Person
WHERE BusinessEntityID <= 30
SELECT *
FROM #PersonInfoWITH CTE_PersonInfo (BusinessEntityID,PersonType, Name)
AS
(
SELECT BusinessEntityID, PersonType, UPPER
(CONCAT(FirstName, SPACE(1), LastName)) AS Name
FROM AdventureWorks2019.Person.Person
WHERE BusinessEntityID <=30
)
SELECT *
FROM CTE_PersonInfoDECLARE @PersonInfo TABLE(BusinessEntityID INT,PersonType
NCHAR(2), Name NVARCHAR(50))
INSERT INTO @PersonInfo (BusinessEntityID,PersonType, Name)
SELECT BusinessEntityID,PersonType, UPPER (CONCAT(FirstName,
SPACE(1), LastName)) AS Name
FROM AdventureWorks2019.Person.Person
WHERE BusinessEntityID <= 30
SELECT *
FROM @PersonInfo