/* Based on the University Database Schema in Lab 2, write a procedure which takes 
the dept_name as input parameter and lists all the instructors associated with the 
department as well as list all the courses offered by the department. Also, write an 
anonymous block with the procedure call. */

set serveroutput on
create or replace procedure q2(dept instructor.dept_name%type) is
cursor c1 is select * from instructor where dept_name=dept;
inst c1%rowtype;
cursor c2 is select * from course where dept_name=dept;
crs c2%rowtype;
begin
    dbms_output.put_line(dept);
    dbms_output.put_line('Instructors : ');
    for inst in c1 loop
        dbms_output.put_line(inst.name);
    end loop;
    dbms_output.put_line('Courses : ');
    for crs in c2 loop
        dbms_output.put_line(crs.title);
    end loop;
end;
/

begin
    q2('Comp. Sci.');
end;
/