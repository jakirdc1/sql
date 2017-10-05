--1--
create user Jak1238011
identified by Jak1238011;
grant dba to Jak1238011;
conn Jak1238011/Jak1238011;
 --2---
 create table employees(
 eId number(5) primary key,
 eName varchar2(20) not null,
 salary number(5),
 hire_date date,
 address varchar2(30)
 );
 --3---------
 alter table employees
 add(phone number(15),
 job_title varchar2(20)
 );
 desc employees;
 ---4--------
 insert into employees values(
 &eId, '&eName', &salary, '&hire_date', '&address',
 &phone, '&job_title');
select * from employees; 
set linesize250;
---5----
select 
eName, job_title, salary, salary+(salary*(30/100))
Tsalary from employees;
----6-----
select eName, salary from employees
where salary=(select min(salary) from employees);
---7----
update employees
set job_title='Manager';

update employees
set salary=50000, job_title='programer'
where eId=10;

delete from employees
where eId=13;
 