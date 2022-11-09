/*
Name: Aquel Daley
Lesson: System Functions
Date: 8/16/2022
*/


SELECT LEN ('Aquel') [Length]
SELECT LEN ('Extraordinary') [Length]

SELECT LEFT ('Aquel' ,5)
SELECT LEFT ('Extraordinary' ,4)

SELECT RIGHT ('Aquel' ,5)
SELECT RIGHT ('Extraordinary' ,4)

SELECT SUBSTRING ('Aquel', 3,6)
SELECT SUBSTRING ('Extraordinary',8,9)

SELECT CHARINDEX ('u','Aquel') 
SELECT CHARINDEX ('d','Extraordinary')

SELECT LTRIM     (       'Aq uel')
SELECT LTRIM     (  'Extraor dinary'    )

SELECT RTRIM     ('Aqu el'       )
SELECT RTRIM     ('Extra ordinary'   )

SELECT DATEDIFF  (HOUR,'8/10/0800',GETDATE())
SELECT DATEDIFF  (YY,'8/10/0800',GETDATE())

SELECT DATEPART  (MM,'7/9/1973')
SELECT DATEPART  (MONTH,'7/9/1973')

SELECT DATEADD   (YY,34,'7/9/1973')
SELECT DATEADD   (HH,50000,'5/6/1950')



SELECT DATEADD   (YY,34,'7/9/1973')
SELECT DATEADD   (HH,50000,'5/6/1950')

SELECT CAST       (34.35343431 AS INT)
SELECT CAST       ('WELCOME' AS CHAR(6))


SELECT CONVERT    ( VARCHAR(50), GETDATE(), 101)
SELECT CONVERT    (DATETIME, GETDATE(), 107)

SELECT ISNULL     (NULL,5)
SELECT ISNULL     (6,61)

SELECT ISNUMERIC  (10)
SELECT ISNUMERIC  ('WELCOME')


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Loan]') AND type in (N'U'))
DROP TABLE [dbo].[Loan]

CREATE TABLE [dbo].[Loan](
	[LoanNumber] [int] IDENTITY(1000,1) NOT NULL,
	[CustomerFname] [varchar](50) NULL,
	[CustomerLname] [varchar](50) NULL,
	[PropertyAddress] [varchar](150) NULL,
	[City] [varchar](150) NULL,
	[State] [varchar](50) NULL,
	[BankruptcyAttorneyName] [varchar](50) NULL,
	[UPB] MONEY NULL,
	[LoanDate] [Datetime] NULL
 CONSTRAINT [PK_Loan] PRIMARY KEY CLUSTERED 
(
	[LoanNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

TRUNCATE TABLE dbo.Loan

INSERT INTO [dbo].[Loan]
           ([CustomerFname]
           ,[CustomerLname]
           ,[PropertyAddress]
           ,[City]
           ,[State]
           ,[BankruptcyAttorneyName]
		   ,[UPB]
		   ,[LoanDate])
SELECT	'Mr. Anand','Dasari','1212 Main St.','Plano','TX','Jerry',85000,'1/1/2012' UNION
SELECT	'Mr. John','Nasari','1215 Joseph St.','Garland','TX','Jerry',95000,'4/2/2012' UNION
SELECT	'Dr. Ali','Muwwakkil','2375 True True St.','Atlanta','GA','Diesel',115000,'5/3/2008' UNION
SELECT	'Mr. John','Brown','11532 Chain St.','SanFrancisco','CA','Mora',350000,'6/13/2004' UNION
SELECT	'Dr. Kishan','Johnson','4625 Miller Rd.','Atlanta','GA','Diesel',225000,'8/9/2002' UNION
SELECT	'Mr. John','Jackson','972 Flower Rd.','Dallas','TX','Jerry',150000,'3/1/2012' UNION
SELECT	'Sr. Ralph','Jenkins','1518 Mission Ridge St.','SanFrancisco','CA','Mora',650000,'12/15/2011' UNION
SELECT	'Dr. John','Howard','102 Washington','Dallas','TX','Jerry',450000,'4/5/2010' UNION
SELECT	'Mrs. Marsha','Tamrie','1301 Solana','SanFrancisco','CA','Mora',750000,'7/1/2000' UNION
SELECT	'Mrs. Alexis','Gibson','1111 Phillips Rd.','Atlanta','GA','Diesel',99000,'6/1/2012' 
        
SELECT * FROM [dbo].[Loan] 

SELECT LoanNumber,[State],City,UPB,GETDATE()AS TODAYSDATE
FROM [dbo].[Loan] 

SELECT loan_number, customer_first_name, customer_last_name, property_address, bankruptcy_attorney_name
FROM loans
WHERE bankruptcy_attorney_name IS NOT NULL
ORDER BY bankruptcy_attorney_name ASC, customer_last_name DESC




SELECT LoanNumber State, City, CustomerFname 

FROM dbo.loan 

WHERE State IN ('CA','TX','FL','NV','NM') 

AND City IN ('Dallas','SanFrancisco','Oakland')

AND CustomerFName LIKE '%JOHN' ; 


SELECT * FROM [dbo].[Loan] 
SELECT DATEDIFF(DD,LoanDate,GETDATE()) AS LOADDATE 
FROM [dbo].[Loan]


SELECT TOP 1[State], AVG(UPB)AS AVERAGE
FROM [dbo].[Loan] 
GROUP BY [State]

SELECT LoanNumber,BankruptcyAttorneyName, 30-
DATEDIFF(YY,LoanDate,GETDATE()) LOANDATEREMAING
FROM dbo.loan 

SELECT SUBSTRING (CustomerFname,1,CHARINDEX('.',CustomerFname)-1)AS TITEL, 
CustomerFname,CustomerLname,City,State,DATEDIFF(YY,LoanDate,GETDATE())AS MORETHANYEAR 
FROM loan WHERE DATEDIFF(YY,LoanDate,GETDATE())>1


SELECT SUM(UPB) FROM Loan

