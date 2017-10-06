create user Jakirh
identified by Jakirh;

grant dba to Jakirh;

create table employee(
eid number(10) primary key,
eName varchar2(30) not null,
salary number,
hire_date date,
Address varchar2(100));

alter table employee add(
Phone number(11),
job_title varchar2(50));

describe employee;
select * from employee;

insert into employee
values(&eid, '&eName', &salary, '&hire_date', '&Address',
&Phone, '&job_title');

select eName, job_title, salary, salary+(salary*(30/100)) tsalary
from employee;

select eName, salary
from employee
where salary = (
	select min(salary)
	from employee
);

update employee
set job_title = 'Manager';

update employee
set salary = 7000, job_title = 'Programmer'
where eid = 10;

drop table employee;


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
