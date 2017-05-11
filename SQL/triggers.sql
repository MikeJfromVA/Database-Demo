-- Triggers

-- Using a trigger to enforce Total Specialization Rule for Completeness Constraint
drop table if exists professor cascade;
drop table if exists adjunct cascade;
drop table if exists faculty cascade;
drop function if exists total_specialization_check() cascade;

create table professor (
	empid int,
	fname text,
	lname text,
	degree text,
	contract char(1), -- Adjunct = 'a', Faculty = 'f'
	constraint professor_pk primary key (empid)
);

create table faculty (
	office text,
	empid int,
	constraint faculty_pk primary key (empid),
	constraint faculty_fk1 foreign key (empid) references professor(empid)
);

create table adjunct (
	employer text,
	empid int,
	constraint adjunct_pk primary key (empid),
	constraint adjunct_fk1 foreign key (empid) references professor(empid)
);

create function total_specialization_check() returns trigger as 
$tsc$ -- This is the delimiter for embedded code in SQL
begin
	if new.contract = 'a' then
		insert into adjunct (employer, empid) values (null, new.empid);
	elsif new.contract = 'f' then
		insert into faculty (office, empid) values (null, new.empid);
	else
		raise exception '% % contract must be a(djunct) or f(aculty)', new.fname, new.lname;
	end if;	
	return new;
end;
$tsc$ language plpgsql;
-- For more PL/PGSQL see http://www.postgresql.org/docs/9.3/static/plpgsql.html

create trigger insert_professor_tsc after insert on professor for each row execute procedure total_specialization_check();
-- The procedure will be run after INSERT INTO PROFESSOR completes, but right before other constraint checks are run

insert into professor (empid, fname, lname, degree, contract)
values
(123, 'Michael', 'Johnson', 'Masters Applied Physics CNU', 'f')
;

select * from professor;
select * from faculty;
