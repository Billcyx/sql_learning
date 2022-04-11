use atguigudb;

desc employees;
desc departments;
desc locations;

#Abel工作地方
select *
from employees
where last_name = 'Abel';

select *
from departments 
where department_id = 80;

select *
from locations
where location_id = 2500;

#如果合成一个表，会浪费很多空间（重复的内容，或者null）--> 空间大了，与硬盘交互的次数就多，维护变难，
#同时多表可以实现多线路

#多表查询如何实现 ？
#错误，笛卡尔积的连接，cross join, 不同表中每一个元素都被匹配， 因为缺少链接条件
select last_name, department_name
from employees, departments;

#多表查询如何实现 ？正确方法：
select emp.last_name, dept.department_name, emp.department_id
from employees emp, departments dept
where emp.department_id = dept.department_id; 

/*
多表查询分类
角度1: 等值连接 VS 非等值连接
角度2: 自连接 VS 非自连接
角度3: 内连接 VS 外连接(分为左外连接，友外连接和满外连接) 
*/

