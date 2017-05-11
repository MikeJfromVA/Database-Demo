-- because review contains a dependency on employee, you must drop review first
drop table if exists review;
drop table if exists employee;

-- comments using dash-dash :)

create table employee(
	emp_id int primary key,
	emp_fname varchar(20),
	emp_mi char(1), 
	emp_lname varchar(20),
	emp_dept char(4)
);

create table review(
	rev_date date,
	rev_content text,
	emp_id int not null references employee(emp_id), -- Mandatory Emp, FOREIGN KEY
	constraint reviewPK primary key (emp_id, rev_date)	
);

-- insert

insert into employee (emp_id, emp_fname, emp_mi, emp_lname, emp_dept) values
(123455, 'Angela', 'v', 'Johnson', 'SHIP'),
(123456, 'Mike', 'C', 'Johnson', 'SHIP');

insert into review (emp_id, rev_date, rev_content) values
(123456, 'Sep 8 2015', 'Mr. Johnson always washes his hands after using the employee restroom.');

select * from review;
select * from employee;

-- update
update review
set rev_content = 'Mr. Johnson is brilliant. He deserves a 0.0001% raise.'
where emp_id = 123456
;

-- select
select *
from employee
where emp_id = 123455
;

-- delete
delete
from employee
where emp_id = 123455
;

select * from employee;

delete
from employee
where emp_id = 123456
;

