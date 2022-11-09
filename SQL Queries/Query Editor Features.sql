CREATE TABLE Customer (
 Customer_id    INT
,Cust_Name              VARCHAR(50)
,City           VARCHAR(50)
,Order_ID               INT
,Order_Amount   MONEY
,Salesman_id    INT
  )
INSERT INTO CUSTOMER(Customer_id , Cust_Name, City, Order_ID,Order_Amount,                     Salesman_id
                )
SELECT 3002, 'Nick Rimando','New York  ' , 100,234.56, 5001
UNION
SELECT 3007,'Brad Davis ','New York  ' , 200,78.50, 5001
UNION
SELECT 3005,'Graham Zusi','California' , 200,124, 5002
UNION
SELECT 3008,'Julian Green','London'     , 300,65.50, 5002
UNION
SELECT 3004,'Fabian Johnson','Paris   '  , 300,25.50, 5006
UNION
SELECT 3009,'Geoff Cameron','Berlin  '   , 100,14.40, 5003
UNION
SELECT 3003,'Jozy Altidor ','Moscow  '   , 200,86.90, 5007
