with q17_part as (
  select p.partkey pk
  from part p where  
  p.brand = 'Brand#23'
  and p.container = 'MED BOX'
),
q17_avg as (
  select l.partkey t_pk, 0.2 * avg(l.quantity) as t_avg_quantity
  from lineitem l
  where l.partkey IN (select pk from q17_part)
  group by l.partkey
),
q17_price as (
  select
  l.quantity q,
  l.partkey pk,
  l.extendedprice ep
  from
    lineitem l
  where
    l.partkey IN (select q17_part.pk from q17_part)
)
select cast(sum(q17_price.ep) / 7.0 as decimal(32,2))
from q17_avg, q17_price
where 
q17_avg.t_pk = q17_price.pk and q17_price.q < q17_avg.t_avg_quantity;