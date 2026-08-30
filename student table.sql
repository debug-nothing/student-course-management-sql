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

select student_name from students
where Gender="Female";

select student_name,student_Id from students
where age > 22;

select student_name from students
where City="Delhi" OR City="Pune";
*/
/*
select * from students
where city Not IN ("Mumbai");

select * from students
where city != "Mumbai";

select * from students
order by age;

select * from students
order by age DESC;

select * from courses 
order by fees Desc;

select Distinct city from students;

select * from students 
order by student_id 
limit 5;
*/
/*
select * from students
where Student_name Like 'A%' ;

select * from students
where Student_name Like '%a';

select * from students
where Student_name Like '%it%';

select * from students
where age between 21 and 23;

select * from students
where city in("Mumbai","Delhi");
*/
/*
select count(student_name) from students;

select max(fees) from courses;

select min(fees) from courses;

select avg(age) from students;

select sum(fees) from courses;
*/
/*
select city, count(student_name) as No_of_students
from students
group by city;

select course_Id, count(student_id) as no_of_student_by_courses
from enrollments
group by course_id;

select city, count(student_id) as total_student
from students
group by city
Having count(student_id) > 1;

select course_id, count(Enrollment_id) as total_Enrollment
from Enrollments
group by course_id
having count(enrollment_id) > 1;
*/
/*
select s.student_name,c.course_name
From students as s Inner join Enrollments as e 
on s.student_ID=e.student_ID
inner join courses as c
on c.course_id=e.course_id;

select s.student_name,c.course_name
from students as s left outer join enrollments as e
on s.student_id=e.student_id
left outer join courses as c
on c.course_id=e.course_id;

select c.Course_Name,c.Course_ID,e.enrollment_id,e.student_ID
from Courses as c left outer join enrollments as e 
on c.course_ID=e.Course_ID
right outer join students as s 
on s.student_id=e.student_id;

SELECT c.Course_Name,
       c.Course_ID,
       e.Enrollment_ID,
       e.Student_ID
FROM Courses AS c
LEFT JOIN Enrollments AS e
    ON c.Course_ID = e.Course_ID;

-- 44. Display Student Name as Name and City as Location.
SELECT
    Student_Name AS Name,
    City AS Location
FROM Students;

-- 45. Display names of students enrolled in the SQL course.
SELECT Student_Name
FROM Students
WHERE Student_ID IN
(
    SELECT Student_ID
    FROM Enrollments
    WHERE Course_ID =
    (
        SELECT Course_ID
        FROM Courses
        WHERE Course_Name = 'SQL'
    )
);

-- 46. Students enrolled in the course with the highest fee.
SELECT Student_Name
FROM Students
WHERE Student_ID IN
(
    SELECT Student_ID
    FROM Enrollments
    WHERE Course_ID =
    (
        SELECT Course_ID
        FROM Courses
        WHERE Fees =
        (
            SELECT MAX(Fees)
            FROM Courses
        )
    )
);

-- 47. Categorize students as Senior and Junior.
SELECT
    Student_Name,
    Age,
    CASE
        WHEN Age >= 23 THEN 'Senior'
        ELSE 'Junior'
    END AS Student_Category
FROM Students;

-- 48. Display Enrollment Year of each student.
SELECT
    s.Student_Name,
    e.Enrollment_Date,
    YEAR(e.Enrollment_Date) AS Enrollment_Year
FROM Students s
INNER JOIN Enrollments e
ON s.Student_ID = e.Student_ID;

-- 49. Students enrolled during March.
SELECT
    s.Student_Name,
    e.Enrollment_Date
FROM Students s
INNER JOIN Enrollments e
ON s.Student_ID = e.Student_ID
WHERE MONTH(e.Enrollment_Date) = 3;

-- 50. Which city has the highest number of students?
SELECT
    City,
    COUNT(Student_ID) AS Total_Students
FROM Students
GROUP BY City
ORDER BY Total_Students DESC
LIMIT 1;

-- 51. Which course has the highest fee?
SELECT
    Course_Name,
    Fees
FROM Courses
ORDER BY Fees DESC
LIMIT 1;

-- 52. Which course has maximum enrollments?
SELECT
    c.Course_Name,
    COUNT(e.Student_ID) AS Total_Enrollments
FROM Courses c
INNER JOIN Enrollments e
ON c.Course_ID = e.Course_ID
GROUP BY c.Course_Name
ORDER BY Total_Enrollments DESC
LIMIT 1;

-- 53. Students enrolled in more than one course.
SELECT
    s.Student_Name,
    COUNT(e.Course_ID) AS Total_Courses
FROM Students s
INNER JOIN Enrollments e
ON s.Student_ID = e.Student_ID
GROUP BY s.Student_Name
HAVING COUNT(e.Course_ID) > 1;

-- 54. Average age of students in each city.
SELECT
    City,
    AVG(Age) AS Average_Age
FROM Students
GROUP BY City
SELECT
    City,
    AVG(Age) AS Average_Age
FROM Students
GROUP BY City; 

-- 55. Which city has the youngest average age?
SELECT
    City,
    AVG(Age) AS Average_Age
FROM Students
GROUP BY City
ORDER BY Average_Age ASC
LIMIT 1;

-- 56. Students who have NOT enrolled in any course.
SELECT
    s.Student_Name
FROM Students s
LEFT JOIN Enrollments e
ON s.Student_ID = e.Student_ID
WHERE e.Student_ID IS NULL;

-- 57. Courses with NO students.
SELECT
    c.Course_Name
FROM Courses c
LEFT JOIN Enrollments e
ON c.Course_ID = e.Course_ID
WHERE e.Course_ID IS NULL;

-- 58. Top 3 oldest students.
SELECT
    Student_Name,
    Age
FROM Students
ORDER BY Age DESC
LIMIT 3;

-- 59. Three most expensive courses.
SELECT
    Course_Name,
    Fees
FROM Courses
ORDER BY Fees DESC
LIMIT 3; 

-- SECTION I — FINAL PORTFOLIO REPORT (Query 60)
SELECT
    s.Student_ID,
    s.Student_Name,
    s.Gender,
    s.Age,
    s.City,
    c.Course_Name,
    c.Fees AS Course_Fees,
    e.Enrollment_Date
FROM Students s
LEFT JOIN Enrollments e
ON s.Student_ID = e.Student_ID
LEFT JOIN Courses c
ON e.Course_ID = c.Course_ID
ORDER BY s.Student_ID; 
*/
