-----------------Drop any tables that will be created, preserving referential integrity ----------


DROP TABLE customer_departure;
DROP TABLE employee_departure;
DROP TABLE pilot_plane;
DROP TABLE departure;

DROP TABLE aircraft;
DROP TABLE employee_dependent;

DROP TABLE flight;
DROP TABLE plane;
DROP TABLE pilot;
DROP TABLE employee;
DROP TABLE customer;
DROP TABLE person;

-----------------Create strong entity sets--------------------------------
CREATE TABLE flight(
	flight_number	int PRIMARY KEY,
	origin			char(3) NOT NULL,
	destination		char(3) NOT NULL,
	departure_time		char(5) NOT NULL,
	arrival_time		char(5) NOT NULL,
	CONSTRAINT valid_origin CHECK (len(origin)=3),
	CONSTRAINT valid_destination CHECK (len(destination)=3),
	CONSTRAINT valid_departure_time CHECK (len(departure_time)=5),
	CONSTRAINT valid_arrival_time CHECK (len(arrival_time)=5)
);

CREATE TABLE plane (
	model_number	varchar(16) PRIMARY KEY,
	manufacturer	varchar(15) not null
);


---Create Strong Entity Sets Involving Generalization------
--Note the following is also used:
--  Composite and multivalued attributes
--  Derived attributes are not stored (need to be calculated dynamically, e.g., with a view)

CREATE TABLE person (
	person_id		int PRIMARY KEY,
	first_name		varchar(50) not null,
	middle_name		varchar(50),
	last_name		varchar(50) not null,
	street_number	varchar(50) not null,
	street_name		varchar(50) not null,
	city			varchar(50) not null,
	province_state	varchar(50),
	country			varchar(50) not null,
	primary_phone	varchar(20) 
);

CREATE TABLE employee (
	employee_id	int PRIMARY KEY,
	person_id	int UNIQUE,
	salary		money,
	constraint min_employee_salary check(salary > 20000),
	FOREIGN KEY (person_id) REFERENCES person
);

CREATE TABLE employee_dependent(
	dependent_name	varchar(100),
	employee_id		int,
	PRIMARY KEY(dependent_name,employee_id),
	FOREIGN KEY(employee_ID) REFERENCES employee
);

CREATE TABLE pilot(
	employee_id				int PRIMARY KEY,
	pilot_license_number	varchar(16),
	FOREIGN KEY(employee_id) REFERENCES employee
);

CREATE TABLE customer(
	person_id		int PRIMARY KEY,
	passport_number	varchar(16),
	FOREIGN KEY (person_id) REFERENCES person
);			  			  

---------------------Create Weak Entity Sets-------------------------

CREATE TABLE aircraft (			
	serial_number		varchar(16),
	model_number		varchar(16),
	manufacture_date	date not null,
	PRIMARY KEY (serial_number, model_number),
	FOREIGN KEY (model_number) REFERENCES plane
);

CREATE TABLE departure (		
	departure_date	date,
	serial_number	varchar(16),
	model_number	varchar(16),
	flight_number	int,
	PRIMARY KEY (departure_date, serial_number, model_number, flight_number),
	FOREIGN KEY (flight_number) REFERENCES flight,
	FOREIGN KEY (serial_number,model_number) REFERENCES aircraft
);

------------------------------Create Relationship Sets------------------
CREATE TABLE customer_departure(
	person_id		int,
	departure_date	date,
	serial_number	varchar(16),
	model_number	varchar(16),
	flight_number	int,
	PRIMARY KEY (person_id,departure_date,serial_number,model_number,flight_number),
	FOREIGN KEY (person_id) REFERENCES customer,
	FOREIGN KEY (departure_date,serial_number,model_number,flight_number) REFERENCES departure
);

CREATE TABLE employee_departure(
	employee_id	int,
	departure_date	date,
	serial_number	varchar(16),
	model_number	varchar(16),
	flight_number	int,
	PRIMARY KEY (employee_id, departure_date, serial_number, model_number, flight_number),
	FOREIGN KEY (employee_id) REFERENCES employee,
	FOREIGN KEY (departure_date,serial_number,model_number,flight_number) REFERENCES departure
);

CREATE TABLE pilot_plane(
	employee_id int,
	model_number	varchar(16),
	PRIMARY KEY(employee_id, model_number),
	FOREIGN KEY (employee_id) REFERENCES pilot,
	FOREIGN KEY (model_number) REFERENCES plane
);

---------------------------ADDED REQUIREMENT-----------------------------------
--ticket class
--this entity has a total participation with the other entities
--ticket_number is the primary key
--constraint makes sure that the price is greater than 0
CREATE TABLE ticket(
	ticket_number numeric(14,0),
	class varchar(8) NOT NULL,
	price numeric(5,2),
	seat_number char(3)NOT NULL,
	flight_number char(6) NOT NULL,
	departure_date date NOT NULL,
	model_number char(16) NOT NULL,
	serial_number char(16) NOT NULL,
	person_id int NOT NULL, 
	PRIMARY KEY(ticket_number),
	FOREIGN KEY (flight_number, departure_date, model_number, serial_number) REFERENCES departure(flight_number, departure_date, model_number, serial_number),
	FOREIGN KEY (person_id) REFERENCES customer,
	CONSTRAINT positive_price CHECK (price > 0),
	CONSTRAINT seat_number_chars CHECK (len(seat_number) = 3)
);
