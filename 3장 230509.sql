--Lower, initcap, upper
select last_name, lower(last_name), initcap(last_name), upper(last_name)
from employees;
select last_name, lower(last_name), initcap(last_name), upper(last_name)
from employees
where lower(last_name)='austin';

--Length, instr
select first_name, length(first_name),instr(first_name,'a')
from employees;
--substr, concat
select first_name, substr(first_name,1,3), concat(first_name, last_name)
from employees;
--LPAD, RPAD
select rpad(first_name,10,'-') as name, lpad(salary,10,'*')as sal
from employees;
--LTRIM, RTRIM
select ltrim('JavaSpecialist','Java') from dual;
select ltrim(' JavaSpecialist') from dual;
select trim( 'JavaSpecialist ') from dual;

--replace, translate
select replace('JavaSpecialist','Java','BigData') from dual;
select replace('Java Specialist',' ','') from dual;
select translate('javaspecialist','abcdefghijklmnopqrstuvwxyz','defghijklmnopqrstuvwxyzabc') from dual;

--실전
select rpad(substr(first_name,1,3),length(first_name),'*') as name,
lpad(salary,10,'*') as salary 
from employees
where lower(job_id) = 'it_prog';


--3.2
Create table test_regexp (col1 varchar2(10));
insert into test_regexp values('ABCDE01234');
insert into test_regexp values('01234ABCDE');
insert into test_regexp values('abcde01234');
insert into test_regexp values('01234abcde');
insert into test_regexp values('1-234-5678');
insert into test_regexp values('234-567890');

select * from test_regexp
where regexp_like(col1,'[0-9][a-z]');

select * from test_regexp
where regexp_like(col1,'[0-9]{3}-[0-9]{4}$');
select * from test_regexp
where regexp_like(col1,'[[:digit:]]{3}-[[:digit:]]{4}$');
select * from test_regexp
where regexp_like(col1,'^[0-9]{3}-[0-9]{4}');


create table qa_master (qa_no varchar(10));

alter table qa_master add constraint qa_no_chk check
(regexp_like(qa_no,
'^[[:alpha:]]{2}-[[:digit:]]{2}-[[:digit:]]{4}$'));

insert into qa_master values('QA-01-0001');
insert into qa_master values('00-01-0001');

--3.3instr함수
insert into test_regexp values('@!=)(9&%$#');
insert into test_regexp values('자바3');

select col1,regexp_instr(col1,'[0-9]') as data1,
regexp_instr(col1,'%') as data2 from test_regexp;


--3.4substr함수
select col1, regexp_substr(col1, '[C-Z]+') from test_regexp;

--3.5 replace 함수
select col1, regexp_replace(col1,'[0-2]+','*')
from test_regexp;


--실전 문제
select first_name, phone_number
from employees
where regexp_like(phone_number,'[0-9]{3}.[0-9]{3}.[0-9]{4}$');

select first_name, 
regexp_replace(phone_number, '[0-9]{4}$','****') as phone,
regexp_substr(phone_number, '[0-9]{4}$') as phone2
from employees;


select round(45.923,2), round(45.923,0), round(45.923,-1) from dual;

select trunc(45.923,2), trunc(45.923), trunc(45.923,-1) from dual;

select sysdate from dual;

--5.1날짜
select first_name, (sysdate-hire_date)/7 as "weeks"
from employees
where department_id=60;


select first_name, sysdate, hire_date, months_between(sysdate, hire_date) as workmonth
from employees
where first_name='Diana';

select first_name, hire_Date, add_months(hire_date, 100)
from employees
where first_name='Diana';

select sysdate, next_day(sysdate,'월')
from dual;

select sysdate, last_day(sysdate) from dual;

select sysdate, round(sysdate), trunc(sysdate) from dual;
select trunc(sysdate, 'Month') from dual;
select trunc(sysdate, 'Year') from dual;
select trunc(to_date('17/03/16'), 'Month') from dual;
select round(to_date('17/03/16'), 'Month') from dual;
select trunc(to_date('17/03/16'), 'Day') from dual;

-- 6.1
select employee_id, first_name, hire_date
from employees
where hire_date='03/06/17';

select employee_id, first_name, department_id
from employees
where department_id='40';

--6.3
select first_name, TO_CHAR(hire_date, 'MM/YY') as hiremonth
from employees
where first_name='Steven';

select first_name, to_char(hire_date, 'YYYY"년" MM"월" DD"일"') as hiredate
from employees;

select first_name,to_char(hire_date, 'fmDdspth "of" Month YYYY fmHH:MI:SS AM',
'NLS_DATE_LANGUAGE=english') as hiredate from employees;

--6.4
select first_name, last_name,to_char(salary, '$999,999') salary
from employees;

select first_name, last_name, salary*0.123456 salary1,
to_char(salary*0.123456, '$999,999.99') salary2
from employees
where first_name='David';

--6.5
select '$5,500'-4000 from dual;
select to_number('$5,500', '$999,999')-4000 from dual;

select first_name, hire_date
from employees
where hire_date=to_date('2003/06/17','YYYY/MM/DD');

select first_name, hire_date
from employees
where hire_date = to_date('2003년06월17일', 'YYYY"년"MM"월"DD"일"');


















