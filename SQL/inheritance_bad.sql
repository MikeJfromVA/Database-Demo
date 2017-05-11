-- This is an experimental PostgreSQL feature with many caveats
-- DO NOT USE INHERITS
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
	hiredate date
) inherits (person);

insert into employee (ssn, name, address, gender, birthdate, salary, hiredate)
values
(123456789, 'Mike J', '123 Whatever Ave.', 'M', 'Feb 28 1971', 99999, 'Jan 1 2010')
;

-- because partial specialization is allowed:
insert into person (ssn, name, address, gender, birthdate)
values
(987654321, 'Angela J', '123 Whatever Ave.', 'F', 'Feb 18 1971')
;


-- instance of subtype
select * from employee;

-- instance of supertype as well
select * from person;

-- what if we want instances strictly of supertype?
select * from only person;

-- PARTIAL SPECIALIZATION is the default rule of this PostgreSQL feature
-- If you want to enforce TOTAL SPECIALIZATION
revoke insert on person from public;

select * from person;

-- Bad : Duplicate IDs allowed between supertype and subtype
insert into employee (ssn, name, address, gender, birthdate, salary, hiredate)
values
(987654321, 'Ellisa J', '123 Whatever Ave.', 'F', 'Apr 6 1999', 99999, 'Jan 1 2010')
;

-- Worse : Duplicate IDs allowed within the subtype, because PKs, FKs are not inherited
-- (other constraints are. See postgresql documentation)
insert into employee (ssn, name, address, gender, birthdate, salary, hiredate)
values
(987654321, 'Eira J', '123 Whatever Ave.', 'F', 'Jan 31 2003', 99999, 'Jan 1 2010')
;


