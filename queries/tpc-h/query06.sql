select
	sum(l.extendedprice * l.discount) as revenue
from
	lineitem l
where
	l.shipdate >= cast('1993-01-01' as date)
	and l.shipdate < cast('1994-01-01' as date)
	and l.discount between 0.06 - 0.01 and 0.06 + 0.01
	and l.quantity < 25;