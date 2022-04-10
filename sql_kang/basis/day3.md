# 1. select用法


## 1.1 select 基本用法
select ...(字段) from ...(表名)

select * from ... 这个* 代表所有的列。

## 1.2 select： 列的别名
select id 别名 from chart。

select id **as** 别名 from chart。

select id "别名" from chart。

不要使用单引号


## 1.3 去重复
select distinct id from employees;


## 1.4 控制参与运算
要用ifnull
select salary* ifnull(commission,0) as "annual_salary" from employees;

着重号 

过滤 select  from where

100 + 'a' ==> 100; a is dealt with as zero.
100 + NULL ==> null

100/2 = 50.000 sql里面除法自动保留小数位

只要和NULL比较，结果都是NULL

<=> 为NULL而生，检测 null = null

XOR 一个对 一个不对

AND 优先级 高于 or

where不能用别名

limit 2(显示数据数量) offset 0(偏移量)  ##in sql8.0

为什么不把一些表发一起？ 浪费空间 2. 

