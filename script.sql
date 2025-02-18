CREATE TABLE Circuit (
    circuitId INT AUTO_INCREMENT PRIMARY KEY,
    circuitRef VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    lat FLOAT NOT NULL,
    lng FLOAT NOT NULL,
    alt INT NOT NULL,
    url VARCHAR(200) NOT NULL
);

CREATE TABLE Constructor (
    constructorId INT AUTO_INCREMENT PRIMARY KEY,
    constructorRef VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    url VARCHAR(200) NOT NULL
);

CREATE TABLE Driver (
    driverId INT AUTO_INCREMENT PRIMARY KEY,
    driverRef VARCHAR(50) NOT NULL,
    number INT,
    code VARCHAR(10),
    forename VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    url VARCHAR(200) NOT NULL
);

CREATE TABLE Race (
    raceId INT AUTO_INCREMENT PRIMARY KEY,
    year INT NOT NULL,
    round INT NOT NULL,
    circuitId INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    date DATE NOT NULL,
    time TIME,
    url VARCHAR(200) NOT NULL,
    FOREIGN KEY (circuitId) REFERENCES Circuit(circuitId)
);

CREATE TABLE Result (
    resultId INT AUTO_INCREMENT PRIMARY KEY,
    raceId INT NOT NULL,
    driverId INT NOT NULL,
    constructorId INT NOT NULL,
    number INT,
    grid INT NOT NULL,
    position INT NOT NULL,
    positionText VARCHAR(20),
    positionOrder INT,
    points FLOAT NOT NULL,
    laps INT NOT NULL,
    time TIME,
    milliseconds INT,
    fastestLap INT,
    resultRank INT,
    fastestLapTime TIME,
    fastestLapSpeed FLOAT,
    statusId INT,
    FOREIGN KEY (raceId) REFERENCES Race(raceId),
    FOREIGN KEY (driverId) REFERENCES Driver(driverId),
    FOREIGN KEY (constructorId) REFERENCES Constructor(constructorId),
    FOREIGN KEY (statusId) REFERENCES Status(statusId)
);

CREATE TABLE Status (
    statusId INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(50) NOT NULL
);

CREATE TABLE Qualifying (
    qualifyId INT AUTO_INCREMENT PRIMARY KEY,
    raceId INT NOT NULL,
    driverId INT NOT NULL,
    constructorId INT NOT NULL,
    number INT NOT NULL,
    position INT NOT NULL,
    q1 TIME NOT NULL,
    q2 TIME,
    q3 TIME,
    FOREIGN KEY (raceId) REFERENCES Race(raceId),
    FOREIGN KEY (driverId) REFERENCES Driver(driverId),
    FOREIGN KEY (constructorId) REFERENCES Constructor(constructorId)
);

CREATE TABLE ConstructorResults (
    constructorResultsId INT AUTO_INCREMENT PRIMARY KEY,
    raceId INT NOT NULL,
    constructorId INT NOT NULL,
    points FLOAT NOT NULL,
    status VARCHAR(10),
    FOREIGN KEY (raceId) REFERENCES Race(raceId),
    FOREIGN KEY (constructorId) REFERENCES Constructor(constructorId)
);

CREATE TABLE DriverStandings (
    driverStandingsId INT AUTO_INCREMENT PRIMARY KEY,
    raceId INT NOT NULL,
    driverId INT NOT NULL,
    points FLOAT NOT NULL,
    position INT NOT NULL,
    positionText VARCHAR(20),
    wins INT,
    FOREIGN KEY (raceId) REFERENCES Race(raceId),
    FOREIGN KEY (driverId) REFERENCES Driver(driverId)
);

CREATE TABLE SprintResults (
    resultId INT AUTO_INCREMENT PRIMARY KEY,
    raceId INT NOT NULL,
    driverId INT NOT NULL,
    constructorId INT NOT NULL,
    number INT,
    grid INT NOT NULL,
    position INT NOT NULL,
    positionText VARCHAR(20),
    positionOrder INT,
    points FLOAT NOT NULL,
    laps INT NOT NULL,
    time TIME,
    milliseconds INT,
    fastestLap INT,
    fastestLapTime TIME,
    statusId INT,
    FOREIGN KEY (raceId) REFERENCES Race(raceId),
    FOREIGN KEY (driverId) REFERENCES Driver(driverId),
    FOREIGN KEY (constructorId) REFERENCES Constructor(constructorId),
    FOREIGN KEY (statusId) REFERENCES Status(statusId)
);

SHOW TABLES;
DESCRIBE Race;
DESCRIBE Result;
DESCRIBE Driver;

