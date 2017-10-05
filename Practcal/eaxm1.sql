create user Jakir
identified by Jakir;
grant dba to Jakir;
conn Jakir/Jakir;
create table round(
roundId number(3) primary key,
roundName varchar2(20) not null);

create table student(
studentId number(5) primary key,
studentName varchar2(2) not null,
roundId number(3) references round(roundId));

create sequence sq
start with 10
increment by 1
nocache
nocycle;
set serveroutput on;

create or replace trigger tr_insert
after insert on student
for each row
begin
dbms_output.put_line('Thank you for inserting');
end;
/

create or replace trigger tr_update
after update on student
for each row
begin
dbms_output.put_line('Thank you for updating');
end;
/

create or replace trigger tr_delete
after delete on student
for each row
begin
dbms_output.put_line('Thank you for deleting');
end;
/

create or replace view st
as select studentId, studentName
from student;

create synonym stu
for st;

insert into round
values(sq.nextval, 'Round-31');
insert into round
values(sq.nextval, 'Round-32');
insert into round
values(sq.nextval, 'Round-33');
insert into round
values(sq.nextval, 'Round-34');
insert into round
values(sq.nextval, 'Round-35');

insert into student
values(1, 'Jakir', 26, 10);
insert into student
values(2, 'Jakir', 27, 11);
insert into student
values(3, 'Jakir', 28, 12);
insert into student
values(4, 'Jakir', 29, 13);
insert into student
values(5, 'Jakir', 30, 14);