# User Requirements — Airline Database Management System

## 1. Project Overview

The goal of this project is to design and implement a relational database that supports essential airline operations, including flight scheduling, aircraft management, customer reservations, and employee assignments.

The system should maintain relationships between these entities, enforce data integrity, and support business queries that help analyze airline operations.

## 2. Core Functional Requirements

### Flight and Departure Management
- Maintain flight information, including flight number, origin, destination, departure time, and arrival time.
- Track individual departures by associating a flight with a specific date and aircraft.
- Allow flights and aircraft to participate in multiple departures.

### Aircraft Management
- Maintain aircraft models, manufacturers, serial numbers, and manufacture dates.
- Associate each aircraft with exactly one plane model.
- Track which plane models individual pilots are qualified to operate.

### Employee and Pilot Management
- Store employee information, including personal details, salary, contact information, and dependents.
- Support employee specialization into licensed pilots.
- Assign employees to departures, ensuring every departure has at least one assigned employee.
- Allow pilots to qualify for multiple plane models.

### Customer and Reservation Management
- Maintain customer information, including names, addresses, contact details, and passport numbers.
- Allow customers to reserve tickets for multiple departures.
- Support multiple customers associated with the same departure.

## 3. Extended Requirements

The project extends the original airline database design with additional functionality.

**Ticket Management**
- Store ticket numbers, travel classes, prices, checked-baggage allowances, and seat numbers.
- Associate each ticket with exactly one customer and one departure.
- Allow customers and departures to have multiple associated tickets.

**Employee Management**
- Introduce manager–employee relationships.
- Require each employee to report to one manager.
- Allow managers to supervise multiple employees.

## 4. Data Integrity Requirements

The database should:

- Enforce primary and foreign key relationships.
- Maintain referential integrity between related entities.
- Apply required fields, data types, and domain constraints.
- Support strong and weak entities, specialization, and many-to-many relationships.
- Minimize unnecessary data redundancy through appropriate conceptual design.

## 5. Business Query Requirements

The system should support SQL queries to answer operational and analytical questions, including:

- Flight schedules and available multi-stop routes.
- Customer distribution by city and departure history.
- Employee records, salaries, and dependent counts.
- Pilot qualifications and flight activity.
- Aircraft inventory and age.
- Popular destinations and opportunities for new flight routes.
- Potential shuttle-service demand based on customer locations.

Queries should demonstrate joins, aggregation, sorting, and Common Table Expressions (CTEs).

## 6. Project Scope

This project was developed as part of CPSC 324 at the University of Northern British Columbia in 2024.

The database represents a simplified airline management system rather than a production-ready application. Formal normalization, physical database optimization, and several broader airline operations were outside the original coursework scope.