create database office;
use office;
-- Create 2 tables employee and department with the corresponding field and constraints given below
create table department(
    dno varchar(5) primary key not null,
    dname varchar(20) not null,
    cnt_emp int,
    dept_hod varchar(20),
    check(cnt_emp<=15)
);
create table employee(
    eno varchar(5) primary key not null,
    ename varchar(20) not null,
    salary int,
    dno varchar(5),
    foreign key(dno) references department(dno),
    doj date,
    mngrno varchar(5),
    job varchar(20),
    address varchar(50),
    city varchar(20),
    pincode int,
    check(salary>0),
    check(city in ('Cochin', 'Bombay', 'Madrass', 'Delhi'))
);
-- a) Insert values into employee and department tables
insert into department
values
('D10','Sales',2,'Sreela'),
('D20','Agriculture',1,'Vinod'),
('D15','Finance',1,'Sreeni'),
('D30','Commerce',1,'Greena');
insert into employee
values
('E1','Lini',40000,'D10','1990-01-01','12','Sales','Vytila','Cochin',48622),
('E20','Anu',50000,'D20','1998-09-30','33','Commerce','Kollam','Bombay',665356),
('E15','Giri',60000,'D30','1999-09-01','12','Sales','Kerala','Delhi',62235),
('E16','Lulu',50000,'D15','1997-09-01',NULL,'Agriculture','Kerala','Madrass',64633),
('E12','Sini',40000,'D10','1998-01-01','22','Finance','Alappuzha','Delhi',241156);
-- b) Display all the employee details & department details
select* from employee;
select* from department;
-- c) update the 'city' and 'salary' of emplyee whose Eid=E12 to 'cochin' and '70000'
update employee
set city = 'Cochin', salary = 70000
where eno = 'E12';
-- d) Display all the employee details & department details
select* from employee;
select* from department;
-- e) List the name of employees joined after 1-1-1998 and working in department number d10
select ename from employee
where doj>'1998-1-1' and
dno = 'D10';
-- f) List all employees working in department other than department number d30
select ename from employee
where dno <> 'D30';
-- g) List the name of employees working in department 'sales'
select ename from employee
where job = 'Sales';
-- h) List the name of employee who does not have a manager
select ename from employee
where mngrno is null;
-- i) Display employees details whose city=’cochin’
select* from employee
where city = 'Cochin';
-- j) List the HOD’s of different department
select dname,dept_hod from department;
-- k) Find out who is the HOD of department D20
select dno,dname,dept_hod from department
where dno = 'D20';
-- l) Delete employee whose Eid=E15 from employee table
delete from employee
where eno = 'E15';
-- m) Display details of employee table
select* from employee;
-- n) Delete employees whose city=’Delhi’
delete from employee
where city = 'Delhi';
-- o) Display details of employee table
select* from employee;
-- p) Delete all the employees from employee table
truncate employee;
-- q) Display details of employee table
select* from employee;