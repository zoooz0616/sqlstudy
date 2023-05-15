create table emp_temp as select * from employees;

delete emp_temp where department_id=20;

savepoint svpnt_del_20;

delete emp_temp where department_id=50;

savepoint svpnt_del_50;

delete emp_temp where department_id=60;

rollback to savepoint svpnt_del_50;

--10¿Â
create table emp_dept50
as select employee_id, first_name, salary*12 as ann_sal, hire_Date
from employees
where department_id=50;

ALTER TABLE emp_dept50
ADD (job VARCHAR2(10));

desc emp_dept50;

alter table emp_dept50
modify(first_name varchar2(30));

alter table emp_dept50
modify(first_name varchar2(10));

alter table emp_dept50
add(job_id varchar2(10));

alter table emp_dept50
drop column job_id;

alter table emp_dept50
rename column job to job_id;

rename emp_dept50 to employees_dept50;


drop table employees_dept50;

truncate table emp2;























