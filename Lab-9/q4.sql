/* Based on the University Database Schema in Lab 2, write a procedure which takes 
the dept-name as input parameter and lists all the students associated with the 
department as well as list all the courses offered by the department. Also, write an 
anonymous block with the procedure call. */

set serveroutput on
create or replace procedure q4(dept department.dept_name%type) is
cursor c1 is select * from (student join takes using(id)) join course using(course_id);
stud c1%rowtype;
cursor c2 is select * from course join department using(dept_name);
crs c2%rowtype;
begin
    dbms_output.put_line(dept);
    dbms_output.put_line('Students : ');
    for stud in c1 loop
        if stud.dept_name=dept then
            dbms_output.put_line(stud.name);
        end if;
    end loop;
    dbms_output.put_line('Courses : ');
    for crs in c2 loop
        if crs.dept_name=dept then
            dbms_output.put_line(crs.course_id);
        end if;
    end loop;
end;
/

begin 
    q4('Comp. Sci.');
end;
/