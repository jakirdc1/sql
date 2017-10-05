part-1
create table student1(
user_id number(5) not null,
username varchar2(20) not null,
primary key (user_id)
);

PART-2
-- create procedure

create or replace procedure getStudentByUserId(
	p_userid in student1.user_id%type,
	p_username out student1.username%type
)
is
begin
	select username
	into p_username
	from student1 where user_id = p_userid;
end;
/

create table student2(
user_id number(5) not null,
username varchar2(20) not null,
primary key (user_id)
);
--create procedure

create or replace procedure getStudentByUserId(
p_userid in student2.user_id%type,
p_username out student2.username%type
)
is
begin
 select username
 into p_username
 from student2 where user_id = p_userid;
 end;
 /

