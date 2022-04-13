#chapter 6 assignment 

show databases;
use atguigudb;
show tables from atguigudb;
desc employees;
desc departments;

#left join 
SELECT e.first_name, e.last_name, d.department_name
from employees e
left join departments d
on e.department_id = d.department_id;

SELECT e.first_name, e.last_name, d.department_name
from employees e, departments d 
where e.department_id = d.department_id
and e.department_id = 90;

SELECT e.job_id, d.location_id
from employees e
INNER JOIN departments d
on e.department_id = d.department_id
where d.department_id = 90;

desc locations;

select e.last_name, d.department_name, l.location_id, l.city 
from employees e
left join departments d 
on e.department_id = d.department_id 
left join locations l
on d.location_id = l.location_id
where e.commission_pct is not NULL;

select e.last_name, e.job_id, e.department_id, d.department_name
from employees e
INNER JOIN departments d 
on e.department_id = d.department_id 
inner join locations l
on d.location_id = l.location_id
where l.city = 'Toronto';

desc jobs;

#four charts
select d.department_name, l.street_address, e.first_name, e.last_name, e.salary, j.job_title
from employees e
inner join departments d
on e.department_id = d.department_id
inner join locations l
on d.location_id = l.location_id
inner join jobs j
on e.job_id = j.job_id
where d.department_name = 'Executive';

#self join 
select e.last_name as 'employees', e.employee_id as 'Emp#', 
m.last_name as 'manager', m.employee_id as 'Mgr#'
from employees e
left outer join employees m 
on e.manager_id = m.employee_id;

#right outer join
SELECT DISTINCT d.department_name
from employees e
right outer join departments d
on e.department_id = d.department_id;

#still outer joint 
SELECT DISTINCT l.city 
from locations l
left outer join departments d
on l.location_id = d.location_id;

select DISTINCT d.department_name, d.department_id, d.location_id, d.manager_id
from employees e
inner join departments d
on e.department_id = d.department_id
where d.department_name = 'Sales' or 'IT';