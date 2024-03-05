/* Write a PL/SQL block to list the students who have registered for a course taught
by his/her advisor */

set serveroutput on
declare
    cursor c3 is select * from course;
    crs c3%rowtype;
    cursor c2(dept crs.dept_name%type) is select * from instructor where dept_name=dept;
    inst c2%rowtype;
    cursor c1(instid inst.id%type) is select * from student s join advisor a on a.s_id=s.id where i_id=instid;
    stud c1%rowtype;
begin
    for crs in c3 loop
        dbms_output.put_line('Course Details :'||crs.course_id||' '||crs.title);
        for inst in c2(crs.dept_name) loop
            dbms_output.put_line('Instructor Name : '||inst.name);
            dbms_output.put_line('Students : ');
            for stud in c1(inst.id) loop
                dbms_output.put_line(stud.name);
            end loop;
        end loop;
    end loop;

end;
/