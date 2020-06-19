select
	o.orderpriority,
	count(*)
from
	orders o
where
	o.orderdate >= cast('1996-05-01' as date)
	and o.orderdate < cast('1996-08-01' as date)
	and exists (
		select
			*
		from
			lineitem l
		where
			l.orderkey = o.orderkey
			and l.commitdate < l.receiptdate
	)
group by
	o.orderpriority
order by
	o.orderpriority;