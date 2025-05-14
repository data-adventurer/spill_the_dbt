select 
    member_name,
    string_agg(book_name::text, ',') as late_books,
    discount_applied,
    round(sum(fee_applied),2) as fee_to_pay
from {{ ref('customer_withdrawls') }}
group by 1,3

