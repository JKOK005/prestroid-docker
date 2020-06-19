select
	100.00 * sum(case
		when p.type like 'PROMO%'
			then l.extendedprice * (1 - l.discount)
		else 0
	end) / sum(l.extendedprice * (1 - l.discount))
from
	lineitem l,
	part p
where
	l.partkey = p.partkey
	and l.shipdate >= cast('1995-08-01' as date)
	and l.shipdate < cast('1995-09-01' as date);