with days as (
    select date_day
    from unnest(generate_date_array('2020-01-01', '2020-12-31', interval 1 day)) as date_day
)
select
    date_day,
    extract(year from date_day) as year,
    extract(month from date_day) as month
from days
