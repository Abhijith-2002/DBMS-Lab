-- a) Create a database for the college
create database college;
use college;
-- b) Create 2 tables ,student and staff tables with following fields respectively
create table staff(
	eid int(5),
    name varchar(15),
    age int(5),
    branch varchar(10),
    designation varchar(20)
    );
create table student(
	rollno int(3),
    name varchar(20),
    age int(5),
    branch varchar(10),
    semester int(10)
    );
-- c) List out the tables present in the college database
show tables;
-- d) Show the structure of student table, staff table
desc student;
desc staff;
-- e) Insert values into student table and staff table (at least 3 rows)
insert into student
values
(1,"John",18,"CS",4),
(2,"Roy",18,"CU",4),
(3,"Sky",19,"ECE",4);
insert into staff
values
(1,"Taylor",30,"CS","HOD"),
(2,"Skyler",33,"CU","Lecturer"),
(3,"Don",41,"ECE","Staff Advisor");
/*Alter the student table by adding a column called 'contact number'(int fileld) and insert values 
    into the added filed.
    • by droping a coloumn named 'contact number'
    • modify the existing column named 'semester' 
			# by modidying its data type from 'int' to 'varchar'
			# by modifying the width of the column from 10 to 5
			# modifying the constraint of 'semester' colomn from NULL to NOT NULL*/
alter table student
add contact_number int(10);
update student
set contact_number = 95738342
where rollno = 1;
update student
set contact_number = 96473125
where rollno = 2;
update student
set contact_number = 94678395
where rollno = 3;
alter table student
drop column contact_number;
alter table student
modify column semester varchar(5) not null;
-- g) Retrieve all data present in student table
select* from student;
-- h) Rename student table as 'student details' and  staff table as 'staff details'
rename table student to student_details;
rename table staff to staff_details;
-- i) Delete all data present in the student table and staff table
truncate table student_details;
truncate table staff_details;
-- j) Drop student table as well as staff table
drop table student_details;
drop table staff_details;
-- k) Drop college database
drop database college;