
create or replace procedure greetings
as
begin
dbms_output.put_line('Hello Jakir Hossain');
end;
/
declare
a number;
b number;
c number;
procedure findMin(x in number, y in number, z out number) is
begin
if x < y then
z:= x;
ELSE
z:= y;
END IF;
End;

BEGIN 
a: = 23;
b: = 45;
findMin(a, b, c);
dbms_output.put_line('MINIMUM of (23, 45) : ' || c);
end;
/