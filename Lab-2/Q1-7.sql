create table Employee(EmpNo numeric(3), EmpName varchar(20) not null, Gender varchar(1) not null, Salary numeric(6,2) not null, Address varchar(10) not null, DNo numeric(4), Primary key(EmpNo), check(Gender in ('M', 'F')));
create table Department(DeptNo numeric(3), DeptName varchar(3) unique, Location varchar(10), Primary key(DeptNo));
desc Employee
desc Department
alter table Employee add constraint fk_dno foreign key(DNo) references Department(DeptNo);
insert into Department values(62, 'AIML', 'AB5');
insert into Department values(05, 'CSE', 'AB5');
insert into Department values(07, 'ECE', 'AB2');
insert into Department values(53, 'ICT', 'AB3');

insert into Employee values(101, 'Kirtan', 'M', 1000, 'Manipal', 62);
insert into Employee (102, 'abcd', 'F', 200, 'Udupi', 5);
insert into Employee values(103, 'bba', 'F', 432, 'Mangalore', 53);
insert into Employee values(104, 'chntu', 'M', 432, 'Mangalore', 7);

insert into Employee values('104', 'name', 'K', 2453, 'Manipal', 12);
delete from Department1 where DeptNo=5;
alter table Employee drop constraint FK_DNo;
alter table Employee add constraint fk_dno foreign key(DNo) references Department1(DeptNo) on delete cascade;

alter table Employee(salary default 10000);


rename Department to Department1;
