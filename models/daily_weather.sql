with daily_weather as (
    
Select
date(time) as daily_weather,
weather,
temp,
pressure,
humidity,
clouds
from
{{ source('demo', 'weather') }}  
limit 10  
)

Select
* 
from daily_weather