set serveroutput on
declare 
    gpa float;
    roll_no number;
begin
    roll_no := '&rollno';

    dbms_output.put_line('Enter roll no: '||roll_no);

    select gpa into gpa
    from student1
    where rollno = roll_no;

    dbms_output.put_line('GPA of roll no '||roll_no||' is '||gpa);

end;
/