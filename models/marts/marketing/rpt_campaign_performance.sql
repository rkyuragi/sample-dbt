select
    date_trunc('day', order_date) as day,
    sum(amount) as daily_amount
from {{ ref('fct_orders') }}
group by 1
