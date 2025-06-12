-- 仮の注文データを生成するステージングモデル
with source_orders as (
    select
        1 as order_id,
        101 as customer_id,
        DATE('2023-01-10') as order_date,
        100.00 as order_amount
    union all
    select
        2 as order_id,
        102 as customer_id,
        DATE('2023-01-11') as order_date,
        150.00 as order_amount
    union all
    select
        3 as order_id,
        101 as customer_id,
        DATE('2023-01-05') as order_date,
        75.00 as order_amount
    union all
    select
        4 as order_id,
        103 as customer_id,
        DATE('2023-01-20') as order_date,
        50.00 as order_amount
    union all
    select
        5 as order_id,
        101 as customer_id,
        DATE('2023-01-15') as order_date,
        200.00 as order_amount
    union all
    select
        6 as order_id,
        102 as customer_id,
        DATE('2023-01-09') as order_date,
        120.00 as order_amount
    union all
    select
        7 as order_id,
        104 as customer_id,
        DATE('2023-02-01') as order_date,
        -25.00 as order_amount
    union all
    select
        8 as order_id,
        105 as customer_id,
        DATE('2023-02-10') as order_date,
        0.00 as order_amount
)

select * from source_orders
