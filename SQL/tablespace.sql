-- create tablespace fastthumbdrive location '/Volumes/MYTHUMBDRIVE/CPSC440Demo/data';

create table fasttable (
	firstname text,
	lastname text,
	constraint fasttable_pk primary key (firstname, lastname)
) tablespace fastthumbdrive;

