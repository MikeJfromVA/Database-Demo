-- This is the preferred way to implement inheritance using SQL
drop table if exists employee;
drop table if exists person;

create table person (
	ssn numeric(9,0) primary key,
	name text,
	address text,
	gender char(1) check (gender='M' OR gender='F'),
	birthdate date
);

create table employee ( 
	salary numeric(6,0),
	hiredate date,
	pssn numeric(9,0) primary key references person(ssn)
);
-- The PK+FK column creates a 1:1 relationship between child data and parent data


insert into person (ssn, name, address, gender, birthdate)
values
(123456789, 'Mike J', '123 Whatever Ave.', 'M', 'Feb 28 1971')
;
insert into employee (salary, hiredate, pssn)
values
(99999, 'Jan 1 2010', 123456789)
;

-- Only partial views available without joins
select * from employee;
select * from person;

-- A view puts it all together for us nicely
create view employeeV as
select person.ssn, person.name, person.address, person.gender, person.birthdate,
	employee.salary, employee.hiredate
from employee, person
where employee.pssn = person.ssn
;

select * from employeeV;

-- Ignoring inheritance constraints (Completeness and Disjointness)

