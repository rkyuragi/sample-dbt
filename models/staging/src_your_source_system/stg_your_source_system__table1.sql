with source as (
    select *
    from {{ source('test_dbt_cloud', 'table1') }}
)

select
    id,
    column_a,
    column_b
from source
