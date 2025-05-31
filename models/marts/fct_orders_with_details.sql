with payments as (
    select * from {{ ref('stg_payments') }}
)

select
    order_id,
    amount,
    payment_type_code,
    {{ get_payment_type_description('payment_type_code') }} as payment_method_description,
    {{ add_audit_columns(created_at_alias='order_processed_at', updated_at_alias='last_checked_at') }}
from
    payments
where
    amount > 0

