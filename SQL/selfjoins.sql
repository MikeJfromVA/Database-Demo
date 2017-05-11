drop table if exists scout cascade;

create table scout (
    name text primary key,
    age int
);

insert into scout(name,age) values 
('Mike',18),
('Angela',19),
('Ellissa',17),
('Eira',13)
;

select olderscout.name, olderscout.age, youngerscout.name, youngerscout.age
from scout as olderscout
join scout as youngerscout
on olderscout.age >= (youngerscout.age + 2)
;

