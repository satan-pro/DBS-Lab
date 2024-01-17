
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

select s.name, c.title, sec.year from student s, course c, section sec, takes t where sec.room_number='100' and s.id=t.id and t.sec_id=sec.sec_id and t.course_id=sec.course_id and c.course_id=sec.course_id;

/* NAME                 TITLE
-------------------- --------------------------------------------------
      YEAR
----------
Peltier              Physical Principles
      2009

Levy                 Image Processing
      2010 */

select distinct s.name, c.course_id, c.title as c_name, t.year from student s, course c, takes t, section sec where t.year='2010' and t.id=s.id and t.course_id=sec.course_id and sec.course_id=c.course_id;

/* 9 rows selected */

select name as inst_salary from instructor where salary > any(select salary from instructor where dept_name='Comp. Sci.');