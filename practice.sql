/* Find all departments where the total salary is greater than the average of the total salary at all departments (without using with clause) */

select dept_name, sum(salary) as dept_salary
from instructor
group by dept_name
having sum(salary) >= (select avg(sum_salary) 
                            from (select sum(salary) sum_salary 
                                    from instructor 
                                    group by dept_name));

                                    
select distinct s.name, title, year 
from student s, takes join (select c.title, s.year, c.course_id 
                                from course c, section s 
                                where c.course_id in (select course_id from section join classroom using (room_number) 
                                where room_number=100)) using (course_id, year) 
                                where s.id = takes.id;

select distinct s.name, t.course_id 
from student s, takes t 
where s.id=t.id and t.year=2010 and 
t.course_id in (select course_id from course);

select name, salary as inst_salary from instructor
where salary > some(select salary from instructor where dept_name='Comp. Sci.');

select title, course_id
from takes join course using (course_id)
where semester = 'Fall' and year=2009
except
select title, course_id
from takes join course using (course_id)
where semester = 'Spring' and year=2010;

select course_id from course 
except 
select course_id 
from takes join course using(course_id);

select distinct title, course_id
from takes join course using (course_id)
where semester = 'Fall' and year=2009 
and course_id in (select course_id
from takes join course using (course_id)
where semester = 'Spring' and year=2010);

select count(distinct(id)) as no_of_studs
from takes 
where course_id in (select course_id
                        from teaches
                        where id=10101);

select count(distinct(id)) as no_of_studs
from takes join (select course_id 
                        from teaches 
                        where id=10101) 
                        using (course_id);

select distinct title, course_id
from takes join course using (course_id)
where semester = 'Fall' and year=2009
and course_id not in (select course_id 
from takes join course using(course_id)
where semester='Spring' and year=2010);

select name from student join instructor using (name);

select name from instructor
where salary > some(select salary from instructor where dept_name='Biology');

select name from instructor
where salary> all(select salary from instructor
                        where dept_name='Biology');

select dept_name, avg(salary)
from instructor
group by dept_name
having avg(salary) >= all(select avg(salary)
                                from instructor
                                group by dept_name);

select dept_name, budget
from department 
where budget < (select avg(salary) from instructor);

select distinct title, course_id
from takes join course using (course_id)
where semester = 'Fall' and year=2009
and exists (select course_id 
from takes join course using(course_id)
where semester='Spring' and year=2010);

select s.name from student s, takes T
where s.id=t.id 
and not exists ((select course_id from course
                        where dept_name='Biology')
                        except
                        (select course_id from (course join takes using(course_id)) 
                        join student using (id)));

select title from course
where course_id in (select course_id from section
        where year=2009
        group by course_id
        having count(course_id)<2);

select count(course_id) from course
where dept_name='Comp. Sci.'
group by dept_name;

select id, count(course_id)
from (student join department using (dept_name)) join takes using (id)
where dept_name='Comp. Sci.'
group by id
having count(course_id)>=2;

select name from student 
where id in (select id
from (student join department using (dept_name)) join takes using (id)
where dept_name='Comp. Sci.'
group by id
having count(course_id)>=2);

select dept_name, avg(salary) as avg_sal
from instructor
group by dept_name
having avg(salary) > 42000;

select course_id, count(id)
from student join takes using(id)
group by course_id;

select dept_name, count(id) as num_stud
from student 
group by dept_name;

select avg(count(id)) from student
group by dept_name;

select dept_name, count(id)
from student
group by dept_name
having count(id) >= (select avg(count(id)) from student
group by dept_name);

select dept_name, count(course_id)
from course
group by dept_name;

select dept_name, avg(salary)
from instructor
group by dept_name 
having avg(salary)>42000;

select sec_id, count(id)
from takes
where semester='Spring' and year=2009
group by sec_id;

select prereq_id , course_id 
from prereq
order by course_id asc;

select name, salary
from instructor 
order by salary desc;

select sum(salary) as sum
from instructor
group by dept_name;

select max(sum)
from (select sum(salary) as sum
from instructor
group by dept_name);

select dept_name, avg(salary)
        from instructor
        group by dept_name
        having avg(salary)>42000;

select sec_id 
from takes
group by sec_id
having count(id) >= all(select count(id)
                        from takes
                        group by sec_id);

select i.name from instructor i
where i.id in (select id from teaches 
                where course_id in (select course_id from takes
                                        where id in (select id from student
                                        where dept_name='Comp. Sci.')));

select avg(salary)
from instructor
group by dept_name;

select avg(salary)
from instructor
group by dept_name
having count(id)>=2 and avg(salary) > 50000;

