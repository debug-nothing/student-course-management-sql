-- Create database Student_Management;
use Student_Management;
/*
CREATE TABLE Students
(
    Student_ID INT AUTO_INCREMENT PRIMARY KEY,
    Student_Name VARCHAR(100) NOT NULL,
    Gender ENUM('Male','Female') NOT NULL,
    Age INT NOT NULL,
    City VARCHAR(50) NOT NULL
);
*/
/*
CREATE TABLE Courses
(
    Course_ID INT AUTO_INCREMENT PRIMARY KEY,
    Course_Name VARCHAR(100) NOT NULL,
    Fees DECIMAL(10,2) NOT NULL
);
*/
/*
CREATE TABLE Enrollments
(
    Enrollment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Student_ID INT NOT NULL,
    Course_ID INT NOT NULL,
    Enrollment_Date DATE NOT NULL,

    FOREIGN KEY (Student_ID)
        REFERENCES Students(Student_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (Course_ID)
        REFERENCES Courses(Course_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
*/
/*
select * from Students, Courses, Enrollments;
show databases;
show tables;
*/
/*
describe Students;
describe Courses;
describe enrollments;
*/
/*
INSERT INTO Students (Student_Name, Gender, Age, City)
VALUES
('Rahul Sharma', 'Male', 22, 'Mumbai'),
('Priya Singh', 'Female', 21, 'Delhi'),
('Amit Patel', 'Male', 24, 'Ahmedabad'),
('Sneha Joshi', 'Female', 23, 'Pune'),
('Rohit Verma', 'Male', 20, 'Delhi'),
('Anjali Gupta', 'Female', 22, 'Mumbai'),
('Karan Mehta', 'Male', 23, 'Hyderabad'),
('Neha Kapoor', 'Female', 21, 'Chennai'),
('Vikas Yadav', 'Male', 25, 'Lucknow'),
('Pooja Nair', 'Female', 22, 'Kochi'),
('Arjun Reddy', 'Male', 24, 'Hyderabad'),
('Meera Shah', 'Female', 20, 'Ahmedabad'),
('Sahil Khan', 'Male', 23, 'Bangalore'),
('Riya Das', 'Female', 21, 'Kolkata'),
('Manish Kumar', 'Male', 22, 'Patna'),
('Aisha Ali', 'Female', 24, 'Delhi'),
('Nitin Pawar', 'Male', 21, 'Pune'),
('Kavya Iyer', 'Female', 23, 'Chennai'),
('Deepak Mishra', 'Male', 22, 'Mumbai'),
('Simran Kaur', 'Female', 25, 'Amritsar');
*/
/*
INSERT INTO Courses (Course_Name, Fees)
VALUES
('SQL', 5000),
('Python', 7000),
('Power BI', 6500),
('Excel', 4000),
('Tableau', 8500),
('Data Analytics', 12000),
('Machine Learning', 18000),
('Statistics', 6000),
('Java', 7500),
('Web Development', 10000),
('Cloud Computing', 15000),
('Artificial Intelligence', 20000);
*/
/*
INSERT INTO Enrollments (Student_ID, Course_ID, Enrollment_Date)
VALUES
(1, 1, '2026-03-10'),
(2, 2, '2026-03-12'),
(3, 3, '2026-04-01'),
(4, 5, '2026-03-18'),
(5, 4, '2026-05-06'),
(6, 6, '2026-02-28'),
(7, 5, '2026-03-25'),
(8, 8, '2026-04-15'),
(9, 7, '2026-05-20'),
(10, 10, '2026-03-30');

select * from Students,Courses,Enrollments;

update Students
set city="Banglore"
where Student_Name="Priya";

update Courses
set Fees=Fees+500
where Course_Name="Sql";

update Students
set Age=24
where Student_Name="Rahul";

Delete From Students
where Student_Name="Rohit"

Delete from Courses
where Course_Name="Tableau"

select student_ID
from Students
where student_Name="Rohit";

select Course_Name
from Courses
where Course_Name="Tableau";

select Student_ID
from Enrollments
where Course_ID = Student_ID;
*//*
select Student_Name, City from Students;

Select Student_Name, City from Students
where City="Mumbai";
*/
