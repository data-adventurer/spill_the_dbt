select
    b.book_name,
    m.member_name,
    m.discount_rate/100 as discount_applied,
    sum(l.late_fee * (m.discount_rate/100)) as fee_applied
from stg_members as m 
    inner join stg_loans as l on m.member_id = l.member_id
    left join stg_books as b on l.book_id = b.book_id
group by 1,2,3


