drop table if exists customer;
drop table if exists salesperson;

create table salesperson (
	sales_id int primary key,
	sales_fname varchar(20),
	sales_lname varchar(20)
);

create table customer (
	cust_id int primary key,
	cust_fname varchar(20),
	cust_lname varchar(20),
	assigned_sales_id int default 1002 references salesperson(sales_id) 
--		Try each of these trigger actions
--		on delete cascade
		on delete set null
--		on delete set default
--		on update cascade
--		on update set null
--		on update set default
);

insert into salesperson
(sales_id, sales_fname, sales_lname)
values
(1001, 'Eira', 'Johnson'),
(1002, 'Ellissa', 'Johnson')
;

insert into customer
(cust_id, cust_fname, cust_lname, assigned_sales_id)
values
(123, 'Mike', 'Johnson', 1001),
(124, 'Angela', 'Johnson', 1002)
;

/*
-- Try this query with the update trigger actions
update salesperson
set sales_id = 1234
where sales_id = 1001
;

-- Try this query with the delete trigger actions
delete
from salesperson
where sales_id = 1001;
*/

select * from salesperson;
select * from customer;


update customer
set assigned_sales_id = 1003
where cust_id = 124;


