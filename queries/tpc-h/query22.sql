with q22_customer_tmp_cached as (
	select
		c.acctbal,
		c.custkey,
		substr(c.phone, 1, 2) as cntrycode
	from
		customer c
	where
		substr(c.phone, 1, 2) = '13' or
		substr(c.phone, 1, 2) = '31' or
		substr(c.phone, 1, 2) = '23' or
		substr(c.phone, 1, 2) = '29' or
		substr(c.phone, 1, 2) = '30' or
		substr(c.phone, 1, 2) = '18' or
		substr(c.phone, 1, 2) = '17'
),
q22_customer_tmp1_cached as (
	select
		avg(c.acctbal) as avg_acctbal
	from
		q22_customer_tmp_cached c
	where
		c.acctbal > 0.00
),
q22_orders_tmp_cached as (
	select
		o.custkey
	from
		orders o
	group by
		o.custkey
),
ct2 as (
	select
		cntrycode ccode,
		ct.acctbal acctbal
	from
		q22_orders_tmp_cached ot right join q22_customer_tmp_cached ct
		on ct.custkey = ot.custkey
	where
		ct.custkey is null
)
select
	ct3.ccode,
	count(1) as numcust,
	sum(ct3.acctbal) as totacctbal
from (
	select
		ct2.ccode ccode,
		ct2.acctbal acctbal,
		ct1.avg_acctbal avg_acctbal
	from
		q22_customer_tmp1_cached ct1 join ct2
		on ct1.avg_acctbal = ct2.acctbal
	) ct3
where
	ct3.acctbal > ct3.avg_acctbal
group by
	ct3.ccode
order by
	ct3.ccode;