select
    id as customer_id,
    column_a as customer_name
from {{ ref('stg_test_dbt_cloud__table1') }}
