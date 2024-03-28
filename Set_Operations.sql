create database library;
use library;
create table books(
    id int,
    title varchar(20),
    price int,
    status varchar(20)
);
create table movies(
    id int,
    title varchar(20),
    price int,
    status varchar(20)
);
insert into books values
(1, 'The witcher', 100, 'available'),
(2, 'Harry potter', 200, 'available'),
(3, 'Nineteen eighty four', 200, 'available'),
(4, 'The witcher', 100, 'available');
insert into movies values
(1, 'Iron man', 100, 'Not available'),
(2, 'Harry potter', 200, 'available');
-- a) Returns all distinct rows from 2 tables. (UNION)
select * from books
union
select * from movies;
-- b) Returns all rows from 2 tables. (UNION ALL)
select * from books
union all
select * from movies;
-- c) Returns all distinct rows common to both tables (INTERSECT)
select * from books
intersect
select * from movies;
-- d) Returns all rows common to both tables (INTERSECT ALL)
select * from books
intersect all
select * from movies;
-- e) Returns all distinct rows from ‘books’ table that is not in ‘movies’ table.(EXCEPT)
select * from books
except
select * from movies;
-- f) Returns all rows from ‘books’ table that is not in ‘movies’ table. (EXCEPT ALL)
select * from books
except all
select * from movies;
