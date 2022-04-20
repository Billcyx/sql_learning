use atguigudb;
SELECT * from employees;

SELECT last_name, salary
from employees
where salary > (
						SELECT salary
						from employees
						WHERE last_name = 'Abel'
						);

SELECT last_name, job_id, salary
from employees
where job_id = 
										(SELECT job_id
										 from employees
										 where employee_id = 141)
	and salary > 
										(SELECT salary
										from employees
										where employee_id = 143);
								
SELECT employee_id, manager_id, department_id
from employees
where (manager_id, department_id) in 
																		(SELECT manager_id, department_id
																		 from employees
																		 where employee_id in (141, 174))
and employee_id not in (141, 174);													

SELECT employee_id, last_name, 
				(case department_id
				 when (SELECT department_id from departments WHERE location_id = 1800)
				 then 'Canada'
				 else 'USA' 
				 end) location
from employees;

select department_id 
from employees
group by department_id
having AVG(salary) <= ALL 
									( SELECT AVG(salary) avg_sal
									  from employees
										GROUP BY department_id);
										
SELECT last_name, salary, e1.department_id
from employees e1, (SELECT department_id, AVG(salary) avg_sal from employees GROUP BY department_id) e2										
where e1.department_id = e2.department_id
and e2.avg_sal < e1.salary;

SELECT employee_id, last_name, job_id, department_id
from employees e1 
where EXISTS ( SELECT * from employees e2 where e2. manager_id = e1.employee_id);

#ASSIGNMENT 
#1
SELECT last_name, salary 
FROM employees e
where e.department_id = (SELECT department_id from employees where last_name = 'Zlotkey');

#2
SELECT employee_id, last_name, salary
from employees
where salary > (SELECT AVG(salary) from employees);

#3
SELECT last_name, job_id, salary
from employees
where salary > ALL (SELECT salary from employees where job_id = 'SA_MAN');

#4
SELECT employee_id, last_name
from employees
where department_id in (SELECT department_id from employees where last_name LIKE '%u%' or first_name like '%u%');

#5
SELECT employee_id
from employees
where department_id in (SELECT department_id from departments where location_id = 1700);

#6
SELECT e.employee_id, e.salary
FROM employees e, employees m
where e.manager_id = m.employee_id and m.last_name = 'King';

SELECT e.employee_id, e.salary
from employees e 
where manager_id  in (SELECT employee_id from employees where last_name = 'King');

#7
SELECT last_name, salary
from employees
where salary = (SELECT MIN(salary) from employees);

#8
SELECT department_id 
from employees
GROUP BY department_id 
HAVING AVG(salary) = (SELECT AVG(salary) from employees GROUP BY department_id ORDER BY AVG(salary) LIMIT 0,1);

#9
SELECT d.*, dept_avg_sal_min.avg_sal
from departments d, (SELECT department_id, AVG(salary) avg_sal from employees GROUP BY department_id ORDER BY avg_sal limit 0, 1) dept_avg_sal_min
where d.department_id = dept_avg_sal_min.department_id;

#10
SELECT job_title
from jobs j join employees e on j.job_id = e.job_id
where e.job_id = (SELECT job_id from employees GROUP BY job_id ORDER BY AVG(salary) desc LIMIT 0, 1);

#11
SELECT department_id, AVG(salary)
from employees
WHERE department_id is not NULL
GROUP BY department_id
HAVING AVG(salary) > (SELECT AVG(salary) from employees);

#12
SELECT DISTINCT e.manager_id, m.last_name, m.first_name
from employees m, employees e
WHERE m.employee_id = e.manager_id;

#13
SELECT department_id, min(salary)
from employees
GROUP BY department_id
having max(salary) <= ALL(SELECT max(salary) from employees GROUP BY department_id);

#14
SELECT department_id 'id', AVG(salary)
from employees 
GROUP BY department_id
HAVING AVG(salary) >= ALL(SELECT AVG(salary) from employees GROUP BY department_id);

SELECT d.manager_id, e.last_name, e.department_id, e.email, e.salary
from departments d inner join employees e
on d.manager_id = e.employee_id and d.department_id = 90;

#15
SELECT DISTINCT department_id
from employees 
where job_id <> 'ST_CLERK' and department_id is not NULL;

#16
SELECT e.last_name
from employees e 
where e.manager_id is NULL;

#18
SELECT employee_id, last_name, salary
from employees e
where salary > (SELECT AVG(salary) from employees where department_id = e.department_id);

#19
SELECT DISTINCT d.department_name
from departments d LEFT JOIN employees e
on d.department_id = e.department_id
where (SELECT COUNT(employee_id) from employees where department_id = e.department_id ) > 5;

#20
SELECT DISTINCT c.country_id
from countries c
left join locations l on c.country_id = l.country_id
left JOIN departments d1 on d1.location_id = l.location_id
where (SELECT COUNT(department_id) from departments d2 where d2. location_id = d1.location_id) > 2;

SELECT country_id
FROM locations l
WHERE 2 < (
    SELECT COUNT(*)
    FROM departments d
    WHERE l.`location_id` = d.`location_id`
    );
