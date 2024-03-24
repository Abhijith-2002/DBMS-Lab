create database family;
use family;
create table members(
	mno int,
    mname varchar(20),
    mage int,
    role varchar(20),
    gender varchar(10)
    );
-- a) Insert following values into ‘members’ table.
insert into members
values
(1, 'Joseph', 60, 'Father', 'Male'),
(2, 'Mary', 55, 'Mother', 'Female'),
(3, 'Lilly', 16, 'Daughter', 'Female'),
(4, 'Cleetus', 15, 'Son', 'Male'),
(5, 'Kevin', 20, 'Son', 'Male'),
(6, 'Nevin', 20, 'Son', 'Male');
-- b) Returns all the gender entries from the ‘members’ table
select gender from members;
-- c) Retrieve unique values for gender
select distinct gender from members;
-- d) Returns all member’s name, age, role from ‘members’ table
select mname,mage,role from members;
-- e) Select any one child who is eligible for voting
select mname,mage from members
where role in ('Son','Daughter')
having mage>18
limit 1;
-- f) Find out the total no. of males and females in the given family
select gender,count(gender) as total
from members
group by gender;
-- g) Select all the eligible candidate’s details for voting in the given family
select* from members
where mage>18;
-- h) Arrange members of the family in increasing order of age
select* from members
order by mage;
-- i) Arrange members of the family in decreasing order of age
select* from members
order by mage
desc;
-- j) Identify twins in the family and display their details
select* from members m1
join members m2
on m1.mage = m2.mage
and m1.role = m2.role
and m1.mno <> m2.mno;