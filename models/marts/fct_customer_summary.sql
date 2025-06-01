select
    customer_id,
    min(order_date) as first_order_date,
    max(order_date) as last_order_date,
    count(order_id) as total_orders,
    sum(order_amount) as total_revenue
from {{ ref('stg_orders') }}
group by customer_id
