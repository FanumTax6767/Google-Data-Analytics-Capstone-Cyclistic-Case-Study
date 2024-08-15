-- Loading the data into SQL

CREATE TABLE Divvy.bike_data2 (
	ride_id VARCHAR(100),
    rideable_type VARCHAR(100),
    started_at DATETIME,
    ended_at DATETIME,
    member_casual VARCHAR(100)
);
SET GLOBAL local_infile = true;
SHOW GLOBAL VARIABLES LIKE 'local_infile';
LOAD DATA LOCAL INFILE '/Users/liammitchell/Desktop/Divvy Data from 2024-06 ~ 2023-07/New_Divvy_Bike_Data2.csv'
INTO TABLE Divvy.bike_data2
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ride_id, rideable_type, started_at, ended_at, member_casual);

-- checking for NULL values(none found)

SELECT 
 COUNT(*) - COUNT(ride_id) ride_id,
 COUNT(*) - COUNT(rideable_type) rideable_type,
 COUNT(*) - COUNT(started_at) started_at,
 COUNT(*) - COUNT(ended_at) ended_at,
 COUNT(*) - COUNT(member_casual) member_casual
FROM Divvy.bike_data2;

-- Checking for duplicate rows(211 found)

SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS 'Duplicate rows'
FROM Divvy.bike_data2; 


-- Checking for ride times over a day(7,335 found)

SELECT COUNT(*) AS too_long
FROM Divvy.bike_data2
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) >= 1440; 

-- Checking for ride times under a minute(91,369 found)

SELECT COUNT(*) AS too_short
FROM Divvy.bike_data2
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) <= 1; 

