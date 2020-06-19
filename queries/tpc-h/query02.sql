with q2_min_ps_supplycost as (
select
	p.partkey as partkey,
	min(ps.supplycost) as supplycost
from
	part p,
	partsupp ps,
	supplier s,
	nation n,
	region r
where
	p.partkey = ps.partkey
	and s.suppkey = ps.suppkey
	and s.nationkey = n.nationkey
	and n.regionkey = r.regionkey
	and r.name = 'EUROPE'
group by
	p.partkey
) 
select
	s.acctbal,
	s.name,
	n.name,
	p.partkey,
	p.mfgr,
	s.address,
	s.phone,
	s.comment
from
	part p,
	partsupp ps,
	supplier s,
	nation n,
	region r,
	q2_min_ps_supplycost
where
	p.partkey = ps.partkey
	and s.suppkey = ps.suppkey
	and p.size = 37
	and p.type like '%COPPER'
	and s.nationkey = n.nationkey
	and n.regionkey = r.regionkey
	and r.name = 'EUROPE'
	and ps.supplycost = q2_min_ps_supplycost.supplycost
	and p.partkey = q2_min_ps_supplycost.partkey
order by
	s.acctbal desc,
	n.name,
	s.name,
	p.partkey
limit 100;