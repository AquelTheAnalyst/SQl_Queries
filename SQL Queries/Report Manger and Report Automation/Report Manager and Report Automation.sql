/*
Name: Aquel Daley
Lesson:Report Manager and Report Automation
Date: 09/15/2022
*/


SELECT		YEAR (OrderDate) OrderYear, Month (OrderDate) OrderMonth, OrderDate, TotalDue,
					b.Name TName, b.[Group] TGroup, 
					d. Name ShipState, 
					ISNULL(e. FirstName + ' ' + e. LastName, 'No Rep') SalesRep, 
					ISNULL(e. JobTitle, 'None') JobTitle 
FROM		[Sales] . [SalesOrderHeader] a 
LEFT JOIN	[Sales] . [SalesTerritory] b 
ON			a. TerritoryID = b.TerritoryID 
LEFT JOIN   [Person] . [Address] C 
ON			a.ShipToAddressID = c. AddressID 
LEFT JOIN	[Person] . [StateProvince] d 
ON c.		StateProvinceID = d.StateProvinceID 
LEFT JOIN   [Sales] . [vSalesPerson] e 
ON			a.SalesPersonID = e.BusinessEntityID

