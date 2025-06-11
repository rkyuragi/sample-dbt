select
    DATE_TRUNC(order_date, DAY) as day,
    sum(amount) as daily_amount
from {{ ref('fct_orders') }}
group by 1
