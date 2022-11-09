/*
NAME: Aquel Daley
LESSON: Charts and Graphs Lab
DATE:9/3/2022
*/





SELECT YEAR(OrderDate) AS Year, SUM(SubTotal) AS [Total Sales]
FROM [Sales].[SalesOrderHeader]
GROUP BY YEAR(OrderDate);


SELECT YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month, SUM(SubTotal) AS [Total Sales]
FROM [Sales].[SalesOrderHeader]
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY YEAR(OrderDate), MONTH(OrderDate);

SELECT ST.[Group], SUM(SubTotal) AS [Total Sales]
FROM [Sales].[SalesOrderHeader] SOH JOIN [Sales].[SalesTerritory] ST
ON SOH.TerritoryID = ST.TerritoryID
GROUP BY ST.[Group];

SELECT ST.Name, SUM(SubTotal) AS [Total Sales]
FROM [Sales].[SalesOrderHeader] SOH JOIN [Sales].[SalesTerritory] ST
ON SOH.TerritoryID = ST.TerritoryID
GROUP BY ST.Name;


SELECT SP.StateProvinceCode, SUM(SubTotal) AS [Total Sales]
FROM [Sales].[SalesOrderHeader] SOH JOIN [Sales].[SalesTerritory] ST
ON SOH.TerritoryID = ST.TerritoryID
JOIN [Person].[StateProvince] SP ON ST.CountryRegionCode = SP.CountryRegionCode
WHERE ST.CountryRegionCode = 'US'
GROUP BY SP.StateProvinceCode

SELECT TOP 10 P.FirstName, P.LastName, SUM(SubTotal) AS [Total Sales]
FROM [Sales].[SalesOrderHeader] SOH JOIN [Sales].[SalesPerson] SP
   ON SOH.SalesPersonID = SP.BusinessEntityID
JOIN [Person].[Person] P ON P.BusinessEntityID = SP.BusinessEntityID
GROUP BY SOH.SalesPersonID, P.FirstName, P.LastName
ORDER BY SUM(SubTotal) DESC;