--create table
create table student(
user_id number(5) not null,
username varchar2(20) not null,
primary key (user_id)
);
--create procedure
create or replace procedure getStudentByUserId(
p_userid in student.user_id%type,
p_username out student.username%type
)
is
begin 
select username
into p_username
from student where user_id = p_userid;
end;
/
--insert data in table

insert into student
values(100,'Jakir');
insert into student
values(101,'Tanha');
insert into student
values(102,'Jerin');
insert into student
values(103,'Jannati');
insert into student
values(104,'Fahim');

--call procedure to retrieved data
declare
p_username student.username%type;
begin
getStudentByUserId(&userid, p_username);
dbms_output.put_line('username is: '|| p_username);
end;
/
