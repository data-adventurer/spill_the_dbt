select *
from {{ source('library', 'members')}}
where member_id is not null 
    and membership_tier in ('Bronze', 'Silver', 'Gold')


