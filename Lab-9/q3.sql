/* Based on the University Database Schema in Lab 2, write a Pl/Sql block of code 
that lists the most popular course (highest number of students take it) for each of 
the departments. It should make use of a procedure course_popular which finds 
the most popular course in the given department. */

set serveroutput on
create or replace procedure course_popular(dept course.dept_name%type) is
cursor c1 is select * from course where dept_name=dept;
crs c1%rowtype;
cursor c2 is select course_id, count(id) as cnt_id from takes group by course_id;
pop_crs c2%rowtype;
most_pop_crs pop_crs.course_id%type;
max_count pop_crs.cnt_id%type;
begin
    max_count:=0;
    for crs in c1 loop
        for pop_crs in c2 loop
            if pop_crs.cnt_id>max_count then
                max_count:=pop_crs.cnt_id;
                most_pop_crs:=pop_crs.course_id;
            end if;
        end loop;
    end loop;
    dbms_output.put_line('Most Popular course : '||most_pop_crs);
end;
/

begin
    course_popular('Comp. Sci.');
end;
/




