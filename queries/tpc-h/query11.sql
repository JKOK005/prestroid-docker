with q11_part_tmp_cached as (
	select
		ps.partkey part_key,
		sum(ps.supplycost * ps.availqty) as part_value
	from
		partsupp ps,
		supplier s,
		nation n
	where
		ps.suppkey = s.suppkey
		and s.nationkey = n.nationkey
		and n.name = 'GERMANY'
	group by ps.partkey
), 
q11_sum_tmp_cached as (
	select
		sum(part_value) as total_value
	from
		q11_part_tmp_cached
),
merged as (
	select
		q11_part_tmp_cached.part_key as pk,
		q11_part_tmp_cached.part_value as pv,
		q11_sum_tmp_cached.total_value as tv
	from
		q11_part_tmp_cached left join q11_sum_tmp_cached
	ON 
		q11_part_tmp_cached.part_value = q11_sum_tmp_cached.total_value
)
select
	merged.pk, 
	merged.pv
from 
	merged
where
	merged.pv > merged.tv * 0.0001
order by
	merged.pv desc;