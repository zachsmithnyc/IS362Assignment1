-- Question 1 -- 

SELECT COUNT(*)
FROM planes
WHERE speed IS NOT NULL;

-- Answer 23 --

SELECT MAX(speed)
FROM planes;

SELECT MIN(speed)
FROM planes;

-- Max Speed = 432 --
-- Min Speed = 90 --

-- Question 2 -- 

SELECT SUM(distance)
FROM flights
WHERE year = 2013 AND month = 1;

-- Answer = 27188805 -- 

SELECT SUM(distance)
FROM flights
WHERE year = 2013 AND month = 1 AND tailnum = "";

-- Answer = 81763 --

-- Question 3 --

SELECT p.manufacturer, SUM(f.distance) as distance
FROM flights as f
INNER JOIN planes as p ON f.tailnum = p.tailnum
WHERE f.year = 2013 AND f.month = 7 AND f.day = 5
GROUP BY p.manufacturer
ORDER BY distance DESC;

SELECT p.manufacturer, SUM(f.distance) as distance
FROM flights as f
LEFT JOIN planes as p ON f.tailnum = p.tailnum
WHERE f.year = 2013 AND f.month = 7 AND f.DAY = 5
GROUP BY p.manufacturer
ORDER BY distance DESC;

-- Left join returns a row which counts up the distance flown by planes which had a tail number but not a manufacturer listed in the flights table --
-- Inner join result does not include this data since there is not a match between both tables --

-- Question 4 -- 
-- Using an inner join calculate the average air time of planes going from JFK to Chicago O'Hare in June of 2013 grouped by model --

SELECT f.origin, f.dest, p.model, AVG(w.temp) as temp
FROM flights as f
INNER JOIN planes as p ON f.tailnum = p.tailnum
INNER JOIN weather as w ON w.origin = f.origin
WHERE f.year = 2013 AND f.month = 6 AND f.dest = 'ORD' AND f.origin = 'JFK'
GROUP BY p.model
ORDER BY temp DESC;
