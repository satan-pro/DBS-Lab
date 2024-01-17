14
select distinct instructor.id from instructor, teaches where instructor.id=teaches.id;

/* ID
-----
22222
12121
76766
83821
10101
15151
32343
45565
98345 */

15
select s.name, c.title, sec.year from student s, course c, section sec, takes t where sec.room_number='100' and s.id=t.id and t.sec_id=sec.sec_id and t.course_id=sec.course_id and c.course_id=sec.course_id;

/* NAME                 TITLE
-------------------- --------------------------------------------------
      YEAR
----------
Peltier              Physical Principles
      2009

Levy                 Image Processing
      2010 */

16
select distinct s.name, c.course_id, c.title as c_name, t.year from student s, course c, takes t, section sec where t.year='2010' and t.id=s.id and t.course_id=sec.course_id and sec.course_id=c.course_id;

/* 9 rows selected */

17
select i.name, i.salary as inst_salary from instructor i where i.salary > any(select salary from instructor where dept_name='Comp. Sci.');

/* NAME                 INST_SALARY
-------------------- -----------
Einstein                   95000
Brandt                     92000
Wu                         90000
Gold                       87000
Kim                        80000
Singh                      80000
Katz                       75000
Crick                      72000

8 rows selected. */

18
select name from instructor where dept_name like '%na%';

/* NAME
--------------------
Wu
Singh */

19
select name, length(name) from student; 

/* NAME                 LENGTH(NAME)
-------------------- ------------
Zhang                           5
Shankar                         7
Brandt                          6
Chavez                          6
Peltier                         7
Levy                            4
Williams                        8
Sanchez                         7
Snow                            4
Brown                           5
Aoi                             3

NAME                 LENGTH(NAME)
-------------------- ------------
Bourikas                        8
Tanaka                          6

13 rows selected. */

20
select dept_name, substr(dept_name,3,3) from department;

/* DEPT_NAME            SUB
-------------------- ---
Biology              olo
Comp. Sci.           mp.
Elec. Eng.           ec.
Finance              nan
History              sto
Music                sic
Physics              ysi

7 rows selected. */

21
select upper(name) as name from instructor;

/* NAME
--------------------
SRINIVASAN
WU
MOZART
EINSTEIN
EL SAID
GOLD
KATZ
CALIFIERI
SINGH
CRICK
BRANDT

NAME
--------------------
KIM

12 rows selected. */

23
select salary, round(salary, -2) as rounded_salary from instructor;

/* SALARY ROUNDED_SALARY
---------- --------------
     65000          65000
     90000          90000
     40000          40000
     95000          95000
     60000          60000
     87000          87000
     75000          75000
     62000          62000
     80000          80000
     72000          72000
     92000          92000

    SALARY ROUNDED_SALARY
---------- --------------
     80000          80000

12 rows selected. */
