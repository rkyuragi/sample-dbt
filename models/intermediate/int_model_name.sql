select
    id,
    sum(amount) as total_amount
from {{ ref('stg_your_source_system__table1') }}
group by id
