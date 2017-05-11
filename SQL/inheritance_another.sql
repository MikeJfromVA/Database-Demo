-- This is another way to implement inheritance using SQL
-- Using a discriminator
drop table if exists employee cascade;
drop table if exists person cascade;

create table alumni ( 
	aid int primary key,
	degree text -- This is actually multivalued, too lazy to make another table...
);

create table student ( 
	sid int primary key,
	major text
);

create table employee ( 
	eid int primary key,
	salary numeric(6,0),
	hiredate date
);

create table person (
	ssn numeric(9,0) primary key,
	pname text,
	address text,
	gender char(1) check (gender='M' OR gender='F'),
	birthdate date,
	-- Discriminator enforces Total-Specialization + Disjoint-Rule
	ptype char(1) check (ptype='E' or ptype='A' or ptype='S'),
	eid int unique check ((ptype<>'E' or eid is not null) and (ptype='E' or eid is null)) references employee(eid),
	aid int unique check ((ptype<>'A' or eid is not null) and (ptype='A' or aid is null)) references alumni(aid),
	sid int unique check ((ptype<>'S' or sid is not null) and (ptype='S' or sid is null)) references student(sid)
);

-- The PK+FK column creates a 1:1 relationship between child data and parent data


insert into employee (eid, salary, hiredate)
values
(1, 99999, 'Jan 1 2010')
;
insert into person (ssn, pname, address, gender, birthdate, ptype, eid)
values
(123456789, 'Mike J', '123 Whatever Ave.', 'M', 'Feb 28 1971', 'E', 1)
;


-- Only partial views available without joins
select * from employee;
select * from person;

-- A view puts it all together for us nicely
create view employeeV as
select person.ssn, person.pname, person.address, person.gender, person.birthdate,
	employee.salary, employee.hiredate
from employee, person
where employee.eid = person.eid
and person.ptype = 'E'
;

select * from employeeV;

-- Ignoring inheritance constraints (Completeness and Disjointness)

