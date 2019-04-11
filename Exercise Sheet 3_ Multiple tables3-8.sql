--8.a
select  distinct companies.name from companies,shares where shares.cid=companies.cid and shares.price >500 ;
--8.b
select companies.name,max(shares.price) from companies,shares where companies.cid=shares.cid group by companies.name;
--8.c
select companies.name,min(shares.date) from shares,companies,(select companies.name,max(shares.price) from companies,shares where companies.cid-shares.cid group by companies.name) as temp where companies.name=temp.name and companies.cid=shares.cid and temp.max=shares.price group by companies.name having 
--8.d
select companies.name from shares,companies,(select cid,price from shares where day='1 January 2006' order by cid ) as temp1 ,(select cid,price from shares where day='31 December 2006' order by cid) as temp2 where temp1.cid=temp2.cid and temp1.cid=companies.cid and  ((temp2.price-temp1.price)/temp1.price >0.2);

