-- テストが正の収益があることを確認する（正の場合は0件を返すことで成功）
with totals as (
    select sum(amount) as total_revenue
    from {{ ref('fct_orders') }}
)
select *
from totals
where total_revenue <= 0  -- 収益が0以下の場合のみレコードを返す（失敗を示す）
