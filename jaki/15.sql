create user  identified by Tanha;
grant dba to Tanha;
create table round(roundId number(10) primary key,
roundName varchar2(30));


create table student(
studentId number(10),
studentName varchar2(30), age number(10),
roundId number(10),
constraint studentId_fk_roundId foreign key(roundId) references 
round(roundId));

create table student_backup(
studentId number(10),
studentName varchar2(30), age number(10),
roundId number(10) primary key);


create sequence round_seq start with 1001
 increment by 10 nocache nocycle;
 

 create or replace trigger student_after_insert
after insert on student
for each row
declare
begin
	insert into student_backup 
	values(:new.studentId,
	:new.studentName, :new.age, :new.roundId);
	dbms_output.put_line('Record inserted on table student');
end;
/
 
create or replace trigger tr_insert
after insert on student 
for each row
begin
	insert into student_backup
	values(:new.studentId, :new.studentName, :new.age, :new.roundId);
	dbms_output.put_line('student_backup table is also inserted.......');
end;
/



