create database school;
use school;
create table student (
    rollno varchar(4),
    name varchar(15),
    address varchar(15),
    phone numeric(10),
    age numeric(3)
);
insert into student values
('1', 'Ram', 'Delhi', 9961253564, 18),
('2', 'Ramesh', 'Gurgaon', 9962363564, 18),
('3', 'Sujit', 'Rohtak', 9961253222, 20),
('4', 'Suresh', 'Delhi', 9961663564, 18);
create table studentcourse (
    courseid int,
    rollno int
);
insert into studentcourse values
(1,1),
(2,2),
(2,3),
(3,4);
-- a) Display all the values of student table.
select * from student;
-- b) Display all the values of studentcourse table.
select * from studentcourse;
-- c) Select NAME and Age from Student table and COURSEID from StudentCourse table. (cross join)
select s.name, s.age, sc.courseid
from student s
cross join studentcourse sc;
-- d) Each row of the student table is joined with itself and all other rows depending on some conditions (eg: a.ROLL_NO < b.ROLL_NO). (self join)
select a.rollno, b.name
from student a
join student b
on a.rollno < b.rollno;
-- e) Show the names and age of students enrolled in different courses. (equi join)
select s.name, s.age, sc.courseid
from student s
join studentcourse sc
where s.rollno = sc.rollno;
-- f) Perform natural join on ‘student’ and ‘studentcourse’ table.
select * from student
natural join studentcourse;
-- g) Perform left join on ‘student’ and ‘studentcourse’ table.
select student.*, studentcourse.courseid
from student 
left join studentcourse 
on student.rollno = studentcourse.rollno;
-- h) Perform right join on ‘student’ and ‘studentcourse’ table.
select student.*, studentcourse.courseid
from student 
right join studentcourse 
on student.rollno = studentcourse.rollno;
-- i) Perform full outer join on ‘student’ and ‘studentcourse’ table.
select * from student
left join studentcourse
on student.rollno = studentcourse.rollno
union
select * from student
right join studentcourse
on student.rollno = studentcourse.rollno;
