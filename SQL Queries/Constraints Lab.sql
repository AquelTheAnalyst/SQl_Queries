/*
Name: Aquel Daley
Lesson: Constraints Lab
Date: 8/11/2022
*/



CREATE TABLE dbo.Customer 
( 
CustID int null,
CustName varchar (5) null,
EntryDate datetime null 
)


CREATE TABLE dbo.SalesReps 
( RepID int null, 
RepName varchar (50) null, 
HireDate datetime null 
) 


CREATE TABLE dbo.Sales 
( 
	SalesID int null, 
	CustID int null, 
	RepID int null, SalesDate datetime null,
	UnitCount int null, 
	VerificationCode varchar (50) null 
) 


EXEC sp_pkeys Customer
EXEC sp_pkeys Sales
EXEC sp_pkeys SalesReps

SELECT
  OBJECT_NAME(object_id) AS [object],
  name,
  seed_value,
  increment_value,
  last_value,
  is_not_for_replication
From sys.identity_columns

ALTER TABLE dbo.Sales
ADD CONSTRAINT uc_VerificationCode
UNIQUE (VerificationCode)

ALTER TABLE dbo.Sales
ADD FOREIGN KEY (CustID) REFERENCES [dbo].[Customer] (CustID) 

ALTER TABLE dbo.Sales
ADD FOREIGN KEY (RepID) REFERENCES [dbo].[SalesReps] (RepID)

ALTER TABLE dbo.Customer
ADD CONSTRAINT DF_EntryDate
DEFAULT (GETDATE()) FOR [EntryDate]

ALTER TABLE dbo.SalesReps
ADD CONSTRAINT DF_HireDate
DEFAULT (GETDATE()) FOR [HireDate] 


ALTER TABLE dbo.Sales
ADD CONSTRAINT DF_SalesDate
DEFAULT (GETDATE()) FOR [SalesDate]


INSERT INTO dbo.Customer (CustName)
SELECT 'Ali' UNION
SELECT 'Anand' UNION
SELECT 'Alex' UNION
SELECT 'Jack' UNION
SELECT 'Nina' UNION
SELECT 'Joel' UNION
SELECT 'Keon' UNION
SELECT 'James' UNION
SELECT 'Mike' UNION
SELECT 'Sai' UNION
SELECT 'Terry' 



SELECT *
FROM [dbo].[Customer]
INSERT INTO dbo.SalesReps (RepName)
SELECT 'Joseph' UNION
SELECT 'Jermaine' UNION
SELECT 'Marshall' UNION
SELECT 'Marvin' UNION
SELECT 'Mitchell' UNION
SELECT 'Johnson' UNION
SELECT 'Robert' UNION
SELECT 'Rachel' UNION
SELECT 'Rene' UNION
SELECT 'Brandy'UNION
SELECT 'Dirk' 



SELECT *
FROM [dbo].[SalesReps]
INSERT INTO dbo.Sales (CustID, RepID,UnitCount,VerificationCode)
SELECT 100,120,1,'Ver01' UNION
SELECT 102,118,2,'Ver02' UNION
SELECT 104,116,3,'Ver03' UNION
SELECT 106,114,4,'Ver04' UNION
SELECT 108,112,5,'Ver05' UNION
SELECT 110,110,1,'Ver06' UNION
SELECT 112,108,2,'Ver07' UNION
SELECT 114,106,3,'Ver08' UNION
SELECT 116,104,4,'Ver09' UNION
SELECT 118,102,5,'Ver10' UNION
SELECT 120,100,6,'Ver11' 

SELECT *
FROM sales

SELECT *
FROM SalesReps

SELECT *
FROM Customer
















