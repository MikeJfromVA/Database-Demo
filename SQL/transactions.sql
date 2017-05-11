drop table if exists bank cascade;

create table bank (
	username text primary key,
	balance numeric(9,2)
);

insert into bank (username, balance)
values
('Mike', 900.00)
;

select * from bank;

BEGIN;

update bank
set balance = balance - 125.00
where username = 'Mike'
;

select * from bank;

COMMIT;

ROLLBACK;