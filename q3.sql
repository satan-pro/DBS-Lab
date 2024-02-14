set serveroutput on
declare
    issue_date date;
    return_date date;
    fine number;
    date_diff number;
begin
    issue_date:='&issue_date';
    return_date:='&return_date';

    dbms_output.put_line('Enter issue date : '||issue_date);
    dbms_output.put_line('Enter return date : '||return_date);

    date_diff:=(return_date-issue_date);
    dbms_output.put_line('Date diff : '||date_diff);
    if date_diff<=6 then
        fine:=0;
    elsif date_diff<=14 then
        fine:=(date_diff-6)*1;
    elsif date_diff<=29 then
        fine:=((date_diff-14)*2)+7;
    elsif date_diff>30 then
        fine:=((date_diff-29)*5)+30+7;
    end if;

    dbms_output.put_line('Fine : '||fine);

end;
/