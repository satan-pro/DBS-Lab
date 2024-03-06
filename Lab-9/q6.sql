/* Based on the University Database Schema in Lab 2, write a Pl/Sql block of code 
that lists the highest paid Instructor in each of the Department. It should make use 
of a function department_highest which returns the highest paid Instructor for the 
given branch. */

set serveroutput on
create or replace function q6(dept department.dept_name%type)
return instructor.name%type;
as
cursor c1 is select * from instructor where dept_name=dept;
inst c1%rowtype;
max_sal inst.salary%type;
res inst.name%type;
begin
    max_sal:=0;
    for inst in c1 loop
        if inst.salary>max_sal then
            max_sal:=inst.salary
            res:=inst.name;
        end if;
    end loop;
    return res;
end;
/

declare
    cursor c1 is select * from department;
    dept c1%rowtype;
    inst instructor.name%type;
begin 
    for dept in c1 loop
        inst:=q6(dept.dept_name);
        dbms_output.put_line(dept.dept_name||' : '||inst);
    end loop;
end;
/
