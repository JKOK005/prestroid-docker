with profit as (
	select
		n.name as nation,
		year(o.orderdate) as year,
		l.extendedprice * (1 - l.discount) - ps.supplycost * l.quantity as amount
	from
		part p,
		supplier s,
		lineitem l,
		partsupp ps,
		orders o,
		nation n
	where
		s.suppkey = l.suppkey
		and ps.suppkey = l.suppkey
		and ps.partkey = l.partkey
		and p.partkey = l.partkey
		and o.orderkey = l.orderkey
		and s.nationkey = n.nationkey
		and p.name like '%plum%'
)

select
	nation,
	year,
	sum(amount)
from
	profit
group by
	nation,
	year
order by
	nation,
	year desc;