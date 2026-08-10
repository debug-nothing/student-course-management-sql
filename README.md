# student-course-management-sql
SQL Portfolio Project based on Student Course Management System using MySQL.

# Student Course Management System using MySQL

A beginner-friendly **MySQL portfolio project** for managing students, courses, and course enrollments.

## 📌 Project Overview

This project is a **Student Course Management System** built using MySQL.

The purpose of the project is to store and manage:

* Student information
* Available courses
* Student enrollments
* Course fees
* Enrollment dates

The project was created as a practical SQL exercise to understand how relational databases work and how SQL can be used to perform CRUD operations, retrieve information, and generate useful reports.

The original project scenario involves a coaching institute that manages student and course information and wants to replace manual spreadsheet-based management with a relational database.

---

## 🎯 Project Objectives

The main objectives of this project are:

* Design a relational database using MySQL
* Create tables with Primary Keys and Foreign Keys
* Insert and manage records
* Perform CRUD operations
* Retrieve data using SQL queries
* Filter and sort records
* Use aggregate functions
* Group and filter grouped data
* Combine data from multiple tables using JOINs
* Practice subqueries
* Use CASE statements
* Work with date functions
* Generate meaningful business reports

These objectives are based on the requirements given in the project assignment.

---

# 🗄️ Database Structure

The database is named:

```sql
Student_Management
```

The project contains three main tables:

```text
Student_Management
│
├── Students
│
├── Courses
│
└── Enrollments
```

### Relationship

```text
Students
   │
   │ Student_ID
   ▼
Enrollments
   ▲
   │ Course_ID
   │
Courses
```

The `Enrollments` table connects students with the courses they have enrolled in.

---

# 📋 Tables

## 1. Students

Stores information about students.

| Column       | Data Type    | Description    |
| ------------ | ------------ | -------------- |
| Student_ID   | INT          | Primary Key    |
| Student_Name | VARCHAR(100) | Student's name |
| Gender       | ENUM         | Male/Female    |
| Age          | INT          | Student's age  |
| City         | VARCHAR(50)  | Student's city |

### Primary Key

```sql
Student_ID
```

---

## 2. Courses

Stores information about available courses.

| Column      | Data Type     | Description    |
| ----------- | ------------- | -------------- |
| Course_ID   | INT           | Primary Key    |
| Course_Name | VARCHAR(100)  | Name of course |
| Fees        | DECIMAL(10,2) | Course fee     |

### Primary Key

```sql
Course_ID
```

---

## 3. Enrollments

Stores information about which student enrolled in which course.

| Column          | Data Type | Description     |
| --------------- | --------- | --------------- |
| Enrollment_ID   | INT       | Primary Key     |
| Student_ID      | INT       | Foreign Key     |
| Course_ID       | INT       | Foreign Key     |
| Enrollment_Date | DATE      | Enrollment date |

### Foreign Keys

```sql
Student_ID → Students(Student_ID)

Course_ID → Courses(Course_ID)
```

The project requires Primary Keys and Foreign Keys to establish relationships between the tables.

---

# 🔐 Referential Integrity

The `Enrollments` table uses foreign keys with:

```sql
ON DELETE CASCADE
ON UPDATE CASCADE
```

For example:

```sql
FOREIGN KEY (Student_ID)
REFERENCES Students(Student_ID)
ON DELETE CASCADE
ON UPDATE CASCADE
```

### ON DELETE CASCADE

If a student is deleted from the `Students` table, the related enrollment records are automatically deleted.

### ON UPDATE CASCADE

If a referenced `Student_ID` is updated, the corresponding foreign key value in `Enrollments` is automatically updated.

The same relationship is applied between `Courses` and `Enrollments`.

---

# 📊 Sample Data

The database contains:

* **20 students**
* **12 courses**
* **10 enrollments**

The sample data contains different:

* Student names
* Genders
* Ages
* Cities
* Course names
* Course fees
* Enrollment dates

This allows different SQL queries and analytical operations to be practiced.

---

# 🛠️ CRUD Operations

The project includes practical CRUD operations.

### CREATE

Adding a new student:

```sql
INSERT INTO Students
(Student_Name, Gender, Age, City)
VALUES
('Karan', 'Male', 21, 'Hyderabad');
```

Adding a new course:

```sql
INSERT INTO Courses
(Course_Name, Fees)
VALUES
('Tableau', 8500);
```

### READ

Retrieving records:

```sql
SELECT *
FROM Students;
```

### UPDATE

Updating student information:

```sql
UPDATE Students
SET Age = 24
WHERE Student_Name = 'Rahul';
```

### DELETE

Deleting records:

```sql
DELETE FROM Students
WHERE Student_Name = 'Rohit';
```

The assignment specifically requires adding Karan, adding Tableau, updating Priya/Rahul and SQL course information, and deleting Rohit and Tableau.

---

# 🔎 SQL Concepts Practiced

This project covers the following SQL concepts:

### Basic SQL

* `SELECT`
* `WHERE`
* `INSERT`
* `UPDATE`
* `DELETE`

### Filtering

* `AND`
* `OR`
* `NOT`
* `IN`
* `BETWEEN`
* `LIKE`

### Sorting and Limiting

* `ORDER BY`
* `ASC`
* `DESC`
* `LIMIT`

### Removing Duplicates

* `DISTINCT`

### Aggregate Functions

* `COUNT()`
* `MAX()`
* `MIN()`
* `AVG()`
* `SUM()`

### Grouping

* `GROUP BY`
* `HAVING`

### Joins

* `INNER JOIN`
* `LEFT JOIN`

### Other SQL Concepts

* Column aliases using `AS`
* Subqueries
* `CASE`
* Date functions

The assignment specifically includes these SQL topics as part of its query practice and analytical questions.

---

# 🔗 JOIN Examples

### INNER JOIN

Used to display students along with the courses they have enrolled in.

```sql
SELECT s.Student_Name, c.Course_Name
FROM Students AS s
INNER JOIN Enrollments AS e
    ON s.Student_ID = e.Student_ID
INNER JOIN Courses AS c
    ON c.Course_ID = e.Course_ID;
```

### LEFT JOIN

Used to display all students, including students who have not enrolled in any course.

```sql
SELECT s.Student_Name, c.Course_Name
FROM Students AS s
LEFT JOIN Enrollments AS e
    ON s.Student_ID = e.Student_ID
LEFT JOIN Courses AS c
    ON c.Course_ID = e.Course_ID;
```

### Courses with No Enrollments

```sql
SELECT c.Course_Name,
       c.Course_ID,
       e.Enrollment_ID,
       e.Student_ID
FROM Courses AS c
LEFT JOIN Enrollments AS e
    ON c.Course_ID = e.Course_ID;
```

---

# 📈 Business Questions

The project also focuses on answering practical business questions, such as:

* Which city has the highest number of students?
* Which course has the highest fee?
* Which course has the maximum enrollments?
* Which students are enrolled in more than one course?
* What is the average age of students in each city?
* Which city has the youngest average age?
* Which students have not enrolled in any course?
* Which courses currently have no students?
* Who are the three oldest students?
* What are the three most expensive courses?

These questions are part of the analytical section of the project.

---

# 📁 Project Files

A suggested GitHub structure for this project is:

```text
Student-Course-Management-MySQL/
│
├── README.md
│
├── 01_Create_Database.sql
├── 02_Create_Tables.sql
├── 03_Insert_Students.sql
├── 04_Insert_Courses.sql
├── 05_Insert_Enrollments.sql
├── 06_CRUD_Operations.sql
├── 07_Select_Queries.sql
├── 08_Group_By_Having.sql
├── 09_Joins.sql
├── 10_Subqueries.sql
├── 11_Case_Statement.sql
├── 12_Date_Functions.sql
│
└── screenshots/
```

> If your actual GitHub files have different names, keep your existing filenames. The structure above is only a recommended organization.

---

# ▶️ How to Run the Project

### 1. Open MySQL

You can use:

* MySQL Workbench
* MySQL Command Line
* Another MySQL-compatible SQL environment

### 2. Create the database

```sql
CREATE DATABASE Student_Management;
```

### 3. Select the database

```sql
USE Student_Management;
```

### 4. Create the tables

Run the table creation queries in this order:

```text
Students
   ↓
Courses
   ↓
Enrollments
```

The `Enrollments` table should be created after `Students` and `Courses` because it contains foreign keys referencing those tables.

### 5. Insert sample data

Insert:

```text
20 Students
12 Courses
10 Enrollments
```

### 6. Run the SQL practice queries

Execute the CRUD, SELECT, GROUP BY, HAVING, JOIN, and later analytical queries.

---

# 🧠 Learning Outcomes

After completing this project, I practiced how to:

* Design a relational database
* Create tables
* Define Primary Keys
* Define Foreign Keys
* Maintain relationships between tables
* Insert records
* Update existing records
* Delete records
* Filter data
* Sort data
* Find unique values
* Use pattern matching
* Perform calculations using aggregate functions
* Group data
* Filter grouped data
* Combine information from multiple tables using JOINs
* Build SQL queries for business questions

---

# 🚀 Project Status

### Completed

* [x] Database creation
* [x] Table creation
* [x] Primary Keys
* [x] Foreign Keys
* [x] Sample data insertion
* [x] CRUD operations
* [x] Basic SELECT queries
* [x] Filtering
* [x] Sorting
* [x] DISTINCT
* [x] LIMIT
* [x] LIKE
* [x] BETWEEN
* [x] IN
* [x] Aggregate functions
* [x] GROUP BY
* [x] HAVING
* [x] Basic JOIN practice

### In Progress

* [ ] Aliases
* [ ] Subqueries
* [ ] CASE statements
* [ ] Date functions
* [ ] Bonus analytical questions
* [ ] Complete student report

---

# 📌 Source Project Requirements

This project follows the **Student Course Management System using MySQL** portfolio project requirements, which include database creation, CRUD operations, SQL query practice, joins, subqueries, CASE statements, date functions, and analytical questions.

---

# 👨‍💻 Author

**Abdurrahman**

Student Course Management System
MySQL Portfolio Project

---

## ⭐ Skills Demonstrated

`MySQL` `SQL` `Database Design` `CRUD` `Joins` `Aggregate Functions` `GROUP BY` `HAVING` `Data Analysis`
