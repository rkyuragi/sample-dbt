select
    id,
    column_a,
    column_b
from {{ ref('stg_test_dbt_cloud__table1') }}
