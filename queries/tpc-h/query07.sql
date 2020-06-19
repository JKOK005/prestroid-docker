with shipping as (
	select
		n1.name as supp,
		n2.name as cust,
		year(l.shipdate) as l_year,
		l.extendedprice * (1 - l.discount) as volume
	from
		supplier s,
		lineitem l,
		orders o,
		customer c,
		nation n1,
		nation n2
	where
		s.suppkey = l.suppkey
		and o.orderkey = l.orderkey
		and c.custkey = o.custkey
		and s.nationkey = n1.nationkey
		and c.nationkey = n2.nationkey
		and (
			(n1.name = 'KENYA' and n2.name = 'PERU')
			or (n1.name = 'PERU' and n2.name = 'KENYA')
		)
	and l.shipdate between cast('1995-01-01' as date) and cast('1996-12-31' as date)
)

select
	supp,
	cust,
	l_year,
	sum(volume) as revenue
from
	shipping
group by
	supp,
	cust,
	l_year
order by
	supp,
	cust,
	l_year;