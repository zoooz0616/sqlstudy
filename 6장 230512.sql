SELECT department_id, sum(salary) from employees
group by department_id;
-- 그룹으로 묶어서 그룹 개수만큼
select distinct department_id, sum(salary) over(partition by department_id) as sum
from employees;
-- 행 당 하나씩 결과 반환=>109개

select first_name,department_name
from employees e
left join departments d
on e.department_id = d.department_id;
--3.1
select employee_id, department_name
from employees
cross join departments;

--3.2
select first_name, job_title
from employees
natural join jobs;

select first_name, department_name
from employees
natural join departments;

--3.3
select first_name, department_name
from employees
join departments
using (department_id);


--3.4
select department_name, street_Address, city, state_province
from departments d
join locations l
on d.location_id = l.location_id;


select e.first_name, d.department_name,
l.street_address || ', ' || l.city || ', '||
l.state_province as address
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id;

select e.first_name as name,
d.department_name as department
from employees e
join departments d
on e.department_id = d.department_id
where employee_id = 103;

select e.first_name, d.department_name,
l.street_address || ', ' || l.city || ', '||
l.state_province as address
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
where employee_id=103;

select e.first_name as name,
d.department_name as department
from employees e
join departments d
on e.department_id = d.department_id and employee_id = 103;


select e.first_name, d.department_name,
l.street_address || ', ' || l.city || ', '||
l.state_province as address
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id and employee_id=103;


select e.employee_id, e.first_name, e.hire_date,
j.start_date, j.end_date, j.job_id, j.department_id
from employees e
left outer join job_history j
on e.employee_id = j.employee_id
order by e.employee_id;

--3.5
select department_name, first_name 
from employees e
right join departments d
on d.manager_id = e.employee_id;


--4연습문제
--1
select first_name, department_name, city
from employees e, departments d, locations l
where first_name='John' and e.department_id = d.department_id and d.location_id = l.location_id;

select first_name, department_name, city
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
where first_name = 'John';

--2
select e.employee_id, e.first_name, e.salary, m.first_name, d.department_name
from employees e
join employees m on e.manager_id = m.employee_id
join departments d on m.department_id = d.department_id
where e.employee_id=103;

--3
select e.employee_id, e.first_name, e.salary, m.first_name, m.salary, d.department_name
from employees e, employees m, departments d
where e.manager_id = m.employee_id(+)
and m.department_id = d.department_id(+)
and e.department_id=90;

select e.employee_id, e.first_name, e.salary, m.first_name, m.salary, d.department_name
from employees e
left join employees m on e.manager_id = m.employee_id
left join departments d on m.department_id=d.department_id
where e.department_id = 90;

--4
select e.employee_id, l.city
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
where employee_id=103;

--5
select l.city, j.job_title
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
join employees m on e.manager_id = m.employee_id
join jobs j on m.job_id = j.job_id
where e.employee_id=103;

select * from employees where employee_id=103;

--6
select e.employee_id, e.first_name, e.last_name, e.email, e.phone_number, e.hire_Date, j.job_title, e.salary,
e.commission_pct, m.first_name, m.last_name, d.department_name
from employees e
join jobs j on j.job_id = e.job_id
join employees m on m.employee_id = e.manager_id
join departments d on d.department_id = e. department_id;

--7
select employee_id,
e.first_name, e.department_id, d.department_id
from employees e, departments d
where e.department_id = d.department_id
;












