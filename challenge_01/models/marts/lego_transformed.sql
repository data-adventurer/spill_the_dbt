with unique_parts as (

    select *
    from {{ ref('unique_parts') }}

)

select 
	t.name as theme_name,
	s.name as set_name,
	s.year as set_year,
	case 
		when up.part_num is null then 'not unique' 
		else 'unique' 
	end as unique_part,
	count(p.part_num) as parts
from parts as p
left join unique_parts as up on p.part_num = up.part_num
inner join inventory_parts as ip on p.part_num = ip.part_num
inner join inventories as i on i.id = ip.inventory_id
inner join sets as s on s.set_num = i.set_num
inner join themes as t on t.id = s.theme_id
group by 1,2,3,4