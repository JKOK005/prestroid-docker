select
	cm.count,
	count(*) as custdist
from
	(
		select
			c.custkey,
			count(o.orderkey) as count
		from
			customer c left outer join orders o on
				c.custkey = o.custkey
				and o.comment not like '%unusual%accounts%'
		group by
			c.custkey
	) cm
group by
	cm.count
order by
	custdist desc,
	cm.count desc;