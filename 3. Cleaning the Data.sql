DROP TEMPORARY TABLE IF EXISTS clean_bike_data_temp;
CREATE TEMPORARY TABLE clean_bike_data_temp AS
SELECT
  ride_id,
  rideable_type,
  started_at,
  ended_at,
  member_casual AS membership_type,
  CASE DAYOFWEEK(started_at) 
    WHEN 1 THEN 'SUN'
    WHEN 2 THEN 'MON'
    WHEN 3 THEN 'TUE'
    WHEN 4 THEN 'WED'
    WHEN 5 THEN 'THU'
    WHEN 6 THEN 'FRI'
    WHEN 7 THEN 'SAT'    
  END AS day_of_week,
  CASE MONTH(started_at)
    WHEN 1 THEN 'JAN'
    WHEN 2 THEN 'FEB'
    WHEN 3 THEN 'MAR'
    WHEN 4 THEN 'APR'
    WHEN 5 THEN 'MAY'
    WHEN 6 THEN 'JUN'
    WHEN 7 THEN 'JUL'
    WHEN 8 THEN 'AUG'
    WHEN 9 THEN 'SEP'
    WHEN 10 THEN 'OCT'
    WHEN 11 THEN 'NOV'
    WHEN 12 THEN 'DEC'
  END AS month,
  TIMESTAMPDIFF(MINUTE, started_at, ended_at) AS trip_duration,
  ROW_NUMBER() OVER (PARTITION BY ride_id ORDER BY started_at) AS row_num
FROM Divvy.bike_data2;

DROP TABLE IF EXISTS Divvy.clean_bike_data2;
CREATE TABLE IF NOT EXISTS Divvy.clean_bike_data2 AS
SELECT 
  ride_id,
  rideable_type,
  started_at,
  ended_at,
  membership_type,
  day_of_week,
  month,
  trip_duration
FROM clean_bike_data_temp
WHERE row_num = 1 AND trip_duration > 1 AND trip_duration < 1440;



-- Clean data returned 5,482,778 rows(98,904 rows removed)
