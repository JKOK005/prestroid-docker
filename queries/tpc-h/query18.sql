with q18_tmp_cached as (
	select
		l.orderkey as lo,
		sum(l.quantity) as t_sum_quantity
	from
		lineitem l
	where
		l.orderkey is not null
	group by
		l.orderkey
)
select
	c.name,
	c.custkey,
	o.orderkey,
	o.orderdate,
	o.totalprice,
	sum(l.quantity)
from
	customer c,
	orders o,
	q18_tmp_cached t,
	lineitem l
where
	c.custkey = o.custkey
	and o.orderkey = t.lo
	and o.orderkey is not null
	and t.t_sum_quantity > 300
	and o.orderkey = l.orderkey
	and l.orderkey is not null
group by
	c.name,
	c.custkey,
	o.orderkey,
	o.orderdate,
	o.totalprice
order by
	o.totalprice desc,
	o.orderdate 
limit 100;