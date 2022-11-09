/*
Name: Aquel Daley
Lesson: Selecting and Grouping data 
Date: 8/11/2022
*/



CREATE TABLE dbo.BBall_Stats
(
PlayerID int null,
PlayerName varchar (50) null,
PlayerNum int null,
PlayerPosition varchar (50) null,
Assist int null,
Rebounds int null,
GamesPlayed int null,
Points int null,
PlayersCoach varchar (50) null
)

SELECT*
FROM dbo.BBall_Stats
--2.Run the following Script
INSERT INTO dbo.BBall_Stats (PlayerID, PlayerName, PlayerNum, PlayerPosition,
Assist, Rebounds, GamesPlayed, Points, PlayersCoach)
SELECT 1, 'ali', 2, 'guard', 200, 70, 16, 43, 'Gary' union
SELECT 2, 'Goku', 34, 'forward', 150, 85, 50, 15, 'bob' union
SELECT 3, 'Vegeta', 50, 'center', 20, 14, 90, 32, 'steve' union
SELECT 4, 'Aquel', 1, 'guard', 160, 82, 77, 45, 'garret' union
SELECT 5, 'Luffy', 13, 'forward', 40, 101, 63, 95, 'Gary' union
SELECT 6, 'Zoro', 5, 'center', 43, 32, 42, 66, 'bob' union
SELECT 7, 'Sanji', 3, 'guard', 55, 41, 33, 80, 'steve' union
SELECT 8, 'Jinbe', 33, 'forward',61, 55, 19, 86, 'Gary' union
SELECT 9, 'Yamato', 14, 'center', 170, 65, 20, 55, 'Gary' union
SELECT 10, 'Yuskue', 19, 'guard', 140, 83, 30, 45,'steve' union
SELECT 11, 'hiei', 23, 'forward', 75, 112, 25, 89, 'steve' union
SELECT 12, 'kurama', 10, 'center', 63, 133, 12, 110, 'steve' union
SELECT 13, 'Naruto', 6, 'guard', 95, 143, 16, 103, 'steve' union
SELECT 14, 'Saskue', 18, 'forward', 74, 112, 18, 111, 'Gary' union
SELECT 15, 'Boruto', 0, 'center', 13, 160, 26, 105, 'steve' 


SELECT *
FROM dbo.BBall_Stats
--Find the number of players at each position

SELECT PlayerPosition, COUNT (*) AS NumberofPlayers
FROM dbo.BBall_Stats
GROUP BY PlayerPosition--Find the number of players assigned to each coach
SELECT PlayersCoach, COUNT (*) AS NumberofPlayers
FROM dbo.BBall_Stats
GROUP BY PlayersCoach--Find the most points scored per game by positionSELECT PlayerPosition, MAX (Points) AS MostPoints
FROM dbo.BBall_Stats
GROUP BY PlayerPosition--Find the Number of Rebounds per game by CoachSELECT PlayersCoach, SUM (Rebounds) AS TotalRebounds
FROM dbo.BBall_Stats
GROUP BY PlayersCoach--Find the Average number of Assist by Coach


SELECT PlayersCoach, AVG (Assist) AS AverageAssist
FROM dbo.BBall_Stats
GROUP BY PlayersCoach--Find the Average number of Assist per game by position

SELECT PlayerPosition, AVG (Assist) AS AverageAssist
FROM dbo.BBall_Stats
GROUP BY PlayerPosition--Find the Total number of Points by each Player Position
SELECT PlayerPosition, SUM (Points) AS TotalNumberofPoints
FROM dbo.BBall_Stats
GROUP BY PlayerPosition



