# Library Event Management Database

A relational database project designed to manage library events, including event details, event types, rooms, staff, members, and ticket costs. The project demonstrates the design and implementation of a structured relational database using SQL, with appropriate primary keys, foreign keys, constraints, and sample data.


## 📌 Project Overview

The database is designed to maintain relationships between different entities involved in event management, such as:

* Events
* Event Types
* Rooms
* Staff
* Members
* Event-related information and ticket costs

The project focuses on applying relational database principles to create a well-structured and maintainable database system.


## 🎯 Project Objectives

The main objectives of this project are to:

* Design a structured relational database for library event management.
* Store and organise event-related information efficiently.
* Establish relationships between related entities using foreign keys.
* Use primary keys to uniquely identify records.
* Apply constraints to maintain data integrity and consistency.
* Include sample data for testing and demonstration.
* Provide SQL queries for retrieving and analysing stored information.



## 🗄️ Database Tables

The database contains the following tables:

| Table          | Purpose                                  |
| -------------- | ---------------------------------------- |
| `Event`        | Stores library event information         |
| `EventBooking` | Records member bookings for events       |
| `EventType`    | Stores different types of library events |
| `Feedback`     | Stores event ratings and comments        |
| `Member`       | Stores member information                |
| `Room`         | Stores room details and facilities       |
| `RoomPayment`  | Records event-related payments           |
| `Staff`        | Stores staff information                 |



## 🧩 Database Features

The database demonstrates several important relational database concepts:

### Primary Keys
Each table has a primary key that uniquely identifies its records.

### Foreign Keys
Foreign keys establish relationships between tables and help maintain referential integrity.

### Data Validation
Constraints are used to ensure that invalid data is not stored. For example:

```sql
CHECK (`Event_Duration` > 0)
```

This ensures that an event cannot have a duration of zero or a negative duration.

### Data Types
Appropriate SQL data types are used for different types of information, including:

* `INT` for identifiers and numerical values
* `VARCHAR` for text
* `DATE` for event dates
* `DECIMAL` for ticket costs

---

## 🛠️ Technologies Used

* **MariaDB / MySQL** – Relational Database Management System
* **SQL** – Database query language
* **phpMyAdmin** – Database management and administration tool
* **cPanel** – Original hosting environment


## ⚙️ How to Run the Database

1. Download the `library_event_management.sql` file from this repository.
2. Open **phpMyAdmin**, **MySQL Workbench**, or another **MariaDB/MySQL-compatible database management tool**.
3. Import or execute the `library_event_management.sql` file.
4. The SQL script will automatically create the `library_event_management` database if it does not already exist and select it for use.
5. All required database tables will then be created automatically, including their **primary keys, foreign key relationships, constraints, and sample data**.
6. Once the script has been executed successfully, the database is ready to use. You can run SQL queries to explore the tables, relationships, and stored data.

> **Note:** The original database was developed and managed using **MariaDB through phpMyAdmin on a cPanel hosting environment**. The provided SQL script is structured for compatibility with **MariaDB/MySQL**.

### Database Setup

No manual database or table creation is required. The SQL file contains the necessary commands to create and configure the database automatically when it is imported or executed.

---

## 🧪 Sample Data

The SQL file includes sample records that can be used to test and demonstrate the database.

After importing the SQL file, the sample data will be available automatically without requiring manual data entry.

This allows SQL queries to be executed immediately to:

* View events
* Retrieve event information
* Filter events by date or type
* Identify rooms assigned to events
* Retrieve staff or member information
* Analyse ticket costs
* Test relationships between tables

---

## 🔎 Example SQL Queries

### Display all events

```sql
SELECT * FROM Event;
```

### Display events with their names and dates

```sql
SELECT Event_Name, Event_Date
FROM Event;
```

### Find events with a ticket cost

```sql
SELECT Event_Name, Ticket_Cost
FROM Event
WHERE Ticket_Cost > 0;
```

### Find events lasting more than one hour

```sql
SELECT Event_Name, Event_Duration
FROM Event
WHERE Event_Duration > 1;
```

These queries can be modified or extended to explore the database further.



## 📸 Database Screenshots

Screenshots are included to demonstrate the implemented database and provide visual evidence of the tables, database structure, and SQL queries.


## 👩‍💻 Project Purpose

This project demonstrates practical knowledge of **relational database design and SQL implementation**, including entity modelling, primary and foreign keys, constraints, relationships, data insertion, and data retrieval.

It was developed as part of a **BSc (Hons) Computing** project to demonstrate the practical application of database concepts in a real-world library event management scenario.


## 👩‍💻 Project Developer

**Rasmiya Mohamed Yusuf**

BSc (Hons) Computing Student
