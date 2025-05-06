with unique_parts as (
    select 
        p.part_num
    from parts as p
    inner join inventory_parts as ip on p.part_num = ip.part_num
    inner join inventories as i on i.id = ip.inventory_id
    inner join sets as s on s.set_num = i.set_num
        group by p.part_num
        having count(*) = 1
)

select *
from unique_parts
