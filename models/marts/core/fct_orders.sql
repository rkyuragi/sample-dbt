select
    o.order_id,
    o.customer_id,
    o.order_date,
    o.amount
from {{ ref('int_model_name') }} as o
