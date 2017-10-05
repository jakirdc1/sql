create user bdstudent
identified by bdstudent;

grant dba to bdstudent;

conn bdstudent/bdstudent;

create table roundbd(
	roundId number primary key,
	roundName varchar2(20));
	
create table student(
	studentId number primary key,
	studentName varchar2(20),
	roundId number);
	
create sequence sq
start with 100
increment by 1;
	
create or replace trigger tr_insert
after insert on student
for each row
begin 
dbms_output.put_line('One new row is inserted.
Thank you for inserting');
end;
/	

create or replace trigger tr_update
after update on student
for each row
begin 
dbms_output.put_line('One new row is updated.
Thank you for updating');
end;
/

create or replace trigger tr_delete
after delete on student
for each row
begin 
dbms_output.put_line('One new row is deleted.
Thank you for deleting');
end;
/

insert into roundbd
values(10, 'round-30');

insert into roundbd
values(20, 'round-31');

insert into roundbd
values(30, 'round-32');

insert into roundbd
values(40, 'round-33');

insert into roundbd
values(50, 'round-34');

insert into roundbd
values(20, 'round-31');

insert into roundbd
values(30, 'round-32');

insert into roundbd
values(40, 'round-33');

insert into student
values(1, 'herry', 10);

insert into student
values(2, 'tong', 20);

insert into student
values(3, 'mong', 30);

insert into student
values(4, 'nato', 40);

insert into student
values(5, 'frank', 50);

select * from roundbd;

select * from student;


update student
set studentId=8
where studentId=3;

delete from student
where studentId=1;

insert into student
values(8, 'frank', 60);
	
