drop table if exists student cascade;
drop table if exists professor cascade;

create table professor (
	prof_id int primary key,
	prof_lname text,
	prof_dept text
);

create table student (
	stud_id int primary key,
	stud_fname text,
	stud_lname text,
	advisor_prof_id int
		default 33333
		references professor(prof_id) 
		on delete set null
		on update cascade
);

insert into professor
(prof_id, prof_lname, prof_dept)
values
(11110, 'Johnson', 'Computer Science'),
(22222, 'Cheney', 'Computer Science'),
(33333, 'Riedl', 'Computer Science'),
(44444, 'Heddle', 'Physics')
;

insert into student
(stud_id, stud_fname, stud_lname, advisor_prof_id)
values
(10001, 'Marietta', 'Edgecombe', 11110),
(10002, 'Stephen', 'Strange', 22222),
(10003, 'Riley', 'Anderson', 33333)
;

insert into student
(stud_id, stud_fname, stud_lname)
values
(10004, 'Montgomery', 'Scott')
;

update student
set advisor_prof_id = 22222
where stud_id = 10003
;

update professor
set prof_id = 11111
where prof_id = 11110
;

delete from professor
where prof_id = 11111
;

select * from student order by stud_id asc;
select * from professor order by prof_id asc;

