--1.1
select avg(salary),sum(salary),min(salary),max(salary)
from employees
where job_id like 'SA%';

select min(hire_date), max(hire_date)
from employees;

select min(first_name), max(last_name)
from employees;

select max(salary)
from employees;

--1.2
select count(*) from employees;
--null 포함

select count(*) from employees;
select count(commission_pct) from employees;

select sum(salary) as 합계,
round(avg(salary),2) as 평균,
round(stddev(salary),2) as 표준편차,
round(variance(salary),2) as 분산 
from employees;

--1.4
select round(avg(salary*commission_pct),2)as avg_bonus
from employees;
select
round(sum(salary*commission_pct),2) as sum_bonus,
count(*) count,
round(avg(salary*commission_pct),2) as avg_bonus1,
round(sum(salary*commission_pct)/count(*),2) as avg_bonus2
from employees;

select avg(nvl(salary*commission_pct,0))
from employees;

select department_id, avg(salary)
from employees
group by department_id;

select department_id, job_id, sum(salary)
from employees
group by department_id, job_id;


select department_id, count(first_name)
from employees;

select department_id, count(first_name)
from employees
group by department_id;

select department_id, avg(salary)
from employees
group by department_id
having avg(salary) > 2000;

select job_id, avg(salary) payroll
from employees
where job_id not like 'SA%'
group by job_id
having avg(salary) > 8000
order by avg(salary) desc;

--4.grouping sets
select to_char(department_id),round(avg(salary),2)
from employees
group by department_id
union all
select job_id, round(avg(salary),2)
from employees
group by job_id
order by 1;

select department_id, job_id, round(avg(salary),2)
from employees
group by grouping sets(department_id, job_id)
order by department_id, job_id;

select department_id, job_id, manager_id, round(avg(salary),2) as avg_Sal
from employees
group by grouping sets((department_id, job_id),
(job_id, manager_id))
order by department_id, job_id, manager_id;

select department_id,job_id, round(Avg(salary),2), count(*)
from employees
group by rollup(department_id, job_id)
order by department_id, job_id;

select department_id,job_id, round(Avg(salary),2), count(*)
from employees
group by cube(department_id, job_id)
order by department_id, job_id;

select
decode(grouping(department_id), 1, '소계',
to_Char(department_id)) as 부서,
decode(grouping(job_id),1,'소계',job_id) as 직무,
round(avg(salary),2) as 평균,
count(*) as 사원의수
from employees
group by cube(department_id, job_id)
order by 부서, 직무;


select
decode(grouping_id(department_id, job_id),
2, '소계', 3, '합계',
to_char(department_id)) as 부서번호,
decode(grouping_id(department_id, job_id),
1,'소계',3,'합계',
job_id) as 직무,
grouping_id(department_id, job_id) as gid,
round(avg(salary),2) as 평균,
count(*) as 사원수
from employees
group by cube(department_id, job_id)
order by 부서번호, 직무;

--8.연습문제
--1
select job_id, round(avg(salary),2)
from employees
group by job_id;

--2
select department_id, count(*)
from employees
group by department_id;

--3
select department_id, job_id, count(*)
from employees
group by department_id, job_id;

--4
select department_id, round(stddev(salary),2)
from employees
group by department_id;

--5
select department_id, count(*)
from employees
group by department_id
having count(*) > 4;

--6
select job_id, count(*)
from employees
group by department_id, job_id
having department_id = 50;

--7
select job_id, count(*)
from employees
where department_id = 50
group by department_id, job_id
having count(*) <= 10;

--8
select to_char(hire_date,'yyyy') as 입사년도, round(avg(salary),0) as 급여평균, count(*)as 사원수
from employees
group by to_char(hire_date,'yyyy')
order by 입사년도;

--9
select to_char(hire_date,'yyyy') as 입사년도, to_char(hire_date, 'mm')as 입사월, round(avg(salary)) as 급여평균, count(*)as 사원수
from employees
group by rollup(to_char(hire_date,'yyyy'),to_char(hire_date, 'mm'))
order by 입사년도, 입사월;

--10
select
decode(grouping(to_char(hire_date,'yyyy')),1, '소계',to_char(hire_date,'yyyy')) as 입사년도,
decode(grouping_id(to_char(hire_date,'yyyy'), to_char(hire_date,'mm')),1,'소계',3,'합계',to_char(hire_date,'mm'))as 입사월,
round(avg(salary)) as 급여평균,
count(*) as 사원수
from employees
group by cube(to_char(hire_date,'yyyy'), to_char(hire_date,'mm'))
order by 입사년도, 입사월;


select
decode(grouping_id(to_char(hire_date,'yyyy'), to_char(hire_date,'mm')),2, '소계',to_char(hire_date,'yyyy')) as 입사년도,
decode(grouping_id(to_char(hire_date,'yyyy'), to_char(hire_date,'mm')),1,'소계',3,'합계',to_char(hire_date,'mm'))as 입사월,
round(avg(salary)) as 급여평균,
count(*) as 사원수
from employees
group by cube(to_char(hire_date,'yyyy'), to_char(hire_date,'mm'))
order by 입사년도, 입사월;


--11
select 
decode(grouping_id(to_char(hire_date,'yyyy'),to_char(hire_date,'mm')), 2,'소계',3, '합계', to_char(hire_date,'yyyy')) as 입사년도,
decode(grouping_id(to_char(hire_date,'yyyy'),to_char(hire_date,'mm')), 1,'소계',3,'합계',to_char(hire_date,'mm')) as 입사월,
grouping_id(to_char(hire_date,'yyyy'), to_char(hire_date,'mm')) as gid,
round(avg(salary)) as 급여평균,
count(*) as 사원수
from employees
group by cube(to_char(hire_date,'yyyy'), to_char(hire_date,'mm'))
order by 입사년도, 입사월;
