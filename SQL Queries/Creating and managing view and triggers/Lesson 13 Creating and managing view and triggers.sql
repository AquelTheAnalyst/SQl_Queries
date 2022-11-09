/* 
Name Aquel Daley
Lesson 13 Creating and managing view and triggers
Date 08/25/2022
*/ 

CREATE TABLE Emp_triggers
(
 EmpID INT Primary Key Identity (1000,1) NOT NULL ,
 EmpName VARCHAR(50) NULL,
DeptID Int NULL
);
 Select Top 1 Field1
from TableA A
Order By Field1 ASC

 Declare @Variable1 VARCHAR (50)
 SET @Variable1 = 'Welcome to planet earth' 


 CREATE TABLE TABLE1(Field1 INT,Field2 Datetime,Field3 varchar(500))
Insert into TABLE1
values (34, '1/19/2012 08:00 AM', 'Mars Saturn'),
 (65,'2/15/2012 10:30 AM', 'Big Bright Sun'),
 (89 , '3/31/2012 09:15 PM', 'Red Hot Mercury')

UPDATE TABLE1
SET Field3 = 'Welcome to planet earth'
WHERE Field1 = 34
SELECT SUBSTRING (Field3, CHARINDEX(' ',Field3)+1,7)
FROM TABLE1
where Field1 = 65

Select DATETIME Field2
From TABLE1
Where Field1 = + ('/01' ) 

Select Field2
From TABLE1
Where Field1 = 34

Select Field2 Datetime
From TABLE1
Where DatePart (Date, Datetime)=34

SELECT TABLE1
FROM TABLE1
WHERE Field1 day('2012-01-19 08:00:00.000')=34 and Month(Field2 )
=34

Select *
from TABLE1 



Create Table Emphistory
 (
 EmpID INT null,
 DeptID INT NULL ,
 ISACTIVE INT NULL
 )


 CREATE TRIGGER TrgEmpAfterinsert
 ON Emp_triggers
 for Insert
 As
DECLARE @EmpID INT
DECLARE @DptID INT
DECLARE @ISACTIVE INT
SELECT @EmpID = i.Empid from inserted i
SELECT @DptID = i.DeptID from inserted i
SELECT @Isactive = 1
INSERT INTO Emphistory
VALUES (@EmpID, @DptID, @ISACTIVE)
Print 'After insert trigger fired' 


CREATE TRIGGER TrgEmpAfterUpdate
 ON Emp_triggers
 for UPDATE
 AS
 DECLARE @EmpID INT
DECLARE @DptID INT
INSERT INTO emphistory (EmpID,DeptID)
 VALUES (@EmpID,@DptID)
 PRINT 'AFTER UPDATE Trigger Fired'
 select *
 from Emp_triggers

 CREATE TRIGGER Trgempafterdelet
 ON Emp_triggers
 FOR DELETE
 AS
 DECLARE @Empid INT
 DECLARE @Dptid INT
 DECLARE @ISACTIVE INt
 SELECT @Empid = d.EmpID from deleted d
 SELECT @Dptid = d.DeptID from deleted d
 SET @ISACTIVE = 0
 INSERT INTO emphistory
 VALUES (@Empid,@Dptid,@ISACTIVE)


 INSERT INTO dbo.emp_triggers
SELECT 'Ali',1000
INSERT INTO dbo.emp_triggers
SELECT 'Buba',1000
INSERT INTO dbo.emp_triggers
SELECT 'Cat',1001
INSERT INTO dbo.emp_triggers
SELECT 'Doggy',1001
INSERT INTO dbo.emp_triggers
SELECT 'Elephant',1002
INSERT INTO dbo.emp_triggers
SELECT 'Fish',1002
INSERT INTO dbo.emp_triggers
SELECT 'George',1003
INSERT INTO dbo.emp_triggers
SELECT 'Mike',1003
INSERT INTO dbo.emp_triggers
SELECT 'Anand',1004
INSERT INTO dbo.emp_triggers
SELECT 'Kishan',1004
DELETE FROM dbo.emp_triggers
 SELECT *
 FROM emphistory 

 CREATE VIEW VW_HumanResourceDepdetel
 As
 SELECT D.DepartmentID,H.BusinessEntityID,D.
[Name],D.GroupName,H.StartDate,H.EndDate,E.LoginID,E.JobTitle,E.Gender
 FROM HumanResources.Department D
 INNER JOIN HumanResources.EmployeeDepartmentHistory H
 ON D.DepartmentID = H.DepartmentID
 INNER JOIN HumanResources.Employee E
 ON H.BusinessEntityID = E.BusinessEntityID
 WHERE H.EndDate IS NOT NULL

 SELECT *
 FROM [dbo].[VW_HumanResourceDepdetel]



 CREATE VIEW VW_AddressDetail
 AS
 SELECT P.StateProvinceCode,P.CountryRegionCode,P.[Name],
LEN(A.AddressLine1)AS Lengthofaddresschar,upper(A.City) As
CITY,A.PostalCode,

 FROM PERSON.StateProvince P
 INNER JOIN Person.Address A
 ON P.StateProvinceID = A.StateProvinceID
 INNER JOIN person.BusinessEntityAddress B
 ON A.AddressID = B.AddressID


 SELECT *
FROM [dbo].[VW_AddressDetail] 


CREATE VIEW VW_Productdescription
 AS

 SELECT P.ProductID,P.[Name],P.Color,
I.Shelf,I.Bin,COUNT(I.Quantity) AS TotalQnt,
 L.LocationID,L.[Name] AS  LocationName,MIN(L.CostRate)As LowerCostrate
 FROM Production.Product P
 INNER JOIN Production.ProductInventory I
 ON P.ProductID = I.ProductID
 INNER JOIN Production.Location L
 ON I.LocationID = L.LocationID
 WHERE Color IS NOT NULL
 GROUP BY P.ProductID,P.[Name],P.Color, I.Shelf,I.Bin,
 L.LocationID,L.[Name]

 SELECT *
 FROM [dbo].[VW_Productdescription] 

 CREATE VIEW VW_PurchaseOrderDetail
 AS

 SELECT P.PurchaseOrderDetailID,COUNT(P.OrderQty)AS
Totalorder,MIN(P.UnitPrice)AS listprice,YEAR(O.OrderDate)As
OrderYear,YEAR(O.ShipDate)AS ShipYear,SUM(O.TotalDue)Totalpayment,
 S.[Name] AS ShipMethod,AVG(S.ShipBase)AS
AverageShipbase,MIN(S.ShipRate)AS MinumemShiprate
 FROM Purchasing.PurchaseOrderDetail P
 INNER JOIN Purchasing.PurchaseOrderHeader O
 ON P.PurchaseOrderID = O.PurchaseOrderID
 INNER JOIN Purchasing.ShipMethod S
 ON S.ShipMethodID = O.ShipMethodID
 WHERE S.[Name] LIKE '%TRANSPORT%'
 AND YEAR(O.OrderDate) = 2013
 GROUP BY P.PurchaseOrderDetailID, S.
[Name],YEAR(O.OrderDate),YEAR(O.ShipDate)
 HAVING SUM(O.TotalDue) > 100000

 SELECT *
 FROM [dbo].[VW_PurchaseOrderDetail] 


 CREATE VIEW VW_SalesPriceAnalysis
 AS
 SELECT D.SalesOrderDetailID,D.ProductID,D.UnitPrice,
 CASE
 WHEN UnitPrice < 2000 THEN 'CHEAP'
WHEN UnitPrice < 3000 THEN 'FAIR'
WHEN UnitPrice < 4000 THEN 'EXPENSIVE'
ELSE 'LUXURY'
 END AS PriceAnalysis, 

  FROM SALES.SalesOrderDetail D
 INNER JOIN SALES.SalesOrderHeader H
 ON D.SalesOrderID = H.SalesOrderID
 INNER JOIN Sales.SalesTerritory T
 ON H.TerritoryID = T.TerritoryID
 WHERE T.CountryRegionCode = 'US'
 AND T.SalesYTD > 4000000

 SELECT *
 FROM [dbo].[VW_SalesPriceAnalysis] 