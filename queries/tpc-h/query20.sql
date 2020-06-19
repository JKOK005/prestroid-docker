-- explain formatted 
with tmp1 as (
    select p.partkey from part where p.name like 'forest%'
),
tmp2 as (
    select s.name, s.address, s.suppkey
    from supplier s, nation n
    where s.nationkey = n.nationkey
    and n.name = 'CANADA'
),
tmp3 as (
    select l.partkey, 0.5 * sum(l.quantity) as sum.quantity, l.suppkey
    from lineitem l, tmp2
    where l.shipdate >= '1994-01-01' and l.shipdate <= '1995-01-01'
    and l.suppkey = s.suppkey 
    group by l.partkey, l.suppkey
),
tmp4 as (
    select ps.partkey, ps.suppkey, ps.availqty
    from partsupp ps
    where ps.partkey IN (select p.partkey from tmp1)
),
tmp5 as (
select
    ps.suppkey
from
    tmp4, tmp3
where
    ps.partkey = l.partkey
    and ps.suppkey = l.suppkey
    and ps.availqty > sum.quantity
)
select
    s.name,
    s.address
from
    supplier
where
    s.suppkey IN (select ps.suppkey from tmp5)
order by s.name;