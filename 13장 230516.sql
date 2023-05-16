--13¿Â

select sequence_name, min_value, max_value, increment_by, last_number
from user_sequences;

create sequence depts_seq
start with 91
increment by 1
maxvalue 100
nocycle
nocache;

drop table depts cascade constraints;

create table depts(
deptno number(2),
dname varchar2(14),
loc varchar2(13),
constraint depts_dname_uk unique(dname),
constraint depts_deptno_pk primary key(deptno)
);

insert into depts(deptno, dname, loc)
values (depts_seq.NEXTVAL, 'MARKETING', 'SAN DIEGO');
select * from depts;
select depts_seq.currval
from dual;

alter sequence depts_seq
maxvalue 99999;

--2.1
drop table emps;
create table emps as select * from employees;

select * from emps where first_name='David';

create index emps_first_name_idx
on emps(first_name);

DROP INDEX emps_first_name_idx;