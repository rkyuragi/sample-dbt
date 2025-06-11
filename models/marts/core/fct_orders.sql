select
    o.id as order_id,
    o.id as customer_id,  -- int_model_nameにcustomer_idがないのでidを使用
    current_date as order_date,  -- order_dateもないので現在日付を使用
    CASE 
        WHEN REGEXP_CONTAINS(o.column_a, r'^[0-9]+\.?[0-9]*$') THEN CAST(o.column_a AS DECIMAL)
        ELSE 0.0
    END as amount  -- column_aを数値に変換
from {{ ref('int_model_name') }} as o
