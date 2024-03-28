/*Create a staff table with arguments staffed, sname, salary, sdept, scategory. 
Scategory can take 2 values (teaching/ non teaching) only*/
create table staff (
    staffid int,
    sname varchar(20),
    salary int,
    sdept varchar(20),
    scategory enum('teaching', 'non teaching')
);
-- Insert the following values into staff table
insert into staff values
(2, 'John', 60000, 'CS', 'teaching'),
(11, 'Jithin', 55000, 'EC', 'teaching'),
(10, 'Jimmy', 70000, 'CS', 'teaching'),
(5, 'Anu', 20000, 'CS', 'non teaching'),
(1, 'Hentry', 60000, 'EC', 'teaching'),
(14, 'Jinu', 20000, 'EC', 'non teaching'),
(20, 'Seetha', 10000, 'ME', 'non teaching');
-- a)Create a view named ‘faculty’ for teaching staff and ‘non-faculty’ for non teaching staff
create view faculty as
select * from staff
where scategory = 'teaching';
create view non_faculty as
select * from staff
where scategory = 'non teaching';
-- b)Display the contents of ‘faculty’ & ‘non-faculty’ views
select * from faculty;
select * from non_faculty;
-- c)Update the salary of non-teaching staff whose staffed=20 to 15000 in corresponding view
update non_faculty
set salary = 15000
where staffid = 20;
-- d)Display the contents of ‘non-faculty’ view
select * from non_faculty;
-- e)Display the contents of staff table
select * from staff;
-- f)Delete details of staff whose staffid=11 from faculty view
delete from faculty
where staffid = 11;
-- g)Display the contents of ‘faculty’ view.
select * from faculty;
-- h)Create another table called ‘departmenthead’ with following details
create table departmenthead (
    department varchar(20),
    hod varchar(20),
    staffid int
);
insert into departmenthead values
('cs', 'jimmy', 10),
('ec', 'jithin', 11),
('me', 'seetha', 20);
/*i)Create an assertion that specify the constraint that the salary of a staff must not be greater than salary of the HOD in which the staff works for.
  
  MySQL doesnt supports Assertions .
  One possible workaround is to use check constraints.
  But even that wont work in this case as neither nested queries nor join operations can be used within check constraints*/
  
/*j)Create an assertion that ensure number of non-teaching staff less than number of teaching staff in a department

Same issue as above*/