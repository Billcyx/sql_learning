select 
ABS(-123), ABS(32), SIGN(-23), SIGN(43), PI(), CEIL(32.32), CEILING(-43.23), FLOOR(32.32),
FLOOR(-43.23), MOD(12,5)
from DUAL;

# 10, -1 here is the seed 
SELECT RAND(), RAND(), RAND(10),RAND(10),RAND(-1),RAND(-1)
FROM DUAL;

# round(x,y) truncate(x,y)
SELECT
ROUND(12.33),ROUND(12.343,2),ROUND(12.324,1),TRUNCATE(12.66,1),TRUNCATE(12.66,-1)
FROM DUAL;

use atguigudb;

SELECT employee_id, last_name, salary, salary * 1.2 "new salary"
from employees;

SELECT last_name, LENGTH(last_name)
from employees
ORDER BY last_name DESC;

SELECT CONCAT(employee_id, ' , ', last_name, ' , ', salary) result 
from employees;

SELECT SYSDATE() 
from DUAL;

select DATEDIFF(SYSDATE(), hire_date) / 365 working_years, DATEDIFF(SYSDATE(),hire_date) working_days
from employees
ORDER BY working_years desc;

SELECT last_name, hire_date, department_id
from employees
where DATE_FORMAT(hire_date, '%Y') >= 1997
and department_id in (80, 90, 110)
and commission_pct is not null;

SELECT last_name, hire_date
from employees
where DATEDIFF(now(),hire_date) > 10000;

SELECT last_name Last_name, job_id Job_id, CASE job_id 
	WHEN 'AD_PRES' THEN '1'
	WHEN 'ST_MAN' THEN '2'
	WHEN 'IT_PROG' THEN '3'
	WHEN 'SA_REP' THEN '4'
	WHEN 'ST_CLERK' THEN '5'
	ELSE '6'
	END "level"
from employees;#

SELECT department_id, AVG(salary)
from employees
where department_id > 80
GROUP BY department_id WITH ROLLUP
HAVING AVG(salary) > 10000;

#select from join on where GROUP BY HAVING ORDER BY limit 
#from where GROUP BY having select 

select manager_id, min(salary)
from employees
where manager_id is not NULL
GROUP BY manager_id
having MIN(salary) > 6000;

SELECT department_name, location_id, COUNT(employee_id), AVG(salary) avg_sal #4
FROM employees e #1
RIGHT JOIN departments d #1
ON e.`department_id` = d.`department_id` #1
GROUP BY department_name,  location_id #2
having COUNT(employee_id) > 2 #3
ORDER BY avg_sal DESC; #5

