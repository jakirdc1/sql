create user Ja1238011
identified by Ja1238011;

grant dba to Ja1238011;

conn Ja1238011/Ja1238011;
---1------
create table employees(
eId number(5) primary key,
eName varchar2(20) not null,
salary number(7),
hire_date date default sysdate,
address varchar2(30)
);
---2------

alter table employees
add(departmentId number(5),
departmentName varchar2(20)
);

desc employees;
----3---
create or replace trigger tr_insert
after insert on employees
for each row
begin
dbms_output.put_line('Thank you for inserting');
end;
/
---4-------
create or replace trigger tr_update
after update on employees
for each row
begin
dbms_output.put_line('Thank you for updating');
end;
/
----5-----
create or replace trigger tr_delete
after delete on employees
for each row
begin
dbms_output.put_line('Thank you for deleting');
end;
/
----6--- 
create sequence sq
start with 10
increment by 1;

create or replace view emp
as select eId, departmentName, departmentId
from employees;

create synonym empl
for em;
