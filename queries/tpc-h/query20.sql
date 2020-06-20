-- explain formatted 
with tmp1 as (
    select p.partkey from part p where p.name like 'forest%'
),
tmp2 as (
    select s.name, s.address, s.suppkey
    from supplier s, nation n
    where s.nationkey = n.nationkey
    and n.name = 'CANADA'
),
tmp3 as (
    select l.partkey, 0.5 * sum(l.quantity) as sq, l.suppkey
    from lineitem l, tmp2
    where l.shipdate >= cast('1994-01-01' as date) and l.shipdate <= cast('1995-01-01' as date)
    and l.suppkey = tmp2.suppkey 
    group by l.partkey, l.suppkey
),
tmp4 as (
    select ps.partkey, ps.suppkey, ps.availqty
    from partsupp ps
    where ps.partkey IN (select tmp1.partkey from tmp1)
),
tmp5 as (
select
    tmp4.suppkey
from
    tmp4, tmp3
where
    tmp4.partkey = tmp3.partkey
    and tmp4.suppkey = tmp3.suppkey
    and tmp4.availqty > tmp3.sq
)
select
    s.name,
    s.address
from
    supplier s
where
    s.suppkey IN (select tmp5.suppkey from tmp5)
order by s.name;