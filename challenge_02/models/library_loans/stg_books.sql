select 
    distinct book_id, 
    location,
    book_name
from {{ source('library', 'books_factual') }}
where book_id is not null

union all

select 
    distinct book_id, 
    location,
    book_name
from {{ source('library', 'books_fictional') }}
where book_id is not null

