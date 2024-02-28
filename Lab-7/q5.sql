set serveroutput on
declare
    lgrade varchar2(3);
    roll_no number;
    gpa float;
begin
    -- Alter StudentTable to add LetterGrade column
    roll_no := 1;
    -- Update LetterGrade for each student
    for stud in (select rollno, gpa from student1) loop
        dbms_output.put_line('GPA '||stud.gpa);
        if stud.gpa > 9 then
            lgrade := 'A+';
        elsif stud.gpa > 8 then
            lgrade := 'A';
        elsif stud.gpa > 7 then
            lgrade := 'B';
        elsif stud.gpa > 6 then
            lgrade := 'C';
        elsif stud.gpa > 5 then
            lgrade := 'D';
        elsif stud.gpa > 4 then
            lgrade := 'E';
        else
            lgrade := 'F';
        end if;
        dbms_output.put_line('Lgrade : '||lgrade);
        -- Update LetterGrade for the current student
       update student1 
       set lettergrade=lgrade where rollno=stud.rollno;
    end loop;

    -- Commit the changes
    commit;

    -- Display success message
    dbms_output.put_line('LetterGrade column added and updated successfully.');
end;
/
