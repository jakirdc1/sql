create user Jakir identified by Jakir;
grant dba to Jakir;
conn Jakir/Jakir;
create table department(dep_id number(15) primary key, dep_name varchar2(30) unique);
create table employee(emp_id number(15) primary key, emp_name varchar2(30),dep_id number(15),
constraint emp_fk_dep foreign key(dep_id) references department(dep_id));

insert into department
values(100, 'IT');

insert into department
values(110, 'Physics');

insert into department
values(120, 'Bangla');
select * from department;

insert into employee
values(10, 'Jakir', 100);

insert into employee
values(20, 'Parvez', 110);

insert into employee
values(30, 'Ruhul', 120);

select * from employee;
