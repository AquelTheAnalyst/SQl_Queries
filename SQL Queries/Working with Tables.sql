/*
Name Aquel Daley
Lesson: Working With Tables
Date: 8/10/2022
*/

INSERT INTO [dbo].[Players] 
VALUES (1,'Running Back', 22, '1/1/2012')

INSERT INTO [dbo].[Coaches]
VALUES (1,'John Starks', 'RunningBackCoach', '1/1/2012')


CREATE TABLE players
(
	 playerid	  INT NULL,
	 position	  VARCHAR(50) NULL,
	 jerseynumber INT Null,
	 startdate    DATETIME NULL
);

CREATE TABLE coaches 
  (
	 coachid   INT NULL,
	 coachname VARCHAR(50) NULL,
	 coachtype VARCHAR(50) NULL,
	 startdate DATETIME NULL
  );


INSERT INTO players VALUES (0001, 'Front', 07, '2014-10-13' );

INSERT INTO [dbo].[Players] 
VALUES (1,'Quarter Back',52,'1/13/2021'),
(2,'Full Back',30,'1/16/2022'),
(3,'Line Back',26,'1/15/2022'), 
(4,'Full Back',24,'1/5/2016'), 
(5,'Tight End',14,'1/6/2016'), 
(6,'Tight End',18,'1/19/2018'), 
(7,'Wide Reciever',24,'1/12/2015'), 
(8,'Defensive End',15,'1/11/2019'), 
(9,'Defensive Back',22,'1/12/2019'), 
(10,'Running Back',6,'1/15/2020')

SELECT * 
FROM [dbo].[coaches] 
INSERT INTO [dbo].[coaches] 
VALUES (2,'Aquel Daley','QuarterBack', '1/13/2021'),
	   (3,'Monkey D','Full Back', '1/16/2022'),
	   (4,'Roc Lee','Full Back', '1/5/2016'),
	   (5,'Saskue Uchiha','Tight End', '1/6/2016'), 
       (6,'Naruto Uzumaki','Tight End', '1/19/2018'),
	   (7,'Son Goku','Wide Reciever', '1/12/2015'), 
	   (8,'Prince Vegeta','Defensive End', '1/11/2019'), 
       (9,'Yusuke Urameshi','Defensive Back', '1/12/2019'), 
       (10,'Yoko Kurama','Running Back', '1/15/2020') 

SELECT * 
 FROM[dbo].[Players] 
 WHERE [JerseyNumber] BETWEEN 20 AND 29 

 SELECT * 
FROM[dbo].[Coaches] 
WHERE CoachID < 5 
	   
SELECT * 
FROM Players 
WHERE StartDate between '2022-01-01'and '2022-12-20'

SELECT * 
FROM Coaches 
WHERE StartDate between '2021-01-01'and '2021-12-31' 

SELECT * 
FROM Players 
WHERE PlayerID > 5

SELECT * 
FROM Players 
WHERE Position = 'Running Back' 

SELECT * 
FROM Coaches 
WHERE Coachtype = 'Quarter Back'

SELECT * 
INTO Coaches_backup 
FROM Coaches 

SELECT * 
INTO Players_backup 
FROM Players


