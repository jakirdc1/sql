declare
i number (3);
j number (3);
begin
i := 2;
  loop
   j := 2;
     loop
	   exit when ((mod(i,j)=0) or (j=i));
	    j := j+1;
		end loop;
		 if (j=i) then
		 dbms_output.put_line(i || 'is prime');
		 end if;
	i := i+1;
	exit when(i=90);
	end loop;
	end;
	/
	
	
create table student(user_id number(5) primary key,
username varchar2(20) not null);
		 
create or replace procedure	getStudentByUserId(
p_userid in student.user_id%type,
P_username out student.username%type
)
is
begin
select username
into p_username
from student where user_id=p_userid;
end;
/	 
		 
--------inser data in table
insert into student
values(100, 'Jakir');
insert into student
values(101, 'Shamim');
insert into student
values(102, 'Parvez');
insert into student
values(103, 'Atiq');
insert into student
values(104, 'Sajal');

--call procedure to data

declare
p_username student.username%type;
begin
getStudentByUserId(&userna_id, p_username);
dbms_output.put_line('username: ' || p_username);
end;
/


	