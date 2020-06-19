select
	l.shipmode,
	sum(case
		when o.orderpriority = '1-URGENT'
			or o.orderpriority = '2-HIGH'
			then 1
		else 0
	end),
	sum(case
		when o.orderpriority <> '1-URGENT'
			and o.orderpriority <> '2-HIGH'
			then 1
		else 0
	end)
from
	orders o,
	lineitem l
where
	o.orderkey = l.orderkey
	and l.shipmode in ('REG AIR', 'MAIL')
	and l.commitdate < l.receiptdate
	and l.shipdate < l.commitdate
	and l.receiptdate >= cast('1995-01-01' as date)
	and l.receiptdate < cast('1996-01-01' as date)
group by
	l.shipmode
order by
	l.shipmode;