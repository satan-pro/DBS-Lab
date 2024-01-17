select name, dept_name from student;
select * from instructor where dept_name='Comp. Sci.';
select title from course where credits=3;
select course.course_id, course.title from course, takes where takes.id=12345 and takes.course_id=course.course_id;
select * from instructor where salary between 40000 and 90000;
