# LIMIT 偏移量（start from zero），条目数
#limit 条目数 offset 偏移量 
#减少数据表传输量 并且 增加查询效率
use atguigudb;
show tables from atguigudb;
SELECT * from employees;

select first_name, last_name, salary 
from employees
where salary not BETWEEN 8000 and 17000
order by salary DESC
limit 20

