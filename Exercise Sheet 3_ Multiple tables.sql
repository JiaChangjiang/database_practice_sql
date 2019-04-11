--6.d
select allmarks03.bc,courses.name,avg(allmarks03.mark),avg(allmarks04.mark) from courses,allmarks03,allmarks04 where allmarks03.bc=courses.bc  and courses.bc=allmarks04.bc and allmarks03.bc=allmarks04.bc group by allmarks03.bc,allmarks04.bc,courses.name;

select courses.name,avg(allmarks03.mark),avg(allmarks04.mark) from courses,allmarks03,allmarks04 where allmarks03.bc=courses.bc  and
courses.bc=allmarks04.bc and allmarks03.bc=allmarks04.bc group by courses.name;

--6.e

select courses.name,avg(allmarks03.mark),avg(allmarks04.mark) from courses,allmarks03,allmarks04,( select lecturing.cid from( select
lecturing.cid from lecturing where lecturing.numbers>100 and year=2003) as temp1,lecturing   where(lecturing.numbers>100 and
lecturing.year=2004) and temp1.cid=lecturing.cid) as temp  where allmarks03.bc=courses.bc  and courses.bc=allmarks04.bc and
allmarks03.bc=allmarks04.bc and courses.cid=temp.cid  group by courses.name;


--7a-
select courses.name,count( distinct allmarks03.student),avg(allmarks03.mark),max(allmarks03.mark),min(allmarks03.mark),stddev(allmarks03.mark) from courses,allmarks03 where courses.bc=allmarks03.bc group by courses.name order by courses.name;
 
--7.b
select courses.name,lect1.numbers,lect2.numbers from lecturing as lect1,lecturing as lect2,courses where lect1.year=2002 and lect2.year=2003 and lect1.cid=lect2.cid and courses.cid=lect1.cid and lect1.numbers <lect2.numbers;
--7.c
select temp1.bc,temp1.avg as "all average mark",temp2.avg as "average passing test" from (select bc,avg(mark) from allmarks04 group by bc ) as temp1,(select bc,avg(mark) from allmarks04 where mark >40 group by bc ) as temp2 where temp1.bc=temp2.bc;
 
--7.d
select  courses.name, 100*temp.count/temp1.count||'%'  as "failure rate" from  (select bc, count(*) from allmarks04 where mark<40
group by bc order by bc) as temp,(select bc,count(*) from allmarks04 group by bc order by bc) as temp1,courses where temp1.bc=temp.bc
and temp1.bc=courses.bc;
--7.e
select firstname,lastname,office from staff where office in (select office from staff group by office having count(*)>1) order by
office;
--7.f
 select lecturing.sid,staff.firstname,staff.lastname ,temp.year,temp.max from (select year,max(numbers) from lecturing group by year)as temp,lecturing,staff where lecturing.numbers =temp.max and lecturing.year=temp.year and staff.sid=lecturing.sid order by
year;



