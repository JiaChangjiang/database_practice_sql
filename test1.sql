-- Start time:15.08 Changjiang Jia 1971685
-- This is my individual work. I understand there are penalties for plagiarism.

--a
select count(*) from issues where returndate is null;

--b
select mid,count(distinct bid) as "number of distinct books" from issues group by mid
union
select mid,0 as "number of distinct books" from member where mid not in(select mid from issues);
--c
select member.firstname,member.lastname,book.title,issues.issuedate from book,member,issues where authorfirst='Jane' and authorlast='Austen' and book.bid=issues.bid and issues.mid=member.mid order by member.lastname,member.firstname,issues.issuedate;
--d
select mid,bid from reservations where rdate> (current_date-7)
except
select mid,bid from issues where issuedate>(current_date-7);
--e

select issues.mid,issues.bid from issues,(select bid,min(issuedate) as"date" from (select * from issues where bid in (select bid from reservations)) as temp group by bid) as temp1 where issues.bid=temp1.bid and issues.issuedate=temp1.date;
