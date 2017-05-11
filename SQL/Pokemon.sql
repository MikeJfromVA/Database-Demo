drop table if exists Pokemon cascade;
drop table if exists Trainer cascade;
drop table if exists Owns cascade;

create table Pokemon (
	name text primary key,
    type text not null
);

insert into public.Pokemon(name,type) values
 ('Pikachu', 'Electric'),
 ('Charmander', 'Fire')
 ;

/*
insert into Pokemon(name) values 
    ('GrblWrbl')
;
*/

create table public.Trainer (
	fname text,
    lname text,
    constraint trainer_pk primary key(fname,lname)
);

insert into Trainer(fname, lname) values
    ('Mike','Johnson'),
    ('Angela','Johnson'),
    ('Ellissa', 'Johnson')
    ;
    
/* deletes entire table    
delete from Trainer;

-- ditto
delete from Trainer
where lname='Johnson';
*/

delete from Trainer
where fname='Ellissa' and lname='Johnson';

alter table Trainer
    add column level int
;

update Trainer
	set level=1
;
    
select * from Trainer;

/*
select clause
from clause
where clause
order by clause
group clause
having clause
*/

select fname, level
from Trainer
where lname='Johnson'
order by fname asc
;

/*
Associative Entity "Owns"
*/

create table owns (
    owns_id serial,
	fname text not null,
    lname text not null,
	pname text not null,
    level int,
    constraint owns_pk primary key (owns_id),
    constraint owns_fk1 foreign key(fname, lname) references Trainer(fname,lname),
    constraint owns_fk2 foreign key(pname) references Pokemon(name)
);

insert into owns(fname, lname, pname, level)
select 'Mike', 'Johnson', name, 1
from Pokemon;

select * from owns;

select name
from Pokemon
where name like 'P%'
;


