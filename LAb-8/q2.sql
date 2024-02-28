set serveroutput on
declare
    loop_count numeric(2);
    cursor c1 is select * from student order by tot_cred;
    stud student%rowtype;
begin
    loop_count := 1;
    for stud in c1 loop
        dbms_output.put_line(stud.id||' '||stud.name||' '||stud.dept_name||' '||stud.tot_cred);
        loop_count := loop_count+1;
        if loop_count > 10 then exit;
        end if;
    end loop;
end;
/

