-- 2 flight
INSERT INTO flight(flight_number, origin, destination, departure_time, arrival_time)
VALUES (998, 'YXS', 'YVR', '13:00', '14:20'),
	   (999, 'YVR', 'YXS', '15:00', '16:20');

-- 1 plane
INSERT INTO plane(model_number, manufacturer)
VALUES ('N2019C','Bombardier');

-- 4 person (2 customer, 2 employee)
INSERT INTO person(person_id, first_name, middle_name, last_name, street_number, street_name, city, province_state, country, primary_phone)
VALUES (14, 'Ethan', 'Ball', 'Wilkinson', '3538', 'Selah St.', 'Prince George', 'British Columbia', 'Canada', '+1 801-324-9182'),
	   (15, 'Harrison', 'Chaney', 'Woodward', '2265', 'Marietta St.', 'Prince George', 'British Columbia', 'Canada', '+1 801-884-0948'),
	   (16, 'Owen', 'Thornton', 'Holder', '3241', 'Charles St.', 'Prince George', 'British Columbia', 'Canada', '+1 801-379-7099'),
	   (17, 'Colin', 'Austin', 'Andrade', '2571', 'Rosewood St.', 'Prince George', 'British Columbia', 'Canada', '+1 801-267-4905');

-- 2 employee
INSERT INTO employee(employee_id, person_id, salary)
VALUES (1008, 14, '65000'),
	   (1009, 15, '100000');

-- 1 pilot
INSERT INTO pilot(employee_id, pilot_license_number)
VALUES (1008, '1234asdf6789zxcv');

-- 2 customer
INSERT INTO customer(person_id, passport_number)
VALUES (16, 'kpol9374qwer8475'),
	   (17, 'yuio3456zxcv1234');

-- 1 aircraft
INSERT INTO aircraft(serial_number, model_number, manufacture_date)
VALUES ('99', 'N2019C', '2020/05/17');

-- 2 departure (1 for each flight)
INSERT INTO departure(departure_date, serial_number, model_number, flight_number)
VALUES ('2024/04/09', '99', 'N2019C', 998),
	   ('2024/04/09', '99', 'N2019C', 999);

-- 2 customer_departure
INSERT INTO customer_departure(person_id, departure_date, serial_number, model_number, flight_number)
VALUES (16, '2024/04/09', '99', 'N2019C', 998),
	   (17, '2024/04/09', '99', 'N2019C', 999);

-- 4 employee_departure
INSERT INTO employee_departure(employee_id, departure_date, serial_number, model_number, flight_number)
VALUES (1008, '2024/04/09', '99', 'N2019C', 998),
	   (1008, '2024/04/09', '99', 'N2019C', 999),
	   (1009, '2024/04/09', '99', 'N2019C', 998),
	   (1009, '2024/04/09', '99', 'N2019C', 999);

-- 1 pilot_plane
INSERT INTO pilot_plane(employee_id, model_number)
VALUES (1008, 'N2019C');


