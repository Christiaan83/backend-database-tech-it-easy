DROP TABLE IF EXISTS WallBrackets CASCADE;
DROP TABLE IF EXISTS CiModules CASCADE;
DROP TABLE IF EXISTS RemoteControls CASCADE;
DROP TABLE IF EXISTS Televisions CASCADE;
DROP TABLE IF EXISTS Users CASCADE;

CREATE TABLE Users
(
	username VARCHAR(100) NOT NULL,
	password VARCHAR(100) NOT NULL 
);


 CREATE TABLE RemoteControls
 (
	remoteControlID SERIAL PRIMARY KEY,
	remoteControlName VARCHAR(100)NOT NULL,
	remoteControlBrand VARCHAR(50)NOT NULL,
	price DOUBLE PRECISION NOT NULL,
	currentStock INT NOT NULL,
	sold INT NOT NULL,
	compatibleWith VARCHAR(100)NOT NULL,
	batteryType VARCHAR(50)NOT NULL,
	televisionID INT NOT NULL
	
);

CREATE TABLE CiModules
(
	ciModuleID SERIAL PRIMARY KEY,
	ciModuleName VARCHAR(100) NOT NULL,
	ciModuleBrand VARCHAR(50) NOT NULL,
	price DOUBLE PRECISION NOT NULL,
	currentStock INT NOT NULL,
	sold INT NOT NULL,
	televisionID INT

);


CREATE TABLE WallBrackets
(
	wallBracketID SERIAL PRIMARY KEY,
	wallBracketName VARCHAR(100)NOT NULL,
	wallBracketBrand VARCHAR(50)NOT NULL,
	price DOUBLE PRECISION NOT NULL,
	currentStock INT NOT NULL,
	sold INT NOT NULL,
	adjustable BOOL,
	televisionID INT NOT NULL
);

CREATE TABLE Televisions
(
	televisionID SERIAL PRIMARY KEY,
	televisionName VARCHAR(100) NOT NULL,
	televisionBrand VARCHAR(50)NOT NULL,
	price DOUBLE PRECISION NOT NULL,
	currentStock INT NOT NULL,
	sold INT NOT NULL,
	televisionType VARCHAR(50)NOT NULL,
	available DOUBLE PRECISION NOT NULL,
	refreshRate DOUBLE PRECISION NOT NULL,
	screenType VARCHAR(50) NOT NULL,
	remoteControlID INT,
	ciModuleID INT,
	wallBracketID INT,
	FOREIGN KEY (remoteControlID) REFERENCES RemoteControls(remoteControlID),
	FOREIGN KEY (ciModuleID) REFERENCES CiModules(ciModuleID),
	FOREIGN KEY (wallBracketID) REFERENCES WallBrackets(wallBracketID)	
);




INSERT INTO Televisions (televisionName, televisionBrand, price, currentStock, sold, televisionType, available, refreshRate, screenType) VALUES ('The Frame', 'Samsung', 1549, 14, 5,'LED', 13, 100, '4K'), ('OLED856', 'Phillips', 1635, 3, 7, 'OLED', 2, 120, '4K'); 
INSERT INTO Remotecontrols (remotecontrolName, remotecontrolBrand, price, currentStock, sold, compatibleWith, batteryType, televisionID ) VALUES ('bn59-01330j', 'Samsung', 45, 14, 5, 'Samsung The Frame', '2 X AAA',1),('IntelliVue', 'Philips', 55, 3, 7, 'Phillips OLED856','CR2430', 2);
INSERT INTO CiModules (ciModuleName, ciModuleBrand, price, currentStock, sold, televisionID) VALUES('CI+ Module 1.4', 'Quantis Ziggo', 50, 5, 3, 0), ('CAM module 1.2', 'Canal Digitaal', 59, 2, 1, 1);
INSERT INTO WallBrackets (wallBracketName, wallBracketBrand, price, currentStock, sold, adjustable, televisionID) VALUES('TVM 7675 Elektrische tv-muurbeugel', 'Volgels', 899, 3, 2, TRUE, 2), ('COMFORT // Vast', 'Vogels', 49, 10, 8, FALSE, 2);

UPDATE Televisions SET remoteControlID = 1 WHERE televisionID = 1;
UPDATE Televisions SET remoteControlID = 2 WHERE televisionID = 2;

SELECT * FROM Televisions;
SELECT * FROM WallBrackets;
SELECT * FROM CiModules;
SELECT * FROM RemoteControls;

SELECT TelevisionName, TelevisionBrand, Price FROM Televisions;

SELECT t.TelevisionName, t.TelevisionBrand, t.Price, r.remoteControlName, r.remoteControlBrand
FROM Televisions t
JOIN RemoteControls r ON t.televisionID = r.televisionID;

