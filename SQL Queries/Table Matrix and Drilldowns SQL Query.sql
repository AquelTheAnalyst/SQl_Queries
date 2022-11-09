

/*
Name: Aquel Daley
Lesson: Table Matrix and Drilldowns Lab 
Date:09/13/2022
*/


SELECT          OH.SalesOrderID AS SalesOrderID,
                MONTH(OH.OrderDate) AS [Month], OH.TotalDue AS TotalDue,
                ST.[Group] AS [Group], 
                ST.Name AS TerritoryName, SP.Name AS ShipState, 
               (SalesP.FirstName + ' ' + SalesP.LastName) AS SalesRepName
FROM            Sales.SalesOrderHeader OH
INNER JOIN      Sales.SalesTerritory ST
ON              OH.TerritoryID = ST.TerritoryID
INNER JOIN      Sales.vSalesPerson SalesP
ON              OH.SalesPersonID = SalesP.BusinessEntityID
INNER JOIN      [Person].[StateProvince] SP
ON              ST.TerritoryID = SP.TerritoryID
INNER JOIN      [Person].[Address] A
ON              OH.ShipToAddressID = A.AddressID
GROUP BY        OH.SalesOrderID, OH.OrderDate, 
                OH.TotalDue, ST.[Group], ST.Name, 
                SP.Name, SalesP.FirstName, SalesP.LastName

WHERE                                         YEAR(a.OrderDate) = @OrderYear