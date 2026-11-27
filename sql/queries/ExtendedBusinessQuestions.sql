--Shows only your new entities

SELECT * 
FROM flight
WHERE flight_number > 997;


SELECT * 
FROM plane
WHERE model_number = 'N2019C';


SELECT * 
FROM person
WHERE person_id > 13;


SELECT * 
FROM employee
WHERE employee_id > 1007;



SELECT * 
FROM pilot
WHERE pilot.employee_id = 1008;



SELECT * 
FROM customer
WHERE customer.person_id > 15;


SELECT *
FROM aircraft
WHERE serial_number = '99' AND model_number = 'N2019C';


SELECT *
FROM departure
WHERE (departure_date = '2024/04/09' AND serial_number = '99' AND  model_number = 'N2019C' AND flight_number = 998) 
OR (departure_date = '2024/04/09' AND serial_number = '99' AND model_number = 'N2019C' AND flight_number = 999);



--Shows how only your new entities
--participate in at least one departure


SELECT customer.person_id, passport_number, departure_date, serial_number, model_number, flight_number
FROM customer_departure JOIN customer ON customer_departure.person_id = customer.person_id
WHERE customer.person_id > 15


SELECT employee.employee_id, person_id, salary, departure_date, serial_number, model_number, flight_number
FROM employee_departure JOIN employee ON employee_departure.employee_id = employee.employee_id
WHERE employee.employee_id > 1007


SELECT *
FROM pilot_plane
WHERE employee_id = 1008 AND model_number = 'N2019C';
	  


--custom business question
--Determine each pilot's license number, full name (first and last), and the total number of flights they have taken out in the previous month.
--This knowledge may be useful for:
--Pilot Performance Evaluation: It lets you know how active a pilot is in a certain amount of time.
--Workload Distribution Analysis: It assists in locating pilots who depart frequently, which may suggest that their workload needs to be adjusted.
--Pilot Activity Levels: This information can be utilized to customize flight assignments or training regimens.
--This query may be used for a number of reasons in airline operations and offers a picture of recent pilot activity by monitoring departures during the last month.



DECLARE @startDate DATE = DATEADD(month, -1, GETDATE()); 

WITH PilotDepartures AS (
  SELECT e.employee_id AS pilot_id, ed.departure_date
  FROM employee e
  JOIN pilot p ON e.employee_id = p.employee_id
  JOIN employee_departure ed ON e.employee_id = ed.employee_id
  JOIN departure d ON ed.departure_date = d.departure_date
  WHERE d.departure_date >= @startDate
)

SELECT per.person_id, p.pilot_license_number, CONCAT(per.first_name, ' ', per.last_name) AS full_name, COUNT(*) AS total_flights
FROM PilotDepartures pd
JOIN employee e ON pd.pilot_id = e.employee_id
INNER JOIN person per ON e.person_id = per.person_id  
INNER JOIN pilot p ON e.employee_id = p.employee_id
GROUP BY per.person_id, p.pilot_license_number, per.first_name, per.last_name
ORDER BY total_flights DESC;