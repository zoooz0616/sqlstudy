select first_name, last_name, salary from employees;

-- 29p
select * from departments;

select department_id, department_name, manager_id, location_id from departments;

--30p
select department_name, location_id from departments;
select location_id, department_name from departments;

--31p
select first_name, hire_date, salary from employees;

--32p
select first_name, last_name, salary, salary+300 from employees;

--33p
select first_name, last_name, salary, salary+salary*0.1 as 인상급여 from employees;

--34p
select first_name, department_id, commission_pct from employees;

--35p
select first_name as 이름, salary 급여 from employees;
select first_name "Employee Name", salary*12 "Annual Salary" from employees;

--36p
select first_name || ' ' || last_name || '''s salary is &' || salary as "Employee Details" from employees;

--37p
select department_id from employees;
select distinct department_id from employees;

--38p
select rowid, rownum, employee_id, first_name from employees;
