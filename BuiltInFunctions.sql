create database library;
use library;
create table authors (
    aid varchar(4),
    aname varchar(20),
    adob date
);
create table books (
    bid int,
    title varchar(20),
    aid varchar(4),
    pyear year,
    bprize float
);
insert into books
values
(1, 'Pride and prejudice', 'A1', 1987, 100),
(6, 'Alice in wonderland', 'A4', 1960, 150.50),
(3, 'Treasure Island', 'A3', 1988, 250),
(2, 'Maha Kavitha', 'A10', 2024, 300.25),
(4, 'Half Girl Friend', 'A2', 2024, 267.75),
(5, 'How to save a life', 'A5', 2023, 200),
(7, 'How to save a life', 'A6', 2023, 200);
insert into authors
values
('A1', 'jane austin', '1948-03-10'),
('A4', 'lewis carrol', '1940-04-09'),
('A3', 'robert louis', '1948-06-15'),
('A10', 'vairamuthu', '1940-06-04'),
('A2', 'chetan bhagat', '1942-08-16'),
('A5', 'fenton', '1995-08-04'),
('A6', 'liz', '1990-05-07');
update books
set title = trim(title)
where title = 'Alice in wonderland';
select distinct upper(aname)
from authors;
select title,length(title)
from books;
select concat(title," written by ",aname)
from books
natural join authors;
select title,group_concat(aname)
from books
natural join authors
group by title;
select position("Girl" in title)
from books
where title = "Half Girl Friend";
update books
set title = replace(title,"Kavitha","Krithi")
where title = "Maha Kavitha";
select substring_index(aname,' ',1)
from authors
where aid = 'A1';
update authors
natural join books
set aid = concat(substring(aid,1,1),"_",substring(aid,2));
select* from books;
update books
set bprize = round(bprize);
select pow(bprize,10)
from books
where bid = 'B6';
select mod((select bprize from books where bid = 'B5'), (select bprize from books where bid = 'B1')) as remainder;
select sqrt(4);
select title,ascii(title)
from books;
select now();
select current_date();
select current_time();
select aname,aid,day(adob) as birthday,month(adob) as birthmonth,year(adob) as birthyear
from authors
where aid = 'A_4';
select datediff((select adob from authors where aname = "jane austin" ),(select adob from authors where aname = "robert louis")) as date_difference;
select count(*) as no_of_books_published
from books
where pyear = year(current_date);





