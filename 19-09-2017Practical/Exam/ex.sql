create user Jakir1
identified by Jakir1;

grant dba to Jakir1;

create table round(
roundId number(2) primary key,
roundName varchar2(20) not null
);

create table student2(
studentId number(2) primary key,
studentName varchar2(20) not null,
age number(2),
roundId number(2) references round(roundId)
);

create sequence squ
 start with 10
 increment by 10;
 set serveroutput on;
 
 create or replace trigger tr_insert
 after insert on student2
 for each row
 begin
 dbms_output.put_line('***************');
 dbms_output.put_line('Thank you for inserting');
 dbms_output.put_line('***************');
 end;
 /
 
 create or replace trigger tr_update
 after update on student2
 for each row
 begin
 dbms_output.put_line('***************');
 dbms_output.put_line('Thank you for updating');
 dbms_output.put_line('***************');
 end;
 /
 create or replace trigger tr_delete
 after delete on student2
 for each row
 begin
 dbms_output.put_line('***************');
 dbms_output.put_line('Thank you for deleting');
 dbms_output.put_line('***************');
 end;
 /
 
 insert into round
 values(squ.nextval, 'round-30');
 insert into round
 values(squ.nextval, 'round-31');
 insert into round
 values(squ.nextval, 'round-32');
 insert into round
 values(squ.nextval, 'round-33');
 insert into round
 values(squ.nextval, 'round-34');
 
 insert into student2
 values(1, 'Jakir', 30, 10);
 insert into student2
 values(2, 'Shamim', 31, 20);
 insert into student2
 values(3, 'parvez', 32, 30);
 insert into student2
 values(4, 'sohan', 33, 40);
 insert into student2
 values(5, 'ruhul', 34, 50);
 
 update student2
 set age=25
 where age=31;
 
 delete from student2
 where studentId=4;
 
 update student2
 set studentId=6
 where studentId=3;
 
  delete from student2
 where studentId=6;
 
 show serveroutput on;
 
 declare
	i number(3);
	j number(3);
begin
	i := 2;
	loop
		j := 2;
		loop
			exit when ((mod(i,j)=0) or (j=i));
			j := j+1;
		end loop;
		if(j=i) then
			dbms_output.put_line(i||' is prime.');
		end if;
		i := i+1;
		exit when(i=100);
		
	end loop;
end;
/

create or replace trigger tr_age
after update on student2
for each row
begin
	dbms_output.put_line('Old age was: '||:old.age);
	dbms_output.put_line('New age is: '||:new.age);
end;
/

create or replace trigger tr_age
after update on student2
for each row
begin
	dbms_output.put_line('New age is: '||:new.age);
end;
/

update student2 
set age = 30
where age = 35
and studentId = 1;
 
