--6¿Â
select first_name, department_name
from employees, departments
where employees.department_id = departments.department_id;

--2.2
select e.first_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id;

--2.3
select e.first_name, m.first_name
from employees e, employees m
where e.manager_id = m. employee_id and e.employee_id=103;

--2.4
select e.first_name, e.salary, j.job_title
from employees e, jobs j
where e.salary
between j.min_salary and j.max_salary
order by e.first_name;

--2.5
select e.employee_id, e.first_name, e.hire_date,
j.start_date, j.end_date, j.job_id, j.department_id
from employees e, job_history j
where e.employee_id = j.employee_id
order by j.employee_id;
