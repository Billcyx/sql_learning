#DML DDL DCL TCL

#create database 
create database if not EXISTS dbtest CHARACTER set 'utf8';

#create table 
use dbtest;

/*
create table my_employees(
		id int(10),
		first_name VARCHAR(10),
		last_name VARCHAR(10),
		userid VARCHAR(10),
		salary DOUBLE(10,2)
);

create table users(
	id int,
	userid VARCHAR(10),
	department_id int
);

INSERT into my_employees values
(1,'patel','Ralph','Rpatel',895),
(2,'Dancs','Betty','Bdancs',860),
(3,'Biri','Ben','Bbiri',1100),
(4,'Newman','Chad','Cnewman',750),
(5,'Ropeburn','Audrey','Aropebur',1550);

SELECT * from my_employees;

insert into users VALUES
(1,'Rpatel',10),
(2,'Bdancs',10),
(3,'Bbiri',20),
(4,'Cnewman',30),
(5,'Aropebur',40);

update my_employees set last_name = 'drelxer' where id = 3;

DELETE u, e 
from users u join my_employees e
on u.userid = e.userid;

*/


SELECT * from my_employees;
desc my_employees;

TRUNCATE table my_employees;

SELECT * from my_employees;
desc my_employees;

# create table employees as select * from my_employees;
#rename table employee to employees;
desc employees;

#alter table employees modify first_name VARCHAR(20);
desc employees;

#alter table employees add middle_name VARCHAR(20) after first_name;
#alter table employees drop column middle_name;

#alter table employees change first_name f_name VARCHAR(20);
#alter table employees add first_name VARCHAR(20) first;
desc employees;

/*
alter table ... add ... ater..../first 
alter table modify ... (after)
alter table .. drop column ..
alter table .. add column ..
alter table .. change column .. (name)
rename table .. to ....
*/

drop DATABASE dbtest;
