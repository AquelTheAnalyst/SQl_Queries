USE July_12_online

CREATE TABLE emp
(
	empid int,
	empname varchar(50),
	deptid int
)


INSERT INTO		emp (empid, empname, deptid)
Values (1,'Ali' ,1)


INSERT INTO		emp (empid, empname, deptid)
SELECT 3, 'Billy', 2
UNION 
SELECT 4, 'Anand', 3
UNION
SELECT 5, 'James', 3
UNION
SELECT 6, 'Ralph', 1
UNION
SELECT 7, 'Jack', 1 

SELECT		*
FROM		emp

CREATE TABLE dept
    (deptid int,
     deptname varchar(50)
)

insert into dept (deptid, deptname)
SELECT		1, 'SQL'
UNION
SELECT		2, 'SSIS'
UNION
SELECT		3, 'SSRS'
UNION
SELECT		4, 'SSAS'

SELECT		*
FROM		dept


SELECT		*
FROM		emp
WHERE		empname = 'ali'
