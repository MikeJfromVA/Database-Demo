drop view if exists happy_customer;
drop table if exists customer;

-- DDL
create table customer (
	cust_id int primary key,
	cust_fname varchar(20),
	cust_lname varchar(20)
);

-- DML
insert into public.customer
(cust_id, cust_fname, cust_lname)
values
(123, 'Mike', 'Johnson'),
(124, 'Angela', 'Johnson')
;

select public.customer.cust_fname, public.customer.cust_lname, ' is teh Awesome!'
from customer
;

drop table if exists private.customer;
drop schema if exists private;

create schema private;

create table private.customer (
	cust_id int primary key,
	cust_credit_card numeric(16,0)
)
;

insert into private.customer
(cust_id, cust_credit_card)
values
(123, 9876543267892345),
(124, 7890432109871234)
;

select private.customer.cust_credit_card
from private.customer
;

-- View created using SELECT query
create view happy_customer as
select public.customer.cust_fname
from public.customer;

select * from happy_customer; -- View treated as table

select * 
from public.customer, private.customer
where public.customer.cust_id = private.customer.cust_id
; -- equijoin

select public.customer.cust_lname, private.customer.cust_credit_card
from public.customer, private.customer
where public.customer.cust_id = private.customer.cust_id
; -- equijoin


