  select c.title from section s,course c where s.semester = 'Fall' and s.year = 2009 and c.course_id = s.course_id
  2  union
  3  select c.title from section s,course c where s.semester = 'Spring' and s.year = 2010 and c.course_id = s.course_id;

/* TITLE
--------------------------------------------------
Intro. to Computer Science
Database System Concepts
Physical Principles
Robotics
Image Processing
Investment Banking
World History
Music Video Production

8 rows selected. */

 
  select c.title from section s,course c where s.semester = 'Fall' and s.year = 2009 and c.course_id = s.course_id
  2  intersect
  3  select c.title from section s,course c where s.semester = 'Spring' and s.year = 2010 and c.course_id = s.course_id;

/* TITLE
--------------------------------------------------
Intro. to Computer Science
 */
 
  select c.title from section s,course c where s.semester = 'Fall' and s.year = 2009 and c.course_id = s.course_id
  2  minus
  3  select c.title from section s,course c where s.semester = 'Spring' and s.year = 2010 and c.course_id = s.course_id;

/* TITLE
--------------------------------------------------
Database System Concepts
Physical Principles */

 
  select title from course where course_id not in(select course_id from takes);

/* TITLE
--------------------------------------------------
Computational Biology
 */
 
  select c.title from section s,course c where s.semester = 'Fall' and s.year = 2009 and c.course_id = s.course_id and c.title in(select c.title from section s,course c where s.semester = 'Spring' and s.year = 2010 and c.course_id = s.course_id);

/* TITLE
--------------------------------------------------
Intro. to Computer Science */

 
  select count(distinct(ID)) from takes where course_id in(select course_id from teaches where ID = '10101');

/* COUNT(DISTINCT(ID))
-------------------
                  6 */

 
  select c.title from section s,course c where s.semester = 'Fall' and s.year = 2009 and c.course_id = s.course_id and c.title not in(select c.title from section s,course c where s.semester = 'Spring' and s.year = 2010 and c.course_id = s.course_id);

/* TITLE
--------------------------------------------------
Database System Concepts
Physical Principles */

 
  select name from student where name in(select name from instructor);

/* NAME
--------------------
Brandt
 */
 
  select name from instructor where salary > some
  2  (select salary from instructor where dept_name = 'Biology');

/* NAME
--------------------
Einstein
Brandt
Wu
Gold
Kim
Singh
Katz

7 rows selected. */

 
  select name from instructor where salary > all
  2  (select salary from instructor where dept_name = 'Biology');

/* NAME
--------------------
Katz
Singh
Kim
Gold
Wu
Brandt
Einstein

7 rows selected. */

 
  select dept_name, avg(salary) from instructor group by dept_name having avg(salary)>=all(select avg(salary) from instructor group by dept_name);

/* DEPT_NAME            AVG(SALARY)
-------------------- -----------
Physics                    91000 */

 
  select dept_name, budget from department where budget<(select avg(salary) from instructor);

/* DEPT_NAME                BUDGET
-------------------- ----------
History                   50000
Physics                   70000 */

 
  select c.title from course c where exists (select c.course_id from section s
  2  where s.semester = 'Fall' and s.year = 2009 and c.course_id = s.course_id)
  3  intersect
  4  select c.title from course c where exists (select c.course_id from section s
  5  where s.semester = 'Spring' and s.year = 2010 and c.course_id = s.course_id);

/* TITLE
--------------------------------------------------
Intro. to Computer Science */

 
  select name from student s where exists (select t.id from takes t, course c where
  2  t.course_id = c.course_id and c.dept_name = 'Biology' and s.id = t.id);


/* NAME
--------------------
Tanaka */

 
  select title from course where course_id in
  2  (select course_id from section where year = 2009
  3  group by course_id having count(course_id)<2);

/* TITLE
--------------------------------------------------
Intro. to Biology
Intro. to Computer Science
Database System Concepts
Intro. to Digital Systems
Physical Principles */

 
  select name,dept_name from student s where 2<=(select count(id) from takes t where s.id=t.id and s.dept_name='Comp. Sci.' group by id);

/* NAME                 DEPT_NAME
-------------------- --------------------
Zhang                Comp. Sci.
Shankar              Comp. Sci.
Williams             Comp. Sci.
Brown                Comp. Sci. */

 
  select dept_name, avg_sal from (select dept_name,avg(salary) avg_sal from instructor group by dept_name having avg(salary)>42000);

/* DEPT_NAME               AVG_SAL
-------------------- ----------
Comp. Sci.           77333.3333
Finance                   85000
Physics                   91000
History                   61000
Biology                   72000
Elec. Eng.                80000

6 rows selected. */