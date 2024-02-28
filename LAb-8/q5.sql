/* Alter StudentTable(refer Lab No. 8 Exercise) by resetting column LetterGrade to 
F. Then write a PL/SQL block to update the table by mapping GPA to the 
corresponding letter grade for each student */

set serveroutput on
declare
    grade varchar2(2);
    cursor c2 is select * from student1;
    stud student1%rowtype;
    gpa student1.gpa%type;
begin
   
    update student1
    set lettergrade='F';

    dbms_output.put_line('LetterGrade set to F');
    
    for stud in c2 loop
      
        gpa := stud.gpa;

        if gpa<=4 then
        grade := 'F';
        elsif gpa<=5 then
            grade := 'E';
        elsif gpa<=6 then 
            grade:='D'; 
        elsif gpa<=7 then
            grade:='C';
        elsif gpa<=8 then 
            grade:='B' ;
        elsif gpa<=9 then 
            grade:='A';
        elsif gpa<=10 then
            grade:='A+';
        end if;

        update student1
        set lettergrade=grade 
        where rollno=stud.rollno;

    end loop;
    dbms_output.put_line('LetterGrade updated');
end;
/