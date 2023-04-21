-- CRUD Operation (Create, Read,  Update, Delete);
-- simple insert, multiple insert, Datatype mismatch, NULL and NOT NULL, Default value define
-- ------------------------------------------------------------------------------------------- --
show databases;
create database SqlTutorial;
use SqlTutorial;
show databases;
use sqltutorial;
show tables;
create table employee ( firstname varchar(30),
 middlename varchar(30), lastname varchar(30), age int, salary int, location varchar(30));
show tables;
desc employee;

select * from employee;

insert into employee values ('kapil', 'kumar', 'sharma', 23, 10000, 'bangalore');
select * from employee;

insert into employee (firstname, middlename, lastname, age, salary, location) values ('Rahul', 'shivkumar', 'sharma', 23, 10000, 'bangalore');

select * from employee;

insert into employee (firstname, middlename, lastname, age, salary, location) values ('Rahul', 'shivkumar', 'sharma', 23, 10000, 'bangalore');

insert into employee (firstname, middlename, lastname, age, salary, location) 
values ('Ganesh', 'Ram', 'pathak', 24 , 20000, 'Pune'), ('Brahmesh', 'pandurang', 'Lahamge', 22, 25000, 'pune');
select * from employee;

insert into employee (firstname, middlename, lastname, age, salary, location) 
values ('Ram', 'Dashrath', 'pathak', 24.56 , 20000, 'Pune');
select * from employee;

insert into employee (firstname, lastname, age, salary, location) 
values ('Ram', 'pathak', 24.56 , 2000.70, 'Pune');
select * from employee;
desc employee;
Drop table employee;
show tables;

-- --------------------------------------- --
-- Primary key, Unique key, Auto Increment --
-- --------------------------------------- --

create table employee(
id int primary key,
firstname varchar(20) not null,
middlename varchar(20) ,
lastname varchar(20) not null,
age int not null,
salary int not null,
location varchar(20) not null default 'bangalore'
);
insert into employee(id, firstname, middlename, lastname, age, salary, location) 
values (1, 'rajesh', 'kapil', 'pathak', 20, 1000.345, 'Pune'),
(2, 'Asim', 'kapil', 'pathak', 23, 1000, default),
(3, 'Arijit', 'kapil', 'Awasti', 24, 1000.345, 'Pune');
SELECT 
    *
FROM
    employee;

-- Select statement:
-- selsct * from employee = selsct all coloums
-- select col1, col2, col3 from employee = selection of specific coloumns
-- ---------------------------------------------------------------------- --
select firstname, age from employee;

-- Apply condition on coloums ( using where clause filter)
-- ------------------------------------------------------- --
select * from employee where age >23;

select * from employee where firstname ='rajesh';

-- select case sensitive data
-- -------------------------- --
select * from employee where binary firstname = 'Arijit';

-- select firstname and lastname as Name and Lastname (Alias):
-- ----------------------------------------------------------- --
select firstname as Name, lastname as Surname from employee;

-- Update
-- Update lastname of Rajesh as Khade
-- ---------------------------------- --
select * from employee;
update employee set lastname = "Khade" where firstname = "rajesh";
select * from employee;
-- update location of Asim from bangalore to pune 
update employee set location = "Pune" where firstname = "Asim";
select * from employee;

-- Increase salary of each employee by 5000
update employee set salary = salary + 5000;
select * from employee;

-- Update using "and" condition
-- lets update location of arijit awasti to bangalor
update employee set location = 'bangalor' where firstname = 'arijit' and lastname='awasti';
select * from employee;

-- Delete 
-- Delete empolyee record id 2
delete from employee where id = 2;
select * from employee;

-- Alter command
desc employee;
-- Add new column Jobtital in employee table 
Alter table employee add column Jobtital varchar(30);
-- Drop column Jobtital in employee table 
Alter table employee drop column Jobtital;
select * from employee;

-- update data type of columns
desc employee;
alter table employee modify column lastname varchar(30);
desc employee;

-- drop primary key with alter command
alter table employee drop primary key;
desc employee;

-- Add primary key 
alter table employee add primary key (id);
desc employee;

-- DDL command = create, Alter, Drop, Truncate etc. 
-- DML command = insert, update, delete etc. 

-- -------------------------------- --
-- Auto increment values in columes --
-- -------------------------------- --
drop table employee;
show tables;
create table employee(
id int primary key auto_increment,
firstname varchar(20) not null,
middlename varchar(20) ,
lastname varchar(20) not null,
age int not null,
salary int not null,
location varchar(20) not null default 'bangalore'
);
desc employee;
insert into employee (firstname, middlename, lastname, age, salary, location) 
values ('Ganesh', 'Ram', 'pathak', 24 , 20000, 'Pune'), ('Brahmesh', 'pandurang', 'Lahamge', 22, 25000, 'pune');
select * from employee;
insert into employee (firstname, lastname, age, salary, location) 
values ('Ram', 'pathak', 24.56 , 2000.70, 'Pune');
SELECT 
    *
FROM
    employee;

-- --------------------------------------------------- --
-- Unique key
-- Unique key not hold duplicate but hold null values
-- Unique key we can apply on multiple colums /  table.
-- --------------------------------------------------- --
create table employee(
firstname varchar(20) not null,
lastname varchar(20) not null,
age int,
primary key (firstname, lastname)); -- combination attributes as primary key

-- with Unique key
create table employee(
firstname varchar(20),
lastname varchar(20),
age int,
unique key(firstname, lastname)) ; -- this will define given attributes as unique key


-- Foreign key Constraint
show databases;
drop database sqltutorial_2;
create database sqltutorial_2;
use sqltutorial_2;
show tables;

create table Students(
student_id int auto_increment,
student_fname varchar(20) not null,
student_lname varchar(20) not null,
student_mname varchar(20),
student_email varchar(40) not null,
student_phone varchar(15) not null,
student_alternate_phone varchar(15),
enrollment_date TIMESTAMP not null default current_timestamp,  -- Current_timestamp insert value of current date in table
year_of_exp int not null,
student_company varchar(30),
batch_date varchar(20) not null,
source_of_joining varchar(20),
location varchar(20) not null,
primary key(student_id),
unique key(student_email)
);
show tables;
desc students;

-- Inserting som seed data in student table
insert into students(student_fname, student_lname, student_email, student_phone, year_of_exp,
student_company, batch_date, source_of_joining, location) values ('rohit', 'sharma', 'rsharma123@gmail.com', '4352647624', 6, 'walmart', '05-03-20', 'linkedin', 'mumbai'); 

insert into students(student_fname, student_lname, student_email, student_phone, year_of_exp,
student_company, batch_date, source_of_joining, location) values 
('virat', 'kohali', 'virat18@gmail.com', '43526535467', 5, 'flipkart', '05-03-21', 'glassdoor', 'banglore'),
('sachin', 'tendulkar', 'st@gmail.com', '134566535467', 14, 'jio', '03-06-99', 'linkedin', 'pune'),
('ajinkya', 'Rahane', 'ajinkayr@gmail.com', '43526535467', 9, 'flipkart', '31-09-20', 'linkedin', 'nager'); 

select * from students;
drop table Courses;

create table Courses(
cource_id int primary key auto_increment,
cource_name varchar(20) not null,
cource_duration_months varchar(20) not null,
cource_fee int not null);

-- Insert some seed data in cources table

insert into Courses(cource_name, cource_duration_months, cource_fee)
 values ('bigdata', 6, 5000), ('web development', 3, 2000), ('data science', 6, 40000), ('devops', 1, 1000);
select * from Courses;

-- Adding cource_id colume in students table
show tables;
drop table students;
create table Students(
student_id int auto_increment,
student_fname varchar(20) not null,
student_lname varchar(20) not null,
student_mname varchar(20),
student_email varchar(40) not null,
student_phone varchar(15) not null,
selected_cource_id int not null,
student_alternate_phone varchar(15),
enrollment_date TIMESTAMP not null default current_timestamp,  -- Current_timestamp insert value of current date in table
year_of_exp int not null,
student_company varchar(30),
batch_date varchar(20) not null,
source_of_joining varchar(20),
location varchar(20) not null,
primary key(student_id),
unique key(student_email),
foreign key (selected_cource_id) references courses(cource_id)
);

desc students;
select * from students;

insert into students(student_fname, student_lname, student_email, student_phone, year_of_exp,
student_company, batch_date, source_of_joining, location, selected_cource_id) values 
('virat', 'kohali', 'virat18@gmail.com', '43526535467', 5, 'flipkart', '05-03-21', 'glassdoor', 'banglore', 2),
('sachin', 'tendulkar', 'st@gmail.com', '134566535467', 14, 'jio', '03-06-99', 'linkedin', 'pune',3),
('ajinkya', 'Rahane', 'ajinkayr@gmail.com', '43526535467', 9, 'flipkart', '31-09-20', 'linkedin', 'nager',3),
('rohit', 'sharma', 'rsharma123@gmail.com', '4352647624', 6, 'walmart', '05-03-20', 'linkedin', 'mumbai', 1);

insert into students(student_fname, student_lname, student_email, student_phone, year_of_exp,
student_company, batch_date, source_of_joining, location, selected_cource_id) values 
('ravindea', 'kohali', 'rk18@gmail.com', '43526535467', 5, 'flipkart', '05-03-21', 'glassdoor', 'banglore', 3); 
SELECT 
    *
FROM
    students;

-- -------------------------------- --
-- Distinct, ORDER BY,  Limit, Like --
-- -------------------------------- --

-- Distinct
select location from students;
select distinct location from students;
select distinct student_company from students;

-- Order by
select * from students;
select student_fname, year_of_exp from students;
select student_fname, year_of_exp from students order by year_of_exp;
select student_fname, year_of_exp from students order by selected_cource_id;

select student_fname, year_of_exp from students order by year_of_exp desc;
select student_fname, year_of_exp from students order by student_fname, year_of_exp; 

-- Limit
select * from students limit 3;

-- Problem:- select 3 candidates with least experience
select * from students order by year_of_exp limit 3;

-- Problem:- select 3 candidates with higher experience
select * from students order by year_of_exp desc limit 3;

-- want to know that from which sources last 5 candidates have enrolled
select student_fname, student_lname, source_of_joining , enrollment_date  from students order by enrollment_date desc limit 5;
select distinct source_of_joining, enrollment_date, student_lname from students order by enrollment_date desc limit 5;

-- Like
select * from students where student_fname like '%ra%'; -- '%' is called wildcard character
-- get student who have 5 charector in there first name
select * from students where student_fname like '_____'; -- "_" is called wildcard charecter use for element pointer

select distinct source_of_joining from students ;
select distinct source_of_joining,  enrollment_date from students ;