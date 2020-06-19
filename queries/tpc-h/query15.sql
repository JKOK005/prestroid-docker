with revenue_cached as (
	select
		l.suppkey as sn,
		sum(l.extendedprice * (1 - l.discount)) as tr
	from
		lineitem l
	where
		l.shipdate >= cast('1996-01-01' as date)
		and l.shipdate < cast('1996-04-01' as date)
	group by l.suppkey
),
max_revenue_cached as (
	select
		max(revenue_cached.tr) as max_revenue
	from
		revenue_cached
)	

select
	s.suppkey,
	s.name,
	s.address,
	s.phone,
	revenue_cached.tr
from
	supplier s,
	revenue_cached,
	max_revenue_cached
where
	s.suppkey = revenue_cached.sn
	and revenue_cached.tr = max_revenue_cached.max_revenue 
order by s.suppkey;