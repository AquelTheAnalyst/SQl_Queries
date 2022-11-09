/*
NAME: Aquel			
SECTION: WORKING WITH VARIABLES
DATE:8/16/2022
*/


CREATE TABLE flights
(
flightID int PRIMARY KEY IDENTITY(100,1)
NOT NULL,
flightDateTime datetime null,
flightDepartureCity varchar(50) null,
flightDestinationCity varchar(50),
ontime int null
) 


INSERT INTO dbo.Flights (FlightDateTime, FlightDepartureCity,
FlightDestinationCity, Ontime)
SELECT '1/1/2012','Dallas-Texas','L.A.',1 UNION
SELECT '1/2/2012','Austin-Texas','New York',1 UNION
SELECT '1/3/2012','Houston-Texas','New Jersy',0 UNION
SELECT '1/4/2012','San Antonio-Texas','Mesquite',1 UNION
SELECT '1/5/2012','Lewisville-Texas','Albany',0 UNION
SELECT '1/6/2012','Orlando-Florida','Atlanta',1 UNION
SELECT '1/7/2012','Chicago-Illinois','Oklahoma City',1 UNION
SELECT '1/8/2012','New Orleans-Louisiana','Memphis',0 UNION
SELECT '1/9/2012','Miami-Florida','Charlotte',1 UNION
SELECT '1/10/2012','Sacramento-California','San Francisco',1 

DECLARE @no_of_lateFlights int
SELECT @no_of_lateflights=count(ontime)
FROM flights
WHERE ontime=0
SELECT @no_of_lateFlights as 'no of late flights' 


DECLARE @totalamnt_of_lateFlights int
SET @totalamnt_of_lateFlights=1029*3
SELECT @Totalamnt_of_lateFlights as 'total amount of late
flight'

DECLARE @profitAfterlateFlight int
SET @profitAfterlateFlight=45000-3087
SELECT @profitAfterlateFlight as 'profit after loss from late
flight'

DECLARE @future_flight datetime
SELECT @future_flight=dateadd(yy,10,min(flightDateTime))
FROM flights
SELECT @future_flight as '10yrs from the earliest flight' 


DECLARE @latestDate int
SELECT @latestDate=day(max(flightdatetime))
FROM flights
SELECT @latestDate as 'day of the week for the latest flight' 

DECLARE @Table1 TABLE (depatureState varchar(50),
departurecity varchar(50),
destinationCity varchar(50),
ontime int)
INSERT INTO @table1
SELECT
substring(flightdeparturecity,charindex('-',flightdeparturecity)+1,
len(flightDepartureCity) -charindex('-',flightdeparturecity)) as 'departure
state',
left(flightDepartureCity,
charindex('-',flightdeparturecity)-1) as 'departure city',
flightDestinationCity,
ontime
FROM flights
SELECT *
FROM @table1

DECLARE @Table2 TABLE(flightID int PRIMARY KEY NOT NULL,
flightDateTime datetime null,
flightDepartureCity varchar(50) null,
flightDestinationCity varchar(50),
ontime int null)
INSERT INTO @Table2
SELECT *
FROM flights
WHERE ontime=1
SELECT *
FROM @Table2 


DECLARE @Table3 TABLE(flightID int,
flightDateTime datetime null,
depatureState varchar(50),
departurecity varchar(50),
flightDestinationCity varchar(50),
ontime int )
INSERT INTO @Table3
SELECT [flightID],
[flightDateTime],
substring(flightdeparturecity,charindex('-',flightdeparturecity)+1,
len(flightDepartureCity) -charindex('-',flightdeparturecity)),
left(flightDepartureCity,
charindex('-',flightdeparturecity)-1),
 [flightDestinationCity],
[ontime]
FROM flights
WHERE
substring(flightdeparturecity,charindex('-',flightdeparturecity)+1,
len(flightDepartureCity) -charindex('-',flightdeparturecity)) <> 'texas'
SELECT *
FROM @Table3
select *
from flights
CREATE TABLE [dbo].[HospitalStaff](
[EmpID] [int] IDENTITY(1000,1) NOT NULL,
[NameJob] [varchar](50) NULL,
[HireDate] [datetime] NULL,
[Location] [varchar](150) NULL,
CONSTRAINT [PK_HospitalStaff] PRIMARY KEY CLUSTERED
(
[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS
= ON) ON [PRIMARY]
) ON [PRIMARY]
INSERT INTO [dbo].[HospitalStaff] ([NameJob],[HireDate],[Location])
SELECT 'Dr. Johnson_Doctor' ,'1/1/2012', 'Dallas-Texas' UNION
SELECT 'Nurse Jackie_Nurse' ,'10/15/2011', 'Mesquite-Texas'
UNION
SELECT 'Anne_Nurse Assistant' ,'11/1/2010', 'Denton-Texas'
UNION
SELECT 'Dr. Jackson_Doctor' ,'4/2/2008', 'Irving-Texas' UNION
SELECT 'Jamie_Nurse' ,'2/15/2005', 'San
Francisco-California' UNION
SELECT 'Aesha_Nurse Assistant','6/30/2003', 'OaklandCalifornia' UNION
SELECT 'Dr. Ali_Doctor' ,'7/4/1999', 'L.A.-California' UNION
SELECT 'Evelyn_Nurse' ,'1/7/2007', 'Fresno-California'
UNION
SELECT 'James Worthy_Nurse Assistant' ,'1/1/2012', 'OrlandoFlorida' UNION
SELECT 'Anand_Doctor' ,'3/1/2012', 'Miami-Florida'
SELECT *
FROM dbo.HospitalStaff 

DECLARE @three_yrs_plus_from_hireDate int
SELECT
@three_yrs_plus_from_hireDate=count(datediff(yy,HireDate,getdate()))
FROM [dbo].[HospitalStaff]
WHERE datediff(yy,[HireDate],getdate()) >3
SELECT @three_yrs_plus_from_hireDate as 'no of
employees working for 3yrs plus' 

DECLARE @employeeTx int
SELECT @employeetx=COUNT(namejob)
FROM HospitalStaff
WHERE [location] like '%texas%'
SELECT @employeeTx as 'no Texas employees' 


DECLARE @TexasDcotors int
SELECT @TexasDcotors=count(namejob)
FROM dbo.HospitalStaff
WHERE [location] like '%texas%'
AND namejob like '%doctor%'
SELECT @TexasDcotors as 'no of doctors in Texas' 


DECLARE @Table7 TABLE ([name] varchar(50), job varchar(50),
hiredate datetime, city varchar(50), [state] varchar(50)) 
INSERT INTO @Table7
SELECT left(namejob, charindex( '_', namejob)-1),
substring(namejob, charindex( '_', namejob)+1,
len(namejob)-charindex( '_', namejob)+1),
 hiredate,
 left([location],charindex( '-', [Location])-1),
 substring([location], charindex('-', [location])+1,
len([location])- charindex('-', [location])+1) 
FROM dbo.HospitalStaff
SELECT *
FROM @Table7 

DECLARE @Table12 TABLE ( namejob varchar(50),
dateyear int, datemonth int, dateday int)
INSERT INTO @Table12
SELECT namejob, year(hiredate), month(hiredate),
day(hiredate)
FROM HospitalStaff
SELECT *
FROM @Table12
SELECT *
FROM dbo.HospitalStaf