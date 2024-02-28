/* Print the Course details and the total number of students registered for each course 
along with the course details - (Course-id, title, dept-name, credits, 
instructor_name, building, room-number, time-slot-id, tot_student_no ) */

set serveroutput on
declare
    tot_stud numeric(3);
    cid varchar(8);
    cursor c1 is select * from course;
    c course%rowtype;
    cursor c2 is select * from takes;
    t takes%rowtype;
begin
    for c in c1 loop
        tot_stud := 0;
        cid := c.course_id;
        for t in c2 loop
            if t.course_id=cid then
                tot_stud := tot_stud + 1;
            end if;
        end loop;
        dbms_output.put_line('Course Details : '||c.course_id||' '||c.title||' '||c.dept_name||' '||c.credits);
        dbms_output.put_line('Total Students : '||tot_stud);
    end loop;
end;
/