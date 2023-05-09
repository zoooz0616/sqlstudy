SELECT first_name, job_id, department_id
FROM employees
WHERE job_id = 'IT_PROG';

SELECT first_name, hire_date
FROM employees
WHERE last_name='King';

--2004년 이후 입사한 사원
SELECT first_name, salary, hire_date
FROM employees
WHERE hire_date >= '04/01/01';

-- 2004년에 입사한 사원
SELECT first_name, salary, hire_date
FROM employees
WHERE hire_date BETWEEN '04/01/01' AND '04/12/31';

SELECT employee_id, first_name, salary, manager_id
FROM employees
WHERE manager_id IN(101, 102, 103);

--부서 20,30,40에 속한 사원

SELECT first_name, job_id, department_id
FROM employees
WHERE department_id IN(20,30,40);

--LIKE연산
SELECT first_name, last_name, job_id, department_id
FROM employees
WHERE job_id LIKE 'IT_%';

SELECT first_name, manager_id
FROM employees
WHERE manager_id IS NULL;

SELECT first_name, job_id, commission_pct
from employees
where commission_pct is null;

SELECT first_name, job_id, commission_pct
from employees
where commission_pct is not null;

--논리 연산
select first_name, job_id, salary
from employees
where job_id ='IT_PROG'
OR job_id = 'FI_MGR'
AND salary>=6000;

--데이터 정렬
select first_name, hire_date
from employees
order by hire_date;

select first_name, hire_date from employees
order by hire_date desc;

select first_name, salary*12 as annsal
from employees
order by annsal;

select first_name, salary*12 as annsal
from employees
order by 2;

--연습문제
---1
select employee_id, first_name, hire_date, salary
from employees;
--2
select first_name ||' '|| last_name as name
from employees;
--3
select * from employees where department_id=50;
--4
select first_name, department_id, job_id from employees where department_id=50;
--5
select first_name, department_id, salary, salary+300 from employees;
--6
select first_name, salary from employees where salary>10000;
--7
select first_name, job_id, commission_pct from employees
where commission_pct is not null;
--8
select first_name, hire_date,salary from employees
where hire_date between '03/01/01' and '03/12/31';
--9
select first_name,hire_date, salary
from employees
where hire_date like '03%';
--10
select first_name, salary from employees
order by salary desc;
--11
select first_name, salary from employees
where department_id=60
order by salary desc;
--12
select first_name, job_id
from employees
where job_id in('IT_PROG', 'SA_MAN');
--13
select first_name||' '||last_name||' 사원의 급여는 '||salary||'달러입니다.'
from employees
where last_name='King' and first_name='Steven';
--14
select first_name, job_id from employees
where job_id like '%MAN';
--15
select first_name, job_id from employees
where job_id like '%MAN'
order by job_id;