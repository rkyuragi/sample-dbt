select
    id as customer_id,
    column_a as customer_name
from {{ ref('stg_your_source_system__table1') }}
