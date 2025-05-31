with source as (
    select *
    from {{ source('your_source_system', 'table1') }}
)

select
    id,
    column_a,
    column_b
from source
