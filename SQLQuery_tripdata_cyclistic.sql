-- To view data. Repeated for all 12 months of data
SELECT * 
FROM cyclistic_project..apr2020_tripdata


-- To change column "ride_length" to time data structure. Repeated for all 12 months of data
ALTER TABLE cyclistic_project..apr2020_tripdata
ALTER COLUMN ride_length time 


-- To create a table that combines all trip data for 12 months
USE cyclistic_project
CREATE TABLE alltripdata (
ride_id nvarchar (255) null,
rideable_type nvarchar (255) null,
started_at datetime,
ended_at datetime,
start_station_name nvarchar (255) null,
start_station_id float,
end_station_name nvarchar (255) null,
end_station_id float null,
start_lat float null,
start_lng float null,
end_lat float null,
end_lng float null,
member_casual nvarchar (255) null,
ride_length time(7) null,
day_of_week float null)


-- To insert values into alltripdata
INSERT INTO cyclistic_project..alltripdata
SELECT * FROM
(SELECT * 
FROM cyclistic_project..apr2020_tripdata
UNION ALL 
SELECT *
FROM cyclistic_project..may2020_tripdata
UNION ALL
SELECT *
FROM cyclistic_project..jun2020_tripdata
UNION ALL
SELECT *
FROM cyclistic_project..jul2020_tripdata
UNION ALL
SELECT *
FROM cyclistic_project..aug2020_tripdata
UNION ALL
SELECT *
FROM cyclistic_project..sep2020_tripdata
UNION ALL
SELECT *
FROM cyclistic_project..oct2020_tripdata
UNION ALL
SELECT *
FROM cyclistic_project..nov2020_tripdata
UNION ALL
SELECT *
FROM cyclistic_project..dec2020_tripdata
UNION ALL
SELECT *
FROM cyclistic_project..jan2021_tripdata
UNION ALL
SELECT *
FROM cyclistic_project..feb2021_tripdata
UNION ALL
SELECT *
FROM cyclistic_project..mar2021_tripdata) AS table1


-- To view data
SELECT * FROM cyclistic_project..alltripdata



-----------------------------------------------------------------Exploratory Analysis For All 12 Months-----------------------------------------------------------------------------------

-- To get number of rides per days of the week for casual riders
SELECT day_of_week, COUNT(day_of_week) AS ride_freq
FROM cyclistic_project..alltripdata
WHERE member_casual = 'casual'
GROUP BY day_of_week
ORDER BY COUNT(day_of_week) DESC


-- To get the top start stations casual riders frequently use
SELECT TOP 5 start_station_name, COUNT(start_station_name) AS no_of_times_used
FROM cyclistic_project..alltripdata
WHERE member_casual = 'casual'
GROUP BY start_station_name
ORDER BY COUNT(start_station_name) DESC


-- To get the top start stations member riders frequently use
SELECT TOP 5 start_station_name, COUNT(start_station_name) AS no_of_times_used
FROM cyclistic_project..alltripdata
WHERE member_casual = 'member'
GROUP BY start_station_name
ORDER BY COUNT(start_station_name) DESC

-- To get the top end stations casual riders frequently use
SELECT TOP 5 end_station_name, COUNT(end_station_name) AS no_of_times_used
FROM cyclistic_project..alltripdata
WHERE member_casual = 'casual'
GROUP BY end_station_name
ORDER BY COUNT(end_station_name) DESC

-- To get the top end stations member riders frequently use
SELECT TOP 5 end_station_name, COUNT(end_station_name) AS no_of_times_used
FROM cyclistic_project..alltripdata
WHERE member_casual = 'member'
GROUP BY end_station_name
ORDER BY COUNT(end_station_name) DESC


--To get the number of member and causal rides in the 12-month period of consideration
SELECT member_casual, COUNT(member_casual) AS no_of_rides
FROM cyclistic_project..alltripdata
GROUP BY member_casual


-- To get casual rider preference from Sept2020(when diverse bikes were introduced in the program) - Mar2021
SELECT rideable_type, COUNT (member_casual) AS no_of_times_used
FROM cyclistic_project..sep2020_tripdata
WHERE member_casual = 'casual'
GROUP BY rideable_type


-- To get member rider preference Sept2020(when diverse bikes were introduced in the program) - Mar2021
SELECT rideable_type, COUNT (member_casual) AS no_of_times_used
FROM cyclistic_project..sep2020_tripdata
WHERE member_casual = 'member'
GROUP BY rideable_type


-----------------------------Exploratory Analysis on a Month-By-Month Basis--------------------------------------------------------------


--To get the number of member and causal rides in april 2020. Repeated for all 12 months of data
SELECT member_casual, COUNT(member_casual)
FROM cyclistic_project..apr2020_tripdata
GROUP BY member_casual

--To get the riding behaviour of casual riders per the days of the week. Repeated for all 12 months of data
SELECT day_of_week, COUNT(ride_id) AS no_of_rides
FROM cyclistic_project..apr2020_tripdata
WHERE member_casual = 'casual'
GROUP BY day_of_week
ORDER BY COUNT(ride_id) desc

--To get the riding behaviour of member riders per the days of the week. Repeated for all 12 months of data
SELECT day_of_week, COUNT(ride_id) AS no_of_rides
FROM cyclistic_project..apr2020_tripdata
WHERE member_casual = 'member'
GROUP BY day_of_week
ORDER BY COUNT(ride_id) desc

-- To get riding behaviour of casual riders with respect to start station used. Repeated for all 12 months of data
SELECT TOP 5 start_station_name, COUNT(start_station_name) AS no_of_times_used
FROM cyclistic_project..apr2020_tripdata
WHERE member_casual = 'casual'
GROUP BY start_station_name
ORDER BY COUNT(start_station_name) desc

-- To get riding behaviour of member riders with respect to start station used. Repeated for all 12 months of data
SELECT TOP 5 start_station_name, COUNT(start_station_name) AS no_of_times_used
FROM cyclistic_project..apr2020_tripdata
WHERE member_casual = 'member'
GROUP BY start_station_name
ORDER BY COUNT(start_station_name) desc

-- To get riding behaviour of casual riders with respect to end station used. Repeated for all 12 months of data
SELECT TOP 5 end_station_name, COUNT(end_station_name) AS no_of_times_used
FROM cyclistic_project..apr2020_tripdata
WHERE member_casual = 'casual'
GROUP BY end_station_name
ORDER BY COUNT(end_station_name) desc

--To get riding behaviour of member riders with respect to end station used. Repeated for all 12 months of data
SELECT TOP 5 end_station_name, COUNT(end_station_name) AS no_of_times_used
FROM cyclistic_project..apr2020_tripdata
WHERE member_casual = 'member'
GROUP BY end_station_name
ORDER BY COUNT(end_station_name) desc


