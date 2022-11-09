/*
Name: Aquel Daley
Lesson: Update,Delete and Truncate and Limiting And
Sorting Data 
Date: 8/15/2022
*/



Create the following table
a. ItemID has a primary key with an Identity (1000,1)
b. ItemType does not allow nulls
c. CostToMake should always be greater than 0 





CREATE TABLE dbo.Menu(ItemID INT NOT NULL PRIMARY KEY ,
 ItemName VARCHAR(50),
 ItemType VARCHAR(50) NOT NULL,
 CostToMake MONEY,
 Price MONEY,
 WeeklySales INT, 
 MonthlySales INT,
 YearlySales INT
 )

 
INSERT INTO dbo.Menu
SELECT 'Big Mac','Hamburger',1.25,3.24,1015,5000,15853
union
SELECT 'Quarter Pounder /
Cheese','Hamburger',1.15,3.24,1000,4589,16095
union
SELECT 'Half Pounder /
Cheese','Hamburger',1.35,3.50,500,3500,12589
union
SELECT 'Whopper','Hamburger',1.55,3.99,989,4253,13000
union
SELECT 'Kobe Cheeseburger','Hamburger',2.25,5.25,350,1500,5000
union
SELECT 'Grilled Stuffed Burrito','Burrito',.75,5.00,2000,7528,17896
SELECT 'Bean Burrito','Burrito',.50,1.00,1750,7000,18853
union
SELECT '7 layer Burrito','Burrito',.78,2.50,350,1000,2563
union
SELECT 'Dorrito Burrito','Burrito',.85,1.50,600,2052,9857
union
SELECT 'Turkey and Cheese Sub','Sub
Sandwich',1.75,5.50,1115,7878,16853
union
SELECT 'Philly Cheese Steak Sub','Sub
Sandwich',2.50,6.00,726,2785,8000
union
SELECT 'Tuna Sub','Sub Sandwich',1.25,4.50,825,3214,13523
union
SELECT 'Meatball Sub','Sub Sandwich',1.95,6.50,987,4023,15287
union
SELECT 'Italian Sub','Sub Sandwich',2.25,7.00,625,1253,11111
union
SELECT '3 Cheese Sub','Sub Sandwich',.25,6.00,815,3000,11853
SELECT *
FROM dbo.Menu 

SELECT * INTO [dbo].[Menu_backup]
FROM dbo.Menu
SELECT *
FROM [dbo].[Menu_backup]


UPDATE [dbo].[Menu_backup]
SET ItemName = '4 cheese sub'
Where ItemName = '3 cheese sub' 

UPDATE [dbo].[Menu_backup]
SET MonthlySales = 1353
WHERE MonthlySales = 1253

UPDATE [dbo].[Menu_backup]
SET Price = 4.25
WHERE Price = 3.99

UPDATE [dbo].[Menu_backup]
SET CostToMake = 2.75
WHERE CostToMake = 0.78


UPDATE [dbo].[Menu_backup]
SET Price = Price+(0.1*Price)
WHERE ItemType= 'Burrito' 


DELETE FROM [dbo].[Menu_backup]
WHERE (Price-CostToMake)<1 DELETE FROM [dbo].[Menu_backup]
WHERE YearlySales < 10000 TRUNCATE TABLE [dbo].[Menu_backup]Limiting And Sorting Data SELECT *
FROM [dbo].[Menu] 

SELECT [ItemID], [ItemName], [ItemType], [CostToMake], [WeeklySales],
[MonthlySales], [YearlySales],[Price]
FROM [dbo].[Menu]
WHERE Itemtype = 'Burrito'
ORDER BY Price desc

SELECT [ItemID], [ItemName], [ItemType], [CostToMake], [WeeklySales], 
[MonthlySales], [YearlySales],[Price]
FROM [dbo].[Menu]
WHERE CostToMake > 1
ORDER BY WeeklySales 

SELECT ItemType, SUM(Price-CostToMake) AS TotalProfit
FROM [dbo].[Menu]
GROUP BY ItemType 

SELECT ItemType, SUM(WeeklySales) AS TotalWeeklySales
FROM [dbo].[Menu]
GROUP BY ItemType
HAVING SUM(WeeklySales) > 3000
ORDER BY TotalWeeklySales 

SELECT ItemName, WeeklySales*(Price-CostToMake) AS
WeeklyProfit,MonthlySales*(Price-CostToMake) AS
MonthlyProfit,YearlySales*(Price-CostToMake) AS YearlyProfit
FROM [dbo].[Menu]
WHERE ItemName = 'Big Mac'

SELECT ItemName, ItemType, (MonthlySales*Price) AS Monthly_Sales
FROM [dbo].[Menu]
WHERE (MonthlySales*Price) > 20000 

SELECT ItemType, MAX(MonthlySales*(Price-CostToMake)) AS
MonthlyBestProfit
FROM [dbo].[Menu]
GROUP BY ItemType

