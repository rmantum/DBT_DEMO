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
),

daily_weather_egg as(

select
daily_weather,
weather,
round(avg(temp),2) as avg_temp,
round(avg(pressure),2) as avg_pressure,
round(avg(humidity),2) as avg_humidity,
round(avg(clouds),2) as avg_clouds

from daily_weather
group by daily_weather, weather
Qualify ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) desc) = 1
)

Select
* 
from daily_weather_egg