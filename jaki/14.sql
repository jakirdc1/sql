
create table usa(
	usaId number primary key,
	fName varchar2(20),
	lName varchar2(20)
);

create table usa_backup(
	usaId number primary key,
	fName varchar2(20),
	lName varchar2(20)
);

create or replace trigger usa_after_insert
after insert on usa
for each row
declare
begin
	insert into usa_backup
	values(:new.usaId, :new.fName, :new.lName);
	dbms_output.put_line('Record inserted on table usa');
end;
/

insert into usa
values(102, 'Harry', 'jhonson');

insert into usa
values(120, 'Hossain', 'Jannat');

insert into usa
values(120, 'Nur', 'Milon');

insert into usa
values(130, 'Piyar', 'Boss');


create or replace trigger usa_after_update
after update on usa 
for each row
declare
begin 
update usa_backup
set UsaId = :new.UsaId
where UsaId = :old.UsaId;
dbms_output.put_line('Record succesfully update
 into usa table');
end;
/

update usa 
set usaId= 115
where usaId= 120;
select * from usa;

create or replace trigger usa_after_delete
after update on usa 
for each row
declare
begin 
delete usa_backup
where usaId = :old.usaId;
dbms_output.put_line('Record succesfully delete
 from usa table');
end;
/
delete from usa where usaId=102;

delete from usa where usaId=130;

delete from usa where lName='Milon';

update usa 
set lName= 'Mahmud'
where lName= 'Sarker';


 




