select salary, salary+salary*commission_pct from employees;
--commission이 null인 사람들은 값이 null로 나옴.
select first_name,salary+salary*nvl(commission_pct,0) from employees;

--6.7
select first_name, salary + salary*nvl(commission_pct,0) from employees;

select first_name,
nvl2(commission_pct, salary+salary*commission_pct, salary) as nann_sal
from employees;

select first_name,
coalesce(salary+salary*commission_pct, salary)as ann_sal
from employees;

select coalesce(cellphonemm, hone, office, '연락처')from customer;

select first_name, coalesce(salary*commission_pct,0) as bonus from employees
where salary*commission_pct < 650;

select first_name, coalesce(salary*commission_pct,0) as bonus from employees
where lnnvl(salary*commission_pct >= 650);

--decode
select job_id, salary, 
decode(job_id, 'IT_PROG', salary*1.10,
'FI_MGR', salary*1.15,
'FI_ACCOUNT', salary*1.20,
salary) as revised_sal
from employees;

--case
select job_id, salary,
case job_id when 'IT_PROG' then salary*1.10
when 'FI_MGR' then salary*1.15
when 'FI_ACCOUNT' then salary*1.20
else salary
end as revise_sal
from employees;

select employee_id, salary,
case when salary < 5000 then salary*1.2
when salary < 10000 then salary*1.10
when salary < 15000 then salary*1.05
else salary
end as revised_sal
from employees;

--7.union
select employee_id, first_name from employees where hire_date like '04%'
union all
select employee_id, first_name from employees where department_id=20;


select employee_id, first_name from employees where hire_date like '04%'
intersect
select employee_id, first_name from employees where department_id=20;

select employee_id, first_name from employees where hire_date like '04%'
minus
select employee_id, first_name from employees where department_id=20;

--8.연습문제
--1
select * from employees
where lower(email) like '%lee%';

--2
select first_name, salary, job_id from employees 
where manager_id=103;

--3
select * from employees
where department_id=80 and job_id='SA_MAN'
or
department_id=20 and manager_id=100;

--4
select replace(phone_number,'.','-' ) from employees;
--5
select rpad(first_name||' '||last_name,20,'*') as FULL_name, 
to_char(coalesce(salary+salary*commission_pct, salary),'$0999,999.99') as salary, 
to_char(hire_date,'yyyy-mm-dd') as hire_date,
round(sysdate-hire_date) as work_day
from employees
where job_id='IT_PROG' and salary > 500;

--6
select rpad(first_name||' '||last_name,20,'*') as FULL_name, 
to_char(coalesce(salary+salary*commission_pct, salary),'$099,999.99') as salary, 
to_char(hire_date,'yyyy"년" mm"월" dd"일"') as hire_date,
trunc(months_between(sysdate, hire_date)) as month
from employees
where department_id=30
order by salary desc;
--7
select rpad(first_name||' '||last_name, 17,'*') as 이름,
to_char(salary+salary*commission_pct,'$99,999.99') as 급여
from employees
where department_id=80 and salary>10000
order by salary desc;
--8
select first_name as 이름,
decode(trunc(trunc(months_between(sysdate, hire_date)/12)/5),
1, '1년차',
2, '10년차',
3, '15년차',
'기타') as 근무년수
from employees
where department_id=60;

--9
select hire_date + 1000
from employees
where first_name = 'Lex';
--10
select first_name, hire_date
from employees
where hire_date like '%/05/%';
--11
select first_name, salary,
to_char(hire_date, 'yyyy"년 입사"') as year,
to_char(hire_date,'day') as day,
case when to_number(to_char(hire_date, 'yy')) > =10
then to_char(salary*1.10, '$999,999')
when to_number(to_char(hire_date, 'yy')) >= 5
then to_char(salary, '$999,999')
end as "increasing_salary"
from employees;

--12
select first_name, salary,
to_char(hire_date,'yyyy"년 입사"')as year,
decode(to_char(hire_date,'RR'), '10', salary*1.10,
'05', salary*1.05) as "increasing_salary2"
from employees;

--13
select country_id,
nvl(state_province, country_id) as state 
from locations;