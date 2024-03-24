/*Create a database for bank & create a table with name ‘savings-account’.
The fields are CID, cname, balance, date of joining*/
create database bank;
use bank;
create table savings_account(
	cid int,
    cname varchar(20),
    balance int,
    date_of_joining date
    );
-- a) Add 2 records to the ‘savings-account’ table
insert into savings_account
values
(1,'John',10000,'2021-1-1'),
(2,'Sky',20000,'2021-2-5');
-- b) Display the values of ‘savings-account’ table
select* from savings_account;
-- c) Make the changes permanently
set autocommit = 0;
commit;
-- d) Add 2 more records to the ‘savings-account’ table
insert into savings_account
values
(3,'Don',15000,'2021-7-10'),
(4,'Bob',25000,'2021-8-5');
-- e) Display all the records of ‘savings-account’ table
select* from savings_account;
-- f) Modify the balance amount by adding the interest of 6%
update savings_account
set balance = balance*1.06;
-- g) Display all the records of ‘savings-account’ table
select* from savings_account;
-- h) Abandon the last changes
rollback;
-- i) Display all the records of ‘savings-account’ table
select* from savings_account;
-- j) Add a marker to the changed state as ‘A’
savepoint A;
-- k) Add two more records to the ‘’savings-account’ table
insert into savings_account
values
(5,'Tyler',35000,'2021-9-10'),
(6,'Roy',40000,'2021-4-1');
-- l) Display all the records of ‘savings-account’ table
select* from savings_account;
-- m) Modify the balance amount by adding the interest of 6%
update savings_account
set balance = balance*1.06;
-- n) Display all the records of ‘savings-account’ table
select* from savings_account;
-- o) Add a marker to the changed state as ‘B’
savepoint B;
-- p) Delete one record from the ‘savings-account table
delete from savings_account
where cid=5;
-- q) Display all the records of ‘savings-account’ table
select* from savings_account;
-- r) Abandon the last deletion (ie, recover the table with deleted row)
rollback to B;
-- s) Display all the records of ‘savings-account’ table
select* from savings_account;
-- t) Abandon to save point/marker ‘A’
rollback to A;
-- u) Display all the records of ‘savings-account’ table
select* from savings_account;