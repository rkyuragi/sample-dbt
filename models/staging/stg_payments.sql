with raw_payments as (
    select
        1 as order_id,
        1 as payment_type_code,
        1000 as amount
    union all
    select
        2 as order_id,
        2 as payment_type_code,
        2500 as amount
    union all
    select
        3 as order_id,
        1 as payment_type_code,
        500 as amount
    union all
    select
        4 as order_id,
        3 as payment_type_code,
        1200 as amount
    union all
    select
        5 as order_id,
        5 as payment_type_code,
        300 as amount
)

select
    order_id,
    payment_type_code,
    amount
from
    raw_payments
