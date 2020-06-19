select
	c.custkey,
	c.name,
	sum(l.extendedprice * (1 - l.discount)) as revenue,
	c.acctbal,
	n.name,
	c.address,
	c.phone,
	c.comment
from
	customer c,
	orders o,
	lineitem l,
	nation n
where
	c.custkey = o.custkey
	and l.orderkey = o.orderkey
	and o.orderdate >= cast('1993-07-01' as date)
	and o.orderdate < cast('1993-10-01' as date)
	and l.returnflag = 'R'
	and c.nationkey = n.nationkey
group by
	c.custkey,
	c.name,
	c.acctbal,
	c.phone,
	n.name,
	c.address,
	c.comment
order by
	revenue desc
limit 20;