select
    DATE_TRUNC(order_date, day) as day,
    SUM(amount) as daily_amount
from {{ ref('fct_orders') }}
group by 1
