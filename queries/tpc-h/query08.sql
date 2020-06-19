with all_nations as (
	select
		year(o.orderdate) as year,
		l.extendedprice * (1 - l.discount) as volume,
		n2.name as nation
	from
		part p,
		supplier s,
		lineitem l,
		orders o,
		customer c,
		nation n1,
		nation n2,
		region r
	where
		p.partkey = l.partkey
		and s.suppkey = l.suppkey
		and l.orderkey = o.orderkey
		and o.custkey = c.custkey
		and c.nationkey = n1.nationkey
		and n1.regionkey = r.regionkey
		and r.name = 'AMERICA'
		and s.nationkey = n2.nationkey
		and o.orderdate between cast('1995-01-01' as date) and cast('1996-12-31' as date)
		and p.type = 'ECONOMY BURNISHED NICKEL'
)
 
select
	year,
	sum(case
		when nation = 'PERU' then volume
		else 0
	end) / sum(volume)
from
	all_nations
group by
	year
order by
	year;