select department_name
from departments d
join employees e on e.department_id = d.department_id
where employee_id=103;

select m.first_name
from employees m
join departments d on d.manager_id=m.employee_id
where d.department_id=60;

select l.city, l.postal_code
from locations l
join departments d on d.location_id=l.location_id
where d.department_name='IT';

select m.first_name
from employees m
join employees e on e.manager_id = m.employee_id
where e.first_name='Alexander' and e.last_name='Hunold';

select l.city
from locations l
join departments d on d.location_id = l.location_id
join employees e on e.department_id = d.department_id
where e.employee_id =107;

--7장 서브쿼리
select first_name, salary
from employees
where salary > (select salary from employees where first_name='Nancy');

select first_name, job_id, hire_date
from employees
where job_id = (select job_id from employees where employee_id=103);

select first_name, salary
from employees
where salary > any (select salary from employees where first_name='David');

select first_name, department_id, job_id
from employees
where department_id in (select department_id
                        from employees
                        where first_name = 'David');
                        
select department_id from employees where first_name='David';

select first_name, salary
from employees a 
where salary > (select avg(salary)
from employees b
where b.department_id = a.department_id);

select first_name, (select department_name from departments d where d.department_id = e.department_id) department_name
from employees e
order by first_name;


select first_name, department_name
from employees e
join departments d on (e.department_id = d.department_id)
order by first_name;

select row_number, first_name, salary
from (select first_name, salary,
row_number() over(order by salary desc) as row_number
from employees)
where row_number between 1 and 10;

select rownum, first_name, salary
from (select first_name, salary from employees
order by salary desc)
where rownum between 1 and 10;


select employee_id,
lpad(' ',3*(level-1)) || first_name || ' ' ||last_name,
level
from employees
start with manager_id is null
connect by prior employee_id = manager_id;

select employee_id,
lpad(' ',3*(level-1)) || first_name || ' ' ||last_name,
level
from employees
start with employee_id=113
connect by prior manager_id=employee_id ;

--연습문제
--1
select * from employees
where manager_id in(select distinct manager_id from employees where department_id=20);
--2
select first_name
from employees
where salary = (select max(salary) from employees);
--3
select rnum, first_name, salary
from (
select first_name, salary, rownum as rnum
from(select first_name, salary from employees order by salary desc))
where rnum between 3 and 5;

select first_name, salary, rownum from employees
order by salary desc;










