/* Write a function to return the Square of a given number and call it from an 
anonymous block */

set serveroutput on
create or replace function q5(num number) 
return number 
as 
square number;
begin
    square:=num*num;
    return square;
end;
/

declare
    num number;
begin 
    num:='&num';
    q5(num);
end;
/