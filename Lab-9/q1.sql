set serveroutput on
create or replace procedure q1 is
begin 
    dbms_output.put_line('Good Day');
end;
/

begin
    q1;
end;
/
