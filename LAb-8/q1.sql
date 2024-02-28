set serveroutput on
declare
    raise_amt numeric(8,2);
    tot_amt numeric(8,2);
    cursor c1 is select * from instructor;
    inst instructor%rowtype;
begin
    open c1;
        loop
            fetch c1 into inst;
            raise_amt := (inst.salary)*0.05;
            tot_amt := inst.salary + raise_amt;

            update instructor
            set salary = tot_amt 
            where id=inst.id;

            insert into salary_raise values(inst.id, sysdate, raise_amt);

            dbms_output.put_line('ID : '||inst.id||' Salary : '||inst.salary||' Raised Salary : '||raise_amt||' Total amount : '||tot_amt);
            exit when c1%notfound;
        end loop;
    close c1;


end;
/

