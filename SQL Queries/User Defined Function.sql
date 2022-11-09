/*
Name: Aquel Daley
Lesson: User Defined functiion
Date: 8/20/2022
*/

CREATE FUNCTION GetUserLoginID
(
   @EmployeeID int
)
RETURNS VARCHAR(50)
AS
BEGIN
   DECLARE @UserLoginID VARCHAR(50)

   SELECT @UserLoginID = LogID
   FROM HumanResources.Employee
   WHERE BusinessEntityID = @EmployeeID

   RETURN @UserLoginID
END
GO

CREATE FUNCTION GetAge
(
   @EmployeeID int
)
RETURNS int
AS
BEGIN
   DECLARE @Age int

   SELECT @Age = DATEDIFF(yy, HireDate, GETDATE())
   FROM HumanResources.Employee
   WHERE BusinessEntityID = @EmployeeID

   RETURN @Age
END
GO


CREATE FUNCTION GetAvgVacationHours
(
   @Gender char(1)
)
RETURNS int
AS
BEGIN
   DECLARE @AvgVacationHours int

   SELECT @AvgVacationHours = AVG(VacationHours)
   FROM HumanResources.Employee
   WHERE Gender = @Gender

   RETURN @AvgVacationHours
END
GO

CREATE FUNCTION GetEmployees
(
   @ManagerID int
)
RETURNS TABLE
AS
   RETURN 
   (
       SELECT LoginID, Gender, HireDate
       FROM HumanResources.Employee
       WHERE JobTitle = @ManagerID
   )
GO

