with days as (
    select generate_series('2020-01-01'::date, '2020-12-31'::date, interval '1 day') as date_day
)
select
    date_day,
    extract(year from date_day) as year,
    extract(month from date_day) as month
from days
