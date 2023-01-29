-- I chose to represent the monthly average arrival delay from planes departing from the three New York Airports grouped by airlines in 2013. 

SELECT f.month, l.name, AVG(f.arr_delay) as delay
FROM flights as f
INNER JOIN airlines as l on l.carrier = f.carrier
WHERE f.year = 2013 AND f.origin IN ('JFK', 'LGA', 'EWR')
GROUP BY f.month, l.name
ORDER BY f.month ASC;