select
    customer_id,
    first_order_date,
    last_order_date
from {{ ref('fct_customer_summary') }}
where first_order_date > last_order_date

