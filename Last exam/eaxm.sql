create user Marzia
identified by Marzia;

grant dba to Marzia;

conn Marzia/Marzia;

create table employees(
eId number(5) primary key,
eName varchar2(20) not null,
salary number(10) not null,
hire_date date,
address varchar2(50));

alter table employees
add(phone number(11),
job_title varchar2(20));

insert into employees
 values(&eId, '&eName', &salary, '&hire_date', 
 '&address', &phone, '&job_title');
 
 select eId, job_title, salary, salary+(salary*(30/100)) Tsalary
 from employees;
 
 select eName, salary from employees
 where salary =(select min(salary) from employees);
 
 update employees
 set job_title = 'Manager';
 
 create or replace procedure sumtwo(x number, y number) is
begin
	dbms_output.put_line('The sum is: '||(x+y));
end;
/

exec sumtwo(5,10);

execute sumtwo(20,5);

begin
	sumtwo(30,50);
end;
/
 
 
 
 
 
 
 
 
 