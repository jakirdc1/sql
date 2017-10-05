set serveroutput on;
-- create user
create user bdstudent
identified by bdstudent;

grant dba to bdstudent;

conn bdstudent/bdstudent;

create table roundbd(
	roundId number primary key,
	roundName varchar2(20)
);

create table student(
	studentId number primary key,
	studentName varchar2(20),
	age number(2),
	roundId number
);

create table student_backup(
	studentId number primary key,
	studentName varchar2(20),
	age number(2),
	roundId number 	
);

create or replace trigger tr_insert
after insert on student 
for each row
begin
	insert into student_backup
	values(:new.studentId, :new.studentName, :new.age, :new.roundId);
	dbms_output.put_line('student_backup table is also inserted.......');
end;
/

create or replace trigger tr_update
after update on student
for each row 
begin
	update student_backup
	set studentId = :new.studentId
	where studentId = :old.studentId;
	dbms_output.put_line('student_backup table is also updated.......');
end;
/

create or replace trigger tr_delete
after delete on student
for each row
begin
	delete from student_backup
	where studentId = :old.studentId;
	dbms_output.put_line('student_backup table is also deleted......');
end;
/


create or replace trigger tr_update_message
after update on student
for each row
begin
	dbms_output.put_line('Old age: '||:old.age);
	dbms_output.put_line('New age: '||:new.age);
end;
/

insert into roundbd
values(30, 'Round-30');
insert into roundbd
values(31, 'Round-31');
insert into roundbd
values(32, 'Round-32');
insert into roundbd
values(33, 'Round-33');
insert into roundbd
values(34, 'Round-34');

insert into student
values(1, 'Harry', 24, 30);

insert into student
values(3, 'Harry', 24, 30);

insert into student
values(4, 'Harry', 24, 30);

update student
set studentId = 4
where studentId = 3;

delete from student
where studentId = 4;	
	

insert into student
values(5, 'Harry', 24, 30);

update student
set studentId = 6
where studentId = 2;

delete from student
where studentId = 6;
	
	
	
	
	