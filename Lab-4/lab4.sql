1. Find the number of students in each course.

select course_id, count(id) from takes group by course_id;

/* COURSE_I  COUNT(ID)
-------- ----------
HIS-351           1
EE-181            1
CS-101            7
CS-347            2
FIN-201           1
CS-319            2
BIO-101           1
PHY-101           1
CS-315            2
CS-190            2
MU-199            1

COURSE_I  COUNT(ID)
-------- ----------
BIO-301           1

12 rows selected. */

2. Find those departments where the no of students is atleast average number of students across all department

SELECT dept_name, COUNT(ID) count FROM student GROUP BY dept_name HAVING COUNT(ID) > 10

3. Find the total number of courses in each department

select dept_name, count(course_id) count from course group by dept_name;

/* DEPT_NAME                 COUNT
-------------------- ----------
Elec. Eng.                    1
Physics                       1
Comp. Sci.                    5
Finance                       1
Biology                       3
History                       1
Music                         1

7 rows selected. */

4. Find the names and average salaries of all departments whose average salary is greater than 42000.

select dept_name, avg(salary) from instructor group by dept_name having avg(salary)>42000;

/* DEPT_NAME            AVG(SALARY)
-------------------- -----------
Elec. Eng.                 80000
Physics                    91000
Comp. Sci.            77333.3333
Finance                    85000
Biology                    72000
History                    61000

6 rows selected. */

5. Find the enrolment of each section that was offered in Spring 2009.

select sec_id, course_id, count(id) from takes where year=2009 and semester='Spring' group by sec_id, course_id;

/* SEC_ID   COURSE_I  COUNT(ID)
-------- -------- ----------
1        EE-181            1
2        CS-190            2 */

6. List all the courses with prerequisite courses, then display course id in increasing order.

select course_id, title from course where course_id in(select course_id from prereq) order by(course_id) asc;

/* COURSE_I TITLE
-------- --------------------------------------------------
BIO-301  Genetics
BIO-399  Computational Biology
CS-190   Game Design
CS-315   Robotics
CS-319   Image Processing
CS-347   Database System Concepts
EE-181   Intro. to Digital Systems

7 rows selected. */

7. Display the details of instructors sorting the salary in decreasing order.

select * from instructor order by(salary) desc;

/* ID    NAME                 DEPT_NAME                SALARY
----- -------------------- -------------------- ----------
22222 Einstein             Physics                   95000
83821 Brandt               Comp. Sci.                92000
12121 Wu                   Finance                   90000
33456 Gold                 Physics                   87000
98345 Kim                  Elec. Eng.                80000
76543 Singh                Finance                   80000
45565 Katz                 Comp. Sci.                75000
76766 Crick                Biology                   72000
10101 Srinivasan           Comp. Sci.                65000
58583 Califieri            History                   62000
32343 El Said              History                   60000

ID    NAME                 DEPT_NAME                SALARY
----- -------------------- -------------------- ----------
15151 Mozart               Music                     40000

12 rows selected. */

8. Find the maximum total salary across the departments.

select max(s) from (select sum(salary) s from instructor group by dept_name);

   /*  MAX(S)
----------
    232000 */

9. Find the average instructors salaries of those departments where the average 
salary is greater than 42000.

select dept_name, avgsalary from (select dept_name, avg(salary) avgsalary from instructor group by dept_name) where avgsalary>42000;

/* DEPT_NAME             AVGSALARY
-------------------- ----------
Elec. Eng.                80000
Physics                   91000
Comp. Sci.           77333.3333
Finance                   85000
Biology                   72000
History                   61000

6 rows selected. */

10. Find the sections that had the maximum enrolment in Spring 2010

select sec_id, course_id, count(id) from takes where year=2010 and semester='Spring' group by sec_id, course_id having count(id)=(select max(c) from (select sec_id, count(id) c from takes where year=2010 and semester='Spring' group by sec_id, course_id));

/* SEC_ID   COURSE_I  COUNT(ID)
-------- -------- ----------
1        CS-315            2 */

11. Find the names of all instructors who teach all students that belong to 'CSE' department.

select name from instructor where id in(select id from teaches where course_id in(select course_id from takes where id in(select id from student where dept_name='Comp. Sci.') group by course_id having count(id) = (select count(id) from student where dept_name='Comp. Sci.')));

/* NAME
--------------------
Srinivasan
Katz */

12. Find the average salary of those department where the average salary is greater than 50000 and total number of instructors in the department are more than 5.

 select dept_name, avg(salary) from instructor group by dept_name having avg(salary)>50000 and count(id)>2;

/* DEPT_NAME            AVG(SALARY)
-------------------- -----------
Comp. Sci.            77333.3333 */

13. Find all departments with the maximum budget.

with m(budget) as (select max(budget) from department) select d.dept_name, d.budget from department d, m where d.budget=m.budget;

/* DEPT_NAME                BUDGET
-------------------- ----------
Finance                  120000 */

14. Find all departments where the total salary is greater than the average of the total salary at all departments

WITH totavg(sal) AS (SELECT AVG(salary) FROM 
(SELECT SUM(salary) salary FROM instructor GROUP BY dept_name))
SELECT dept_name, SUM(salary) totalsalary FROM instructor GROUP BY dept_name
HAVING SUM(salary) > (SELECT sal FROM totavg);

/* DEPT_NAME            TOTALSALARY
-------------------- -----------
Physics                   182000
Comp. Sci.                232000
Finance                   170000 */

15. 



