INSERT INTO Driver (driverRef, number, code, forename, surname, dob, nationality, url)
VALUES ('verstappen', 33, 'VER', 'Max', 'Verstappen', '1997-09-30', 'Dutch', 'http://en.wikipedia.org/wiki/Max_Verstappen');
Select * from Driver;

INSERT INTO Status (statusId, status)
VALUES 
(22, 'Hydraulics'),
(23, 'Electrical');
Select * from Status;

UPDATE Driver
SET nationality = 'Belgian'
WHERE driverId = 1;  

UPDATE Status
SET status = 'Active'
WHERE statusId = 1; 

DELETE FROM Status
WHERE statusId = 1;  
select* from status;

SELECT driverRef, forename, surname, nationality
FROM Driver
WHERE nationality = 'German';  

SELECT 
    Driver.forename, 
    Driver.surname, 
    Race.name AS race_name, 
    Result.position, 
    Result.points
FROM 
    Result
JOIN 
    Driver ON Result.driverId = Driver.driverId
JOIN 
    Race ON Result.raceId = Race.raceId;

SELECT 
    Driver.forename, 
    Driver.surname, 
    Constructor.name AS constructor_name,
    Race.name AS race_name, 
    Result.position, 
    Result.points
FROM 
    Result
JOIN 
    Driver ON Result.driverId = Driver.driverId
JOIN 
    Constructor ON Result.constructorId = Constructor.constructorId
JOIN 
    Race ON Result.raceId = Race.raceId;

SELECT Constructor.name, COUNT(Result.raceId) AS race_count
FROM Constructor
JOIN Result ON Constructor.constructorId = Result.constructorId
GROUP BY Constructor.name;  

SELECT Driver.forename, Driver.surname, AVG(Result.points) AS average_points
FROM Driver
JOIN Result ON Driver.driverId = Result.driverId
GROUP BY Driver.driverId;

SELECT Driver.forename, Driver.surname, Race.name AS race_name, Constructor.name AS constructor_name, Result.points
FROM Driver
JOIN Result ON Driver.driverId = Result.driverId
JOIN Race ON Result.raceId = Race.raceId
JOIN Constructor ON Result.constructorId = Constructor.constructorId
WHERE Result.position = 1 
ORDER BY Result.points DESC;  

SELECT Constructor.name, Race.year, COUNT(Result.raceId) AS race_count
FROM Constructor
JOIN Result ON Constructor.constructorId = Result.constructorId
JOIN Race ON Result.raceId = Race.raceId
WHERE Race.year = 2020  
GROUP BY Constructor.name, Race.year;  

