CREATE TABLE emp1 AS SELECT * FROM employees;
SELECT count(*) from emp1;

create table emp2 as select * from employees where 1=2;
select count(*) from emp2;

INSERT INTO departments
VALUES(280, 'Data Analytics', null, 1700);

CREATE TABLE MANAGERS As
select * from employees where 1=2;

insert into managers
select * from employees where job_id like '%MAN';

--4
create table emps as select * from employees;

alter table emps
add(constraint emps_emp_id_ppk primary key(employee_id),
constraint emps_manager_id_fk foreign key(manager_id)
references emps(employee_id));

--4.1
select employee_id, first_name, salary
from emps
where employee_id=103;
update emps
set salary=salary*1.1
where employee_id=103;
commit;

--4.2
update emps
set(job_id, salary, manager_id) =
(select job_id, salary, manager_id
from emps
where employee_id = 108)
where employee_id=109;

--5.2
create table depts as
select * from departments;

delete from emps
where department_id=
(select department_id
from depts
where department_name='Shipping');

commit;
rollback;
--5.3
variable emp_name varchar2(50);
variable emp_sal number;
variable;

delete emps
where employee_id=109
returning first_name, salary into :emp_name, :emp_sal;

select * from emps where employee_id=109;

print emp_name;
print emp_sal;

--6
create table emps_it as select * from employees where 1=2;

merge into emps_it a
    using (select * from employees where job_id='IT_PROG') b
    on (a.employee_id = b.employee_id)
when matched then
    update set
        a.phone_number =b.phone_number,
        a.hire_date=hire_date,
        a.job_id = b.job_id,
        a.salary=b.salary,
        a.commission_pct = b.commission_pct,
        a.manager_id = b.manager_id,
        a.department_id = b.department_id
when not matched then
insert values
(b.employee_id, b.first_name, b.last_name, b.email,
b.phone_number, b.hire_date, b.job_id, b.salary,
b.commission_pct, b.manager_id, b.department_id);

--7.1
insert all
into emp1
values (300, 'Kildong', 'Hong', 'KHONG', '011.624.7902',
TO_DATE('2015-05-11','yyyy-mm-dd'), 'IT_PROG', 6000, null, 100, 90)
into emp2
values (400, 'Kilseo', 'Hong', 'KSHONG', '011.324.7952',
TO_DATE('2015-06-20','yyyy-mm-dd'), 'IT_PROG', 5500, null, 100, 90)
SELECT * FROM dual;

create table emp_salary as
select employee_id, first_name, salary, commission_pct 
from employees
where 1=2;

create table emp_hire_date as
select employee_id, first_name, hire_Date, department_id
from employees
where 1=2;

insert all
into emp_salary values
(employee_id, first_name, salary, commission_pct)
into emp_hire_date values
(employee_id, first_name, hire_date, department_id)
select * from employees;

--7.2
create table emp_10 as select * from employees where 1=2;
create table emp_20 as select * from employees where 1=2;

insert all
when department_id=10 then
into emp_10 values
(employee_id, first_name, last_name, email, phone_number,
hire_date, job_id, salary, commission_pct, manager_id, department_id)
when department_id=20 then
into emp_20 values
(employee_id, first_name, last_name, email, phone_number,
hire_date, job_id, salary, commission_pct, manager_id, department_id)
select * from employees;

select * from emp_10;
select * from emp_20;

--7.3
create table emp_sal5000 as
select employee_id, first_name, salary from employees where 1=2;
create table emp_sal10000 as
select employee_id, first_name, salary from employees where 1=2;
create table emp_sal15000 as
select employee_id, first_name, salary from employees where 1=2;
create table emp_sal20000 as
select employee_id, first_name, salary from employees where 1=2;
create table emp_sal25000 as
select employee_id, first_name, salary from employees where 1=2;

insert first
when salary <=5000 then
into emp_sal5000 values(employee_id, first_name, salary)
when salary <=10000 then
into emp_sal10000 values(employee_id, first_name, salary)
when salary <=15000 then
into emp_sal15000 values(employee_id, first_name, salary)
when salary <=20000 then
into emp_sal20000 values(employee_id, first_name, salary)
when salary <=25000 then
into emp_sal25000 values(employee_id, first_name, salary)
select employee_id, first_name, salary from employees;

select count(*) from emp_sal5000; --49
select count(*) from emp_sal10000; --45
select count(*) from emp_sal15000; --12
select count(*) from emp_sal20000; --2
select count(*) from emp_sal25000; --1

--7.4
select * from sales;

select * from sales_log;
create table sales_log as select * from sale_log;

truncate table sales_log;

insert all
into sales_log
values(employee_id, week_id, 'SALES_MON', sales_mon)
into sales_log
values(employee_id, week_id, 'SALES_TUE', sales_tue)
into sales_log
values(employee_id, week_id, 'SALES_WED', sales_wed)
into sales_log
values(employee_id, week_id, 'SALES_THU', sales_thu)
into sales_log
values(employee_id, week_id, 'SALES_FRI', sales_fri)
select employee_id, week_id, sales_mon, sales_tue, sales_wed, sales_thu, sales_fri
from sales;