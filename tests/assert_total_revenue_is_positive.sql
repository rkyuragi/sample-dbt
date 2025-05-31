with totals as (
    select sum(amount) as total_revenue
    from {{ ref('fct_orders') }}
)
select
    case when total_revenue > 0 then 1 else 0 end as test_result
from totals
