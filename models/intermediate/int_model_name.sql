select
    id,
    column_a,
    column_b
from {{ ref('stg_your_source_system__table1') }}
