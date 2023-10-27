create database weather;
use weather;
select * from weather;
-- Task 1: Find all the wind speed values
SELECT  distinct(`Wind speed_km/h`) from weather;

-- Task 2 : Find the number of times when the weather is exactly clear
select count(weather) from weather where weather="clear";

-- Task 3: Find the number of times when the wind speed is exactly 4km/h
select count(`wind speed_km/h`) from weather where `wind speed_km/h`=4;


-- Task 4: Find out all the null values in the data

SELECT  count(`Date/Time`) as Date_Time,count(Temp_C) as Temp_C,count(`Dew Point Temp_C`) as dew_point,count(`Rel Hum_%`) as rel_hum,
count(`Wind Speed_km/h`) as Wind_Speed_km,count(Visibility_km) as Visibility_km,count(Press_kPa) as Press_kPa,count(Weather) as Weather
from weather where `Date/Time` is null or Temp_C is null or `Dew Point Temp_C`is null or `Rel Hum_%` is null or `Wind Speed_km/h` is null or
Visibility_km is null or Press_kPa is null or Weather is null ;


-- Task 5: Rename the column name weather to "weather condition"

ALTER TABLE weather RENAME COLUMN WEATHER TO WEATHER_CONDITION;


-- Task 6: What is the mean visibility?

SELECT round(avg(Visibility_km),2) as mean_visibility  from weather;


-- Task 7: What is the Standard deviation of pressure ?

SELECT round(std(Press_kPa),2) as pressure_std from weather;


-- Task 8: What is the variance of "Relative humidity" in the data ?

SELECT round(variance(`Rel Hum_%`),2) AS var_rel_hum from weather;


-- Task 9: Find all the instances where weather condition is snow.

SELECT * FROM weather where weather_condition REGEXP "SNOW";


-- Task 10 : Find all the instances when wind speed is above 24 and visibility is 25

SELECT * FROM weather where `Wind Speed_km/h`>24 AND Visibility_km =25;


-- Task 11 : What is the mean value of each column against each weather condition ?

SELECT weather_condition,avg(Temp_C),avg(`Dew Point Temp_C`),avg(`Rel Hum_%`),
avg(`Wind Speed_km/h`),avg(Visibility_km),avg(Press_kPa) from 
weather group by weather_condition;


-- Task 12 : What is the minimum and maximum value of each column against each weather condition ?

SELECT weather_condition,min(Temp_C),min(`Dew Point Temp_C`),min(`Rel Hum_%`),
min(`Wind Speed_km/h`),min(Visibility_km),min(Press_kPa) from 
weather group by weather_condition;



SELECT weather_condition,max(Temp_C),max(`Dew Point Temp_C`),max(`Rel Hum_%`),
max(`Wind Speed_km/h`),max(Visibility_km),max(Press_kPa) from 
weather group by weather_condition;


-- Task 13 : Show all the records where weather condition is fog ?

SELECT * FROM weather WHERE weather_condition REGEXP "fog";


-- Task 14 : Find all the instances where weather is clear or visibility is above 40

SELECT * FROM weather where weather_condition REGEXP "clear" or Visibility_km >40;


-- Task 15 : Find all the instances when weather is clear and relative humidity is greater than 50 or visibility is above 40

SELECT * FROM weather where weather_condition REGEXP "clear" and `Rel Hum_%` >50 or Visibility_km >40;
