1. Retrieve the birth date and address of the employee(s) whose name is 'John B. 
Smith'. 

select bdate, address from employee where fname like 'John' and minit='B' and lname like 'Smith';

/* BDATE     ADDRESS
--------- ------------------------------
09-JAN-65 731 Fondren, Houston, TX */

2. Retrieve the name and address of all employees who work for the 'Research' department.

select fname, address from employee, department where dname like 'Research' and mgr_ssn = ssn;

/* FNAME           ADDRESS
--------------- ------------------------------
Franklin        638 Voss, Houston, TX */

3. For every project located in 'Stanford', list the project number, the controlling department number, and the department manager's last name, address, and birth date'.

select distinct p.pnumber, d.dnumber, e.lname, e.address, e.bdate from project p, department d, employee e where p.plocation like 'Stafford' and p.dnum=d.dnumber and d.mgr_ssn=e.ssn;

/* PNUMBER    DNUMBER LNAME           ADDRESS                        BDATE
---------- ---------- --------------- ------------------------------ ---------
        10          4 Wallace         291 Berry, Bellaire, TX        20-JUN-41 */

4. For each employee, retrieve the employee first and last name and the first and last name of his or her immediate supervisor.

select Dependent_name, fname, lname from dependent, employee where essn=ssn;

/* DEPENDENT_NAME  FNAME           LNAME
--------------- --------------- ---------------
Michael         John            Smith
Elizabeth       John            Smith
Alice           John            Smith
Theodore        Franklin        Wong
Joy             Franklin        Wong
Alice           Franklin        Wong
Abner           Jennifer        Wallace

7 rows selected. */

5. Make a list of all project numbers for projects that involve an employee whose 
last name is 'Smith', either as a worker or as a manager of the department that
controls the project.

select distinct p.pnumber from project p, works_on w, department d, employee e where (p.dnum=d.dnumber and d.mgr_ssn=e.ssn and e.lname like 'Smith') or (p.pnumber=w.pno and w.essn=e.ssn and e.lname='Smith'); 

/*  PNUMBER
----------
         1
         2 */

6. Show the resulting salaries if every employee working on the 'ProductX' project 
is given a 10 percent raise

select (e.salary*0.1) raised_salary from employee e, department d, project p where p.pname like 'ProductX' and p.dnum=d.dnumber and d.mgr_ssn=e.ssn;

/* RAISED_SALARY
-------------
         4000 */

7. Retrieve a list of employees and the projects they are working on, ordered by 
department and, within each department, ordered alphabetically by last name, then 
first name.

select e.fname, e.lname, p.pname from employee e, project p, department d, works_on w where w.pno=p.pnumber and w.essn=e.ssn and p.dnum=d.dnumber and d.mgr_ssn=e.ssn order by d.dname, e.lname,e.fname;

/* FNAME           LNAME           PNAME
--------------- --------------- ---------------
Jennifer        Wallace         Newbenefits
James           Borg            Reorganization
Franklin        Wong            ProductY
Franklin        Wong            ProductZ */

8. Retrieve the name of each employee who has a dependent with the same first name 
and is the same sex as the employee.

select distinct e.fname from employee e, dependent d where d.sex=e.sex;

/* FNAME
---------------
Joyce
Richard
John
Ahmad
Ramesh
Franklin
Jennifer
Alicia
James

9 rows selected. */

9. Retrieve the names of employees who have no dependents.

select distinct e.fname from employee e where e.ssn not in (select d.essn from dependent d);

/* FNAME
---------------
Richard
Joyce
Ahmad
Ramesh
Alicia
James

6 rows selected. */

10. List the names of managers who have at least one dependent.

select distinct e.fname from employee e, dependent d where e.ssn in (select d.essn from dependent d) and  e.ssn in (select mgr_ssn from department);

/* FNAME
---------------
Franklin
Jennifer */

11. Find the sum of the salaries of all employees, the maximum salary, the minimum 
salary, and the average salary

