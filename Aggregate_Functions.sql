create database college;
use college;
create table student (
    id int,
    name varchar(20),
    marks int,
    age int,
    dept varchar(10)
);
insert into student values
(1, 'Keerthana', 90, 19, 'CSE'),
(2, 'Albin', 50, 20, 'EC'),
(3, 'Varun', 80, 19, 'EEE'),
(4, 'Ponnu', 95, 21, 'CSE'),
(5, 'Don', 85, 18, 'EC'),
(6, 'Tharun', 85, 19, 'EC'),
(7, 'Stella', 49, 19, 'CSE'),
(8, 'Arun', 40, 20, 'EC'),
(9, 'Seena', null, 19, 'EEE'),
(10, 'Steefen', 47, 20, null);
-- a) Compute average marks & age of students
select avg(marks) as average_marks, avg(age) as average_age from student;
-- b) Compute total number of students
select count(*) as total_no_of_students from student;
-- c) Compute number of students with unique/distinct age
select count(distinct age) as distinct_age_count from student;
-- d) Compute maximum marks (as maximum_marks) & age (as maximum_age) among students from the Student table
select max(marks) as maximum_marks, max(age) as maximum_age from student;
-- e) Compute minimum marks (as minimum_marks) & age (as minimum_age) among students from the student table
select min(marks) as minimum_marks, min(age) as minimum_age from student;
-- f) Compute summation of total marks (Total Marks) among students from the Student table
select sum(marks) as total_marks from student;
-- g) Count number of non-NULL marks fields in student table
select count(marks) from student where marks is not null;
-- h) Find the maximum marks of students whose age=19
select max(marks) from student where age = 19;
-- i) Count the number of distinct age values in the table
select count(distinct age) from student;
-- j) Compute highest marks in each department
select dept, max(marks) from student where dept is not null group by dept;
-- k) List out different departments in which students are studying
select distinct dept from student;
-- l) Display name of the students who secured top marks in each department
select dept, name, marks from student where (dept, marks) in (select dept, max(marks) from student where dept is not null group by dept);
-- m) Display number of weak students (marks<50) in each department
select dept, count(*) as no_of_weak_student from student where marks < 50 and dept is not null group by dept;
-- n) Find out name of the department and the number of students who secured more than 80 marks for department ranking, only departments with more than 2 students are eligible for ranking
select dept, count(*) as student_count from student where marks > 80 and dept in (select dept from student where dept is not null group by dept having count(*) > 2) group by dept order by student_count desc;
-- o) For each department, retrieve the department name, and average marks of students in that department
select dept, avg(marks) as average_marks from student where dept is not null group by dept;
-- p) Lists the number of students in each department. Only include department with more than 1 students.
select dept, count(*) as student_count from student where dept is not null group by dept having count(*) > 1 order by student_count desc;
-- q) Find out the students with the same name
select name, count(*) as name_count from student group by name;
-- r) Find number of students with the same age
select age, count(*) as age_count from student group by age;
