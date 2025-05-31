-- アドホック分析用のSQL
select * from {{ ref('dim_customers') }} limit 10;
