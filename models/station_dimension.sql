with BIKE as (

select
distinct
START_STATIO_ID as station_id,
start_station_name as station_name,
start_lat as station_lat,
start_lng as station_lng
from {{ source('demo', 'bike') }}
where RIDE_ID != 'ride_id'

)

select * from BIKE