-- Strong entity sets

INSERT INTO flight(flight_number, origin, destination, departure_time, arrival_time)
VALUES (100, 'SLC', 'BOS', '08:00', '17:50'),
	   (112, 'DCA', 'DEN', '14:00', '18:07'),
	   (121, 'STL', 'SLC', '07:00', '09:13'),
	   (122, 'STL', 'YYV', '08:30', '10:19'),
	   (206, 'DFW', 'STL', '21:00', '23:43'),
	   (330, 'JFK', 'YYV', '16:00', '18:53'),
	   (334, 'ORD', 'MIA', '12:00', '14:14'),
	   (335, 'MIA', 'ORD', '15:00', '17:14'),
	   (336, 'ORD', 'MIA', '18:00', '20:14'),
	   (337, 'MIA', 'ORD', '20:30', '23:53'),
	   (394, 'DFW', 'MIA', '19:00', '21:30'),
	   (395, 'MIA', 'DFW', '09:00', '11:40'),
	   (449, 'CDG', 'DEN', '10:00', '19:29'),
	   (930, 'YYV', 'DCA', '13:00', '16:10'),
	   (931, 'DCA', 'YYV', '17:00', '18:10'),
	   (932, 'DCA', 'YYV', '18:00', '19:10'),
	   (991, 'BOS', 'ORD', '17:00', '18:22');

INSERT INTO plane(model_number, manufacturer)
VALUES ('A310', 'Airbus'),
	   ('A320', 'Airbus'),
	   ('A330', 'Airbus'),
	   ('A340', 'Airbus'),
	   ('B727', 'Boeing'),
	   ('B747', 'Boeing'),
	   ('B757', 'Boeing'),
	   ('DC10', 'MD'),
	   ('DC9', 'MD');

-- Strong entity sets involving generalization

INSERT INTO person(person_id, first_name, middle_name, last_name, street_number, street_name, city, province_state, country, primary_phone)
VALUES (1, 'Sally', 'Bay', 'Clark','223', 'Easy St', 'Langley', 'British Columbia', 'Canada', '+1 801-193-2320'),
	   (2, 'Jon', 'Beck', 'Edwards', '567', 'Spruce St.', 'Merrit', 'British Columbia', 'Canada', '+1 801-228-6729'),
	   (3, 'Alice', NULL, 'Gates', '285', 'Kapok St.', 'New Westminster', 'British Columbia', 'Canada', '+1 801-493-2203'),
	   (4, 'Eve', 'Birch', 'Green', '435', 'Alder St.', 'North Vancouver', 'British Columbia', 'Canada', '+1 801-933-2320'),
	   (5, 'Mallory', 'Blue', 'Hooper', '456', 'Maple St.', 'Vernon', 'British Columbia', 'Canada', '+1 313-912-2101'),
	   (6, 'Jim', 'Bree', 'Jones', '234', 'Oak St.', 'Kelowna', 'British Columbia', 'Canada', '+1 801-552-2943'),
	   (7, 'Erin', 'Bryn', 'MacBride', '789', 'Fir St.', 'Penticton', 'British Columbia', 'Canada', NULL),
	   (8, 'Bobby', 'Chan', 'Majeris', '678', 'Willow St.', 'Osoyoos', 'British Columbia', 'Canada', NULL),
	   (9, 'Daniel', NULL, 'Peters', '345', 'Pine St.', 'Langley', 'British Columbia', 'Canada', '+1 801-393-2230'),
	   (10, 'Ashish', 'Dane', 'Phillips', '395', 'Pine St.', 'Merrit', 'British Columbia', 'Canada', '+1 801-323-2320'),
	   (11, 'Michel', 'Day', 'Rowe', '348', 'Elder St.', 'New Westminster', 'British Columbia', 'Canada', '+1 801-343-2320'),
	   (12, 'Darren', NULL, 'Smith', '123', 'Elm St.', 'North Vancouver', 'British Columbia', 'Canada', '+1 801-556-2239'),
	   (13, 'Bill', 'Dot', 'Warnock', '775', 'Main St.', 'Vernon', 'British Columbia', 'Canada', '+1 801-303-2222');

INSERT INTO employee(employee_id, person_id, salary)
VALUES (1006, 1, '150000'),
	   (1005, 3, '5000000'),
	   (1001, 6, '50000'),
	   (1002, 9, '45000'),
	   (1004, 10, '25000'),
	   (1003, 11, '35000'),
	   (1007, 13, '500000');

INSERT INTO employee_dependent(dependent_name, employee_id)
VALUES ('Alycia Bethea', 1006),
	   ('Breana Demars', 1007),
	   ('Brinda Estes', 1007),
	   ('Celinda Schrage', 1002),
	   ('Chadwick Squires', 1006),
	   ('Chaya Gaffney', 1004),
	   ('Deneen Nesbit', 1002),
	   ('Hettie Biles', 1002),
	   ('Lavern Ostrom', 1002),
	   ('Monte Hoard', 1006);

INSERT INTO pilot(employee_id, pilot_license_number)
VALUES (1001, 'a8asdf8asdf8as8f'),
	   (1002, '234fsf345kloj235'),
	   (1003, '342kjjkl243fs23m');

INSERT INTO customer(person_id, passport_number)
VALUES (2, 'asfd1234qwer1234'),
	   (3, 'hjkl7698uyoi1235'),
	   (4, '1324jhdui234bnsf'),
	   (5, '23iusfoi234234sd'),
	   (7, 'asdf23498dsgn235'),
	   (9, 'sdfuap0sf823nhj2'),
	   (10, 'safdaskjfhw3r129'),
	   (11, 'asfdijalsdkhj213'),
	   (12, 'asdlkfjh234iohaf'),
	   (13, 'sadfjuoiywr12938');

-- Weak entity sets

INSERT INTO aircraft(serial_number, model_number, manufacture_date)
VALUES ('10', 'B747', '2005/01/05'),
	   ('11', 'B727', '2007/03/13'),
	   ('13', 'B727', '1990/02/02'),
	   ('13', 'B747', '2011/02/15'),
	   ('21', 'DC10', '2002/02/13'),
	   ('21', 'DC9', '2000/05/12'),
	   ('22', 'B757', '1995/12/01'),
	   ('22', 'DC9', '2012/09/01'),
	   ('23', 'DC9', '2009/04/13'),
	   ('24', 'DC9', '2009/04/13'),
	   ('70', 'A310', '2005/06/05'),
	   ('80', 'A320', '1999/07/01'),
	   ('93', 'B757', '1997/08/12');

INSERT INTO departure(departure_date, serial_number, model_number, flight_number)
VALUES ('2024/11/01', '11', 'B727', 100),
	   ('2024/11/01', '21', 'DC10', 112),
	   ('2024/11/01', '11', 'B727', 206),
	   ('2024/11/01', '80', 'A320', 334),
	   ('2024/11/01', '80', 'A320', 395),
	   ('2024/11/01', '22', 'B757', 991),
	   ('2024/10/31', '11', 'B727', 100),
	   ('2024/10/31', '11', 'B727', 112),
	   ('2024/10/31', '13', 'B727', 206),
	   ('2024/10/31', '22', 'B757', 334),
	   ('2024/10/31', '70', 'A310', 335),
	   ('2024/10/31', '24', 'DC9', 337),
	   ('2024/10/31', '22', 'B757', 449);

-- Relationship sets

INSERT INTO customer_departure(person_id, departure_date, serial_number, model_number, flight_number)
VALUES (2, '2024/11/01', '11', 'B727', 100),
	   (2, '2024/10/31', '22', 'B757', 449),
	   (3, '2024/11/01', '22', 'B757', 991),
	   (3, '2024/10/31', '13', 'B727', 206),
	   (3, '2024/11/01', '80', 'A320', 334),
	   (7, '2024/11/01', '22', 'B757', 991),
	   (9, '2024/11/01', '11', 'B727', 100),
	   (10, '2024/10/31', '22', 'B757', 449),
	   (11, '2024/11/01', '11', 'B727', 100),
	   (12, '2024/11/01', '22', 'B757', 991),
	   (12, '2024/10/31', '11', 'B727', 100),
	   (13, '2024/10/31', '22', 'B757', 449);

INSERT INTO employee_departure(employee_id, departure_date, serial_number, model_number, flight_number)
VALUES (1001, '2024/11/01', '11', 'B727', 100),
	   (1001, '2024/10/31', '11', 'B727', 100),
	   (1002, '2024/11/01', '11', 'B727', 100),
	   (1002, '2024/10/31', '11', 'B727', 100),
	   (1003, '2024/10/31', '11', 'B727', 100),
	   (1003, '2024/10/31', '24', 'DC9', 337),
	   (1004, '2024/10/31', '11', 'B727', 100),
	   (1004, '2024/10/31', '24', 'DC9', 337),
	   (1005, '2024/10/31', '24', 'DC9', 337),
	   (1006, '2024/11/01', '22', 'B757', 991),
	   (1006, '2024/10/31', '24', 'DC9', 337),
	   (1007, '2024/11/01', '11', 'B727', 100),
	   (1007, '2024/11/01', '22', 'B757', 991),
	   (1007, '2024/10/31', '13', 'B727', 206);

INSERT INTO pilot_plane(employee_id, model_number)
VALUES (1001, 'B727'),
	   (1001, 'B747'),
	   (1001, 'DC10'),
	   (1002, 'A320'),
	   (1002, 'A340'),
	   (1002, 'B757'),
	   (1002, 'DC9'),
	   (1003, 'A310'),
	   (1003, 'DC9');


