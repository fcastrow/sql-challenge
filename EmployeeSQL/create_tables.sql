--drop table departments cascade;
--drop table dept_emp cascade;
--drop table dept_manager cascade;
--drop table employees cascade;
--drop table salaries cascade;
--drop table titles cascade;

create table employees(
emp_no int not null primary key,
birth_date date,
first_name varchar(50),
last_name varchar(50),
gender char(1) check(gender = 'M' or gender = 'F'),
hire_date date
);

create table departments(
dept_no varchar(4) not null primary key,
dept_name varchar(50) not null
);

create table dept_emp(
emp_no int not null references employees(emp_no),
dept_no varchar(4) not null references departments(dept_no),
from_date date,
to_date date,
primary key(emp_no, dept_no)
);

create table dept_manager(
dept_no varchar(4) not null references departments(dept_no),
emp_no int not null references employees(emp_no),
from_date date,
to_date date,
primary key(dept_no, emp_no)
);

create table salaries(
emp_no int not null references employees(emp_no),
salary int,
from_date date,
to_date date
);

create table titles(
emp_no int not null references employees(emp_no),
title varchar(50),
from_date date,
to_date date
);
