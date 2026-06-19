WITH CTE AS (
Select

to_timestamp(started_at) as STARTED_AT,
date(to_timestamp(started_at)) as DATE_STARTED_AT,
HOUR(to_timestamp(started_at)) AS HOUR_STARTED_AT,
DAYNAME(to_timestamp(started_at)) AS DAYNAME,
CASE 
    WHEN DAYNAME(to_timestamp(started_at)) IN ('Sat', 'Sun')
    THEN 'WEEKEND'
    ELSE 'BUSINESSDAY'
END AS DAY_TYPE
from
{{ source('demo', 'bike') }}
where STARTED_AT != 'started_at'
)


Select * FROM CTE