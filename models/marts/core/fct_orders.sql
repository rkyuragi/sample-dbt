select
    o.id as order_id,
    o.id as customer_id,  -- int_model_nameにcustomer_idがないのでidを使用
    current_date as order_date,  -- order_dateもないので現在日付を使用
    case
        when
            regexp_contains(o.column_a, r'^[0-9]+\.?[0-9]*$')
            then cast(o.column_a as DECIMAL)
        else 0.0
    end as amount  -- column_aを数値に変換
from {{ ref('int_model_name') }} as o
