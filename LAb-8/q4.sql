/* Find all students who take the course with Course-id: CS101 and if he/ she has 
less than 30 total credit (tot-cred), deregister the student from that course. (Delete 
the entry in Takes table) */

set serveroutput on
declare
    cursor c1(cid takes.course_id%type) is select * from takes join student using(id) where course_id=cid; 
    stud takes%rowtype;
begin
    for stud in c1('CS-101') loop
        if stud.tot_cred<30 then
            delete from takes where id=stud.id;
            dbms_output.put_line('Student deleted : '||stud.id);
        end if;
    end loop;

end;
/