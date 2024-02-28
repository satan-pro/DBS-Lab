set serveroutput on
declare
    roll_no number;
    max_gpa float;
begin
    -- Alter StudentTable to add LetterGrade column
    roll_no := 1;

    select gpa into max_gpa
    from student1
    where rollno=roll_no;

    for stud in (select rollno, gpa from student1) loop
       
        if stud.gpa>max_gpa then
            max_gpa := stud.gpa;
            roll_no := stud.rollno;
        end if;  
    end loop;
  
    dbms_output.put_line('Max GPA : '||max_gpa||' Roll no : '||roll_no);
end;
/