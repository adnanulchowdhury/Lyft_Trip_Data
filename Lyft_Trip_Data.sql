select *
from trips;

select *
from riders;

select *
from cars;

-- 1.
--What are the column names?
--Ans: 
/*
trips
name	type
id	INTEGER
date	TEXT
pickup	TEXT
dropoff	TEXT
rider_id	INTEGER
car_id	INTEGER
type	TEXT
cost	INTEGER

riders
name	type
id	INTEGER
first	TEXT
last	TEXT
username	TEXT
rating	INTEGER
total_trips	INTEGER
referred	INTEGER

cars
name	type
id	INTEGER
model	TEXT
OS	TEXT
status	TEXT
trips_completed	INTEGER
*/

-- 2.
--What’s the primary key of trips?
--Ans: id
--What’s the primary key of riders?
--Ans: id
--What’s the primary key of cars?
--Ans: id

select riders.first,
  riders.last,
  cars.model
from riders, cars;

-- 3. 
-- Try out a simple cross join between riders and cars.
-- Is the result useful?
--Ans: The result comibines each user with every car model. Its not very useful.

select *
from trips
left join riders
  on trips.rider_id = riders.id;

-- 4.
--Suppose we want to create a Trip Log with the trips and its users. Find the columns to join between trips and riders and combine the two tables using a LEFT JOIN. Let trips be the left table.
--Ans: the query for this is listed above the question.

select *
from trips
join cars
  on trips.car_id = cars.id;

--5.
--Suppose we want to create a link between the trips and the cars used during those trips.Fin the columns to join on and combine the trips and cars table using an INNER JOIN.
--Ans: the query for this is listed above the question.

select *
from riders
union
select *
from riders2;

--6.
--The new riders data are in! There are three new users this month. Stack the riders table on top of the new table named riders2.
--Ans: the query for this is listed above the question.

--Bonus:Queries and Aggregates

select avg(cost)
from trips;

--7.
--What is the average cost for a trip?
--Ans: 31.915

select *
from riders
where total_trips < 500
union
select *
from riders2
where total_trips < 500;

--8.
--Lyft is looking to do an email campaign for all the irregular users. Find all the riders who have used Lyft less than 500 times!
--Ans: 
/*
id	first	last	username	rating	total_trips	referred
101	Sonny	Li	@sonnynomnom	4.66	352	
103	Kassa	Korley	@kassablanca	4.63	42	
106	Eric	Vaught	@posturelol	4.96	54	101
107	Jilly	Beans	@jillkuzmin	4.7	32	101
*/

select *
from cars
where status = 'active';

--9.
-- Calculate the number of cars that are active.
--Ans:
/*
id	model	OS	status	trips_completed
1	Ada	Ryzac	active	82
2	Ada	Ryzac	active	30
3	Turing XL	Ryzac	active	164
*/

select *
from cars
order by trips_completed desc
limit 2;

--10.
--It’s safety recall time for cars that have been on the road for a while. Write a query that finds the two cars that have the highest trips_completed.
--Ans:
/*
id	model	OS	status	trips_completed
3	Turing XL	Ryzac	active	164
1	Ada	Ryzac	active	82
*/