# Library Event Management Database

A relational database system developed to manage library events, bookings, members, rooms, staff, feedback, and payments using SQL and phpMyAdmin.

## 📌 Project Overview

This project provides a structured database for managing library events and related activities. It stores event information, member details, room availability, bookings, feedback, staff information, and payment records.

## ✨ Key Features

* Manage library event details and event types
* Store and manage member information
* Manage rooms, capacities, facilities, and hourly rates
* Record event bookings and booking status
* Store event feedback and ratings
* Manage event-related payments
* Maintain relationships between related database entities
* Use SQL queries to retrieve and analyse event information

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

## 🔗 Database Relationships

The database uses primary keys and foreign keys to establish relationships between related tables.

Key relationships include:

* Events are associated with event types.
* Events are assigned to rooms and staff.
* Event bookings are associated with events and members.
* Feedback is linked to events.
* Payments are linked to events and members.

## 🛠️ Technologies Used

* SQL
* MySQL / MariaDB
* phpMyAdmin


## 🎓 Project Purpose

This project was developed as part of my BSc (Hons) Computing studies to demonstrate practical understanding of relational database design, SQL, database relationships, data management, and querying.

## 👩‍💻 Project Developer

**Rasmiya Mohamed Yusuf**

BSc (Hons) Computing Student
