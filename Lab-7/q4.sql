set serveroutput on
declare
    roll_no number;
    gpa float;
    grade char(3);
begin
    roll_no:=1;
    loop
        select gpa into gpa 
        from student1
        where rollno = roll_no;

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

        dbms_output.put_line('Roll no : '||roll_no||' Grade : '||grade);

        roll_no:=roll_no+1;

        if roll_no>5 then exit;
        end if;
    end loop;


end;
/