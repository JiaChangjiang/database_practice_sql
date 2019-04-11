--q3.h
select distinct cid,year from(select cid,year  from lecturing except all(select distinct cid,year from lecturing group by year,cid ))as temp;
--q4.a

select cid, round(avg(numbers)), count(distinct sid)
from lecturing
group by cid
order by avg(numbers);
--q4.b-
select cid,year,count from (select distinct(cid),year,count(cid) from lecturing group by year,cid) as temp where temp.count>1;


--q5.a-
select distinct name from courses where  bc in (select bc from allmarks03);

--q5.b---?
select name from courses where cid in (
select cid from courses,allmarks03  where allmarks03.bc=courses.bc 
except
select cid from lecturing where year=2003
) 
;

--q5.c
select bc,avg(mark) from allmarks05 group by bc having avg(mark)>(select avg(mark) from allmarks05);
--q5.d
select firstname,lastname from staff where sid in (select sid from staff except select sid from lecturing where not numbers=0) ;

--q6.a

select distinct allmarks04.student from allmarks04 where allmarks04.mark<40 and allmarks04.bc='06 02525' ;

--q6.b

select count(distinct allmarks04.student) as "number of students", count(distinct bc) as "number of courses"  from allmarks04 where mark is not null;
--q6.c
select temp1.count*100/temp.count||'%' as "percentage of first class marks" from
(select count(*) from allmarks03 )as temp,
(select count(*) from allmarks03 where mark>=70) as temp1;

                                                                         
