/* 
Name Aquel Daley
Lesson 14 SQL Server Review
Date 08/25/2022
*/ 

 SELECT *
 FROM [dbo].[VW_SalesPriceAnalysis] 

 select tableA.field1, tableb.field1

from tablea, tableb

where tableA.field1= tableb.field1;


select tableA.field1, tableb.field1

from tableA  left join tableb on  tableA.field1=tableb.field1 ;


select tableA.field1, tableb.field1

from tableA  right join tableb on tableA.field1=tableb.field1 ;


Select distinct field1 

From tablea;


Select field1, count( field1) from 

Tablea 

Group by field1;



Select field1, count( field1) from 

Tablea 

Group by field1

Having count(field1) >1;




DECLARE @Variable1 VARCHAR(50) = 'Hello World';

CREATE TABLE Table1 (

  Field1 INT,

 Field2 DATETIME,

Field3 varchar(500)

);


INSERT INTO Table1 (Field1, Field2, Field3) VALUES(34, '1/19/2012 08:30 AM', 'Mars Saturn'); 

INSERT INTO Table1 (Field1, Field2, Field3) VALUES(65, '2/15/2012 10:30 AM', 'Big Bright Sun'); 

INSERT INTO Table1 (Field1, Field2, Field3) VALUES(89, '3/31/2012 09:15 AM', 'Red Hot Mercury'); 

SELECT max(Field1) 
FROM TableB;

SELECT max(Field1) 
FROM TableB;

UPDATE Table1
SET Field3 = Variable1
WHERE RecordID = 34;

20.SQL:

SELECT LENGTH(Field3)
FROM Table1
WHERE RecordID = 89;

21.SQL:

SELECT LOCATE(' ', Field3)
FROM Table1
WHERE RecordID = 65;

22.SQL:

SELECT SUBSTRING(Field3, 1, LOCATE(' ', Field3) - 1)
FROM Table1
WHERE RecordID = 65;

23.SQL:

SELECT DAY(Field2)
FROM Table1
WHERE RecordID = 34;

24.SQL:

SELECT DATE_FORMAT(Field2, '%Y%m01')
FROM Table1
WHERE RecordID = 34;

25.SQL:

SELECT DATE_SUB(Field2, INTERVAL (DAY(Field2) - 1) DAY)
FROM Table1
WHERE RecordID = 34;

26.SQL:

SELECT DAYNAME(Field2)
FROM Table1
WHERE RecordID = 34;

27.SQL:

SELECT DATE_FORMAT(Field2, '%Y%m%d')
FROM Table1
WHERE RecordID = 34;

28.SQL:

ALTER TABLE Table1
ADD Field4 VARCHAR(255);

29. 
DELETE FROM Table1
WHERE Field1=65;

30.
DELETE FROM Table1;

31.
DROP TABLE Table1;