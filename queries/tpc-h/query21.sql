-- explain

with l3 as (
	select l.orderkey, count(distinct l.suppkey) as cntSupp
	from lineitem l
	where l.receiptdate > l.commitdate and l.orderkey is not null
	group by l.orderkey
),

location as (
	select s.* from supplier s, nation n where
	s.nationkey = n.nationkey and n.name = 'SAUDI ARABIA'
)

select s.name, count(*) as numwait
from
(
select li.suppkey, li.orderkey
from lineitem li join orders o on li.orderkey = o.orderkey and
                      o.orderstatus = 'F'
     join
     (
     select l.orderkey, count(distinct l.suppkey) as cntSupp
     from lineitem l
     group by l.orderkey
     ) l2 on li.orderkey = l2.orderkey and 
             li.receiptdate > li.commitdate and 
             l2.cntSupp > 1
) l1 join l3 on l1.orderkey = l3.orderkey
 join location s on l1.suppkey = s.suppkey
group by
 s.name
order by
 numwait desc,
 s.name
limit 100;