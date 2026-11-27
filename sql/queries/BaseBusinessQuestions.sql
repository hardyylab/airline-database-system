----- Base Business Questions -----

-- Question #1
SELECT flight_number, origin, destination, departure_time, arrival_time
FROM flight
ORDER BY flight_number DESC;

-- Question #2
SELECT COUNT(DISTINCT person.person_id) AS total_distinct, city
FROM person JOIN customer ON person.person_id = customer.person_id
GROUP BY city;

-- Question #3
WITH pilot_table(last_name, first_name, pilot_license_number) AS
	(SELECT person.last_name, person.first_name, pilot.pilot_license_number
	FROM pilot
	JOIN employee ON pilot.employee_id = employee.employee_id
	JOIN person ON employee.person_id = person.person_id)
		SELECT (last_name + ', ' + first_name) AS full_name, pilot_license_number
		FROM pilot_table
		ORDER BY pilot_license_number DESC;

-- Question #4
WITH dependent_count(total_dep, employee_id) AS
	(SELECT COUNT(DISTINCT CONCAT(employee_dependent.employee_id, employee_dependent.dependent_name)) AS total_dep, employee.employee_id
	FROM employee JOIN employee_dependent ON employee.employee_id = employee_dependent.employee_id
	GROUP BY employee.employee_id)
		SELECT (person.last_name + ', ' + person.first_name) AS full_name, dependent_count.employee_id, employee.salary, dependent_count.total_dep
		FROM employee JOIN person ON employee.person_id = person.person_id
		JOIN dependent_count ON dependent_count.employee_id = employee.employee_id
		ORDER BY full_name ASC;

-- Question #5
SELECT plane.manufacturer, plane.model_number, COUNT(aircraft.model_number) AS aircraft_count
FROM plane LEFT JOIN aircraft ON plane.model_number = aircraft.model_number
GROUP BY plane.manufacturer, plane.model_number;

-- Question #6
SELECT
    manufacturer,
    plane.model_number,
    serial_number,
    DATEDIFF(day, manufacture_date, GETDATE()) AS age_in_days  --unable to find the difference between the start and the end
FROM
    aircraft JOIN plane ON aircraft.model_number = plane.model_number
ORDER BY
    manufacture_date;

-- Question #7
SELECT
    (last_name + ', ' + first_name) AS full_name,
	passport_number,
    COALESCE(COUNT(customer_departure.flight_number), 0) AS num_departures
FROM
    customer LEFT JOIN customer_departure  ON customer.person_id = customer_departure.person_id
	JOIN person ON customer.person_id=person.person_id
GROUP BY
    last_name, first_name, passport_number;

-- Question #8
WITH dest_count(max_dest, destination) AS
	(SELECT COUNT(destination) AS num_dest, destination
	FROM customer_departure JOIN flight ON customer_departure.flight_number = flight.flight_number
	GROUP BY destination),
top_dest_count(max_dest) AS
	(SELECT MAX(max_dest)
	FROM dest_count),
top_dest(destination) AS
	(SELECT destination AS top_dest
	FROM top_dest_count JOIN dest_count ON dest_count.max_dest = top_dest_count.max_dest),
orig_count(num_orig, origin, destination) AS
	(SELECT COUNT(city) AS num_orig, city, destination
	FROM customer_departure
	JOIN flight ON customer_departure.flight_number = flight.flight_number
	JOIN person ON person.person_id = customer_departure.person_id
	GROUP BY city, destination)
		SELECT orig_count.destination AS top_destination, orig_count.origin, orig_count.num_orig AS num_flights
		FROM top_dest JOIN orig_count ON top_dest.destination = orig_count.destination;


-- Question #9
WITH city_count(max_city, city) AS
	(SELECT COUNT(city) AS num_city, city
	FROM customer JOIN person ON customer.person_id = person.person_id
	GROUP BY city),
top_city_count(max_city) AS
	(SELECT MAX(max_city)
	FROM city_count),
top_city(city) AS
	(SELECT city AS top_city
	FROM top_city_count JOIN city_count ON city_count.max_city = top_city_count.max_city),
orig_count(num_orig, origin, city) AS
	(SELECT COUNT(origin) AS num_orig, origin, city
	FROM customer_departure JOIN flight ON customer_departure.flight_number = flight.flight_number
	JOIN customer ON customer.person_id = customer_departure.person_id
	JOIN person ON person.person_id = customer.person_id
	GROUP BY origin, city)
		SELECT top_city.city AS top_city, orig_count.origin, orig_count.num_orig
		FROM top_city JOIN orig_count ON top_city.city = orig_count.city;

-- Question #10
WITH direct(flight_1) AS
	(SELECT f1.flight_number
	FROM flight AS f1
	WHERE f1.origin = 'MIA' AND f1.destination = 'STL'),
one_hop(flight_1, flight_2) AS
	(SELECT f1.flight_number, f2.flight_number
	FROM flight AS f1 JOIN flight AS f2 ON f1.destination = f2.origin
	WHERE f1.origin = 'MIA' AND f2.destination = 'STL'),
two_hop(flight_1, flight_2, flight_3) AS
	(SELECT f1.flight_number, f2.flight_number, f3.flight_number
	FROM flight AS f1 JOIN flight AS f2 ON f1.destination = f2.origin
	JOIN flight AS f3 ON f2.destination = f3.origin
	WHERE f1.origin = 'MIA' AND f3.destination = 'STL')
		SELECT flight_1 AS flight_1, NULL AS flight_2, NULL AS flight_3 FROM direct
		UNION
		SELECT flight_1, flight_2, NULL AS flight_3 FROM one_hop
		UNION
		SELECT flight_1, flight_2, flight_3 FROM two_hop;