create database college;
-- a) create two new users with name ‘student’ and ‘teacher’.
create user 'student'@'localhost' identified by 'password';
create user 'teacher'@'localhost' identified by 'password';
-- b) grant a CREATE TABLE and INSERT privileges to the teacher user and create a table named ‘advisors’.
grant create, insert on college.* to 'teacher'@'localhost';
use college;
create table advisors (
    classadvisor varchar(20),
    class varchar(10),
    studentrepname varchar(20)
);
insert into advisors
values 
('Lilly', 'S4 CS', 'Neena'),
('Asha', 'S2 EC', 'Sanal'),
('Bindhu', 'S8 CS', 'Joseph');
-- c) Grant SELECT Privilege to teacher user in ‘advisors’ table.
grant select on advisors to 'teacher'@'localhost';
-- d) Grant more than one Privilege (such as ALTER, DELETE) to teacher user and delete record corresponding to S8 CS students since they left college. add 1 more column called ‘studentscount’ in ‘advisors’ table.
grant alter, delete on college.* to 'teacher'@'localhost';
alter table advisors 
add column studentscount int;
delete from advisors 
where class = 'S8 CS';
-- e) Grant the GRANT Privilege to teacher user in ‘advisors’ table.
grant grant option on advisors to 'teacher'@'localhost';
-- f) Allows a teacher user to grant SELECT access rights to student user in ‘advisors’ table.
grant select on advisors to 'student'@'localhost' with grant option;
-- g) Grant a UPDATE privilege to all users in ‘advisors’ table and update the S4 CS & S2 EC’s students count as 40 and 45 respectively (using PUBLIC option)
grant update on advisors to 'student'@'localhost','teacher'@'localhost';
update advisors 
set studentscount = 40 
where class = 'S4 CS';
update advisors 
set studentscount = 45 
where class = 'S2 EC';
-- h) Grant a DROP privilege to all users in ‘advisors’ table (using '*'@'localhost' option)
grant drop on advisors to 'student'@'localhost','teacher'@'localhost';
-- i) Grant all the Privilege to teacher user in ‘advisors’ table.
grant all privileges on advisors to 'teacher'@'localhost';
-- j) Check the Privileges Granted to different users.
show grants for 'student'@'localhost';
show grants for 'teacher'@'localhost';
-- k) Revoke SELECT Privilege from teacher user in ‘advisors’ table.
revoke select on advisors from 'teacher'@'localhost';
-- l) Revoke more than Privilege (UPDATE, DROP, ALTER, DELETE) from teacher user in ‘advisors’ table.
revoke update, drop, alter, delete on advisors from 'teacher'@'localhost';
-- m) Revoke a SELECT privilege from all users in ‘advisors’ table.
revoke select on advisors from 'student'@'localhost','teacher'@'localhost';
-- n) Revoke All the Privilege from student user in ‘advisors’ table
revoke all privileges on advisors from 'student'@'localhost';
-- o) Revoke All the Privilege from teacher user in ‘advisors’ table
revoke all privileges on advisors from 'teacher'@'localhost';
-- p) Check the Privileges Granted to different users.
show grants for 'student'@'localhost';
show grants for 'teacher'@'localhost';
-- q) create a role called "developer".
create role developer;
-- r) grant the role to users named student and teacher.
grant developer to 'student'@'localhost', 'teacher'@'localhost';
-- s) grant CREATE TABLE, insert, select, delete, alter, drop privileges to the ROLE developer.
grant create, insert, select, delete, alter, drop on college.* to developer;
-- t) Check the Privileges Granted to a developer role
show grants for developer;
-- u) Revoke an INSERT privilege granted to developer role.
revoke insert on college.* from developer;
-- v) Revoke all the privileges granted to developer role.
revoke all privileges on college.* from developer;