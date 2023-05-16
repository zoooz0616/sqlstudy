desc user_constraints;
select constraint_name, constraint_type, status 
from user_constraints;

--12장
select * from user_views;

--2.1
select * from user_role_privs;
select * from user_sys_privs;

--2.2
create view emp_view_dept60
as select employee_id, first_name, last_name, job_id, salary
from employees
where department_id=60;
select * from emp_view_dept60;
drop view emp_view_dept60;

create view emp_dept60_salary
as select
employee_id as empno,
first_name || ' ' || last_name as anme,
salary as monthly_salary
from employees
where department_id=60;

select * from emp_dept60_salary;

--2.3
select * from user_views;

--2.4
create or replace view emp_dept60_salary
as select
employee_id as empno,
first_name||' '||last_name as name,
job_id job,
salary
from employees
where department_id=60;

desc emp_dept60_salary;

--2.5
create view emp_view
as select
e.employee_id as id,
e.first_name as name,
d.department_name as department,
j.job_title as job
from employees e
left join departments d on e.department_id=d.department_id
join jobs j on e.job_id=j.job_id;

select * from emp_view;

--2.6
drop view emp_dept60_salary;

--3.1
create table emps as select * from employees;

--drop table emps;

--3.1
create or replace view emp_dept60
as select * from emps where department_id=60;

delete from emp_dept60 where employee_id=104;
select * from emps where employee_id=104;

create or replace view emp_dept60
as select distinct * from emps where department_id=60;

delete from emp_dept60 where employee_id=60;

create or replace view emp_dept60
as select
employee_id,
first_name||' '||last_name as name,
salary*12 as annual_Salary
from emps where department_id=60;

update emp_dept60 set annual_salary=annual_salary*1.1
where employee_id=106;

delete from emp_dept60 where employee_id=106;

create or replace view emp_dept60
as select
employee_id,
first_name,
last_name,
email,
salary
from emps where department_id=60;

insert into demp_dept60
values(500,'JinKyoung','Heo', 'HEOJK',8000);

create or replace view emp_dept60
as select employee_id, first_name, hire_Date, salary, department_id
from emps
where department_id=60
with check option;

update emp_dept60
set department_id=10
where employee_id=105;

create or replace view emp_dept60
as select employee_id, first_name, hire_Date, salary, department_id
from emps
where department_id=60
with read only;

delete from emp_dept60
where employee_id=105;

--4
select row_number, first_name, salary
from ( select first_name,salary,
row_number() over(order by salary desc) as row_number
from employees)
where row_number between 1 and 10;

--연습문제
create or replace view sal_gap_view_by_job
as select 
e.first_name, e.job_id, round(j.avg_sal - e.salary) as job_sal_gap 
from employees e
join (select job_id, (max_salary+min_salary)/2 as avg_sal
from jobs) j
on e.job_id=j.job_id;

select * from sal_gap_view_by_job;

create or replace view emp_view
as select
e.employee_id, e.first_name, d.department_name, j.job_title
from employees e
join departments d on e.department_id = d.department_id
join jobs j on e.job_id = j.job_id;

select * from emp_view;














