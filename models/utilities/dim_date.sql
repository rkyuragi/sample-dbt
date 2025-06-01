with days as (
    select range_date as date_day
    from range(date '2020-01-01', date '2021-01-01', interval '1 day') as t(range_date)
)
select
    date_day,
    extract(year from date_day) as year,
    extract(month from date_day) as month
from days
