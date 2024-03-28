/*Create 3 tables student (SID,sname,sage), course (CID,Cname) and student-course (SID,CID)*/
create database college;
use college;
create table student(
    sid int,
    sname varchar(20),
    sage int
);
create table course(
    cid int,
    cname varchar(20)
);
create table student_course(
    sid int,
    cid int
);
insert into student values
(1, 'Alice', 20),
(2, 'Bob', 22),
(3, 'Charlie', 21),
(4, 'David', 23),
(5, 'Eve', 19);
insert into course values
(1, 'DSA'),
(2, 'DBMS'),
(3, 'OOP');
insert into student_course values
(1, 1),
(1, 2),
(2, 1),
(3, 3),
(4, 2),
(5, 3);
-- a) Display details of all the 3 tables
select * from student;
select * from course;
select * from student_course;
-- b) Find out student ID (SID) who are enrolled in course name ‘DSA’ or ‘DBMS’
select distinct sid
from student_course
where cid in(
    select cid from course
    where cname in ('DSA','DBMS')
);
-- c) Find out names of students who are either enrolled in ‘DSA’ or ‘DBMS’
select sname
from student
where sid in(
    select distinct sid
    from student_course
    where cid in(
        select cid from course
        where cname in ('DSA','DBMS')
    )
);
-- d) Find out the names of students who are neither enrolled in ‘DSA’ nor in ‘DBMS’
select sname
from student
where sid not in(
    select distinct sid
    from student_course
    where cid in(
        select cid from course
        where cname in ('DSA','DBMS')
    )
);
-- e) Find out the names of students who are enrolled in course ID ‘C1’
select sname
from student
where sid in(
    select sid
    from student_course
    where cid = 1
);
