/* Write a PL/SQL block to print the list of Instructors teaching a specified course. */

set serveroutput on
declare
    inp_cid varchar(8);
    cursor c1(cid teaches.course_id%type) is select * from teaches join instructor using(id) where course_id=cid;
    inst c1%rowtype;
begin
    inp_cid := '&inp_cid';
    dbms_output.put_line('Enter course_id : '||inp_cid);
    for inst in c1(inp_cid) loop
        dbms_output.put_line(inst.name);
    end loop;
end;
/