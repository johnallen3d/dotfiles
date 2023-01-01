#!/bin/bash

API_KEY="e968d320146741889b013416222106"
CITY="$(curl -s ipinfo.io/loc)"

# first comment is description, second is icon number
weather_icons_day=(
    [1000]=  # Sunny/113
    [1003]=  # Partly cloudy/116
    [1006]=  # Cloudy/119
    [1009]=  # Overcast/122
    [1030]=  # Mist/143
    [1063]=  # Patchy rain possible/176
    [1066]=  # Patchy snow possible/179
    [1069]=  # Patchy sleet possible/182
    [1072]=  # Patchy freezing drizzle possible/185
    [1087]=  # Thundery outbreaks possible/200
    [1114]=  # Blowing snow/227
    [1117]=  # Blizzard/230
    [1135]=  # Fog/248
    [1147]=  # Freezing fog/260
    [1150]=  # Patchy light drizzle/263
    [1153]=  # Light drizzle/266
    [1168]=  # Freezing drizzle/281
    [1171]=  # Heavy freezing drizzle/284
    [1180]=  # Patchy light rain/293
    [1183]=  # Light rain/296
    [1186]=  # Moderate rain at times/299
    [1189]=  # Moderate rain/302
    [1192]=  # Heavy rain at times/305
    [1195]=  # Heavy rain/308
    [1198]=  # Light freezing rain/311
    [1201]=  # Moderate or heavy freezing rain/314
    [1204]=  # Light sleet/317
    [1207]=  # Moderate or heavy sleet/320
    [1210]=  # Patchy light snow/323
    [1213]=  # Light snow/326
    [1216]=  # Patchy moderate snow/329
    [1219]=  # Moderate snow/332
    [1222]=  # Patchy heavy snow/335
    [1225]=  # Heavy snow/338
    [1237]=  # Ice pellets/350
    [1240]=  # Light rain shower/353
    [1243]=  # Moderate or heavy rain shower/356
    [1246]=  # Torrential rain shower/359
    [1249]=  # Light sleet showers/362
    [1252]=  # Moderate or heavy sleet showers/365
    [1255]=  # Light snow showers/368
    [1258]=  # Moderate or heavy snow showers/371
    [1261]=  # Light showers of ice pellets/374
    [1264]=  # Moderate or heavy showers of ice pellets/377
    [1273]=  # Patchy light rain with thunder/386
    [1276]=  # Moderate or heavy rain with thunder/389
    [1279]=  # Patchy light snow with thunder/392
    [1282]=  # Moderate or heavy snow with thunder/395
)

weather_icons_night=(
    [1000]=  # Clear/113
    [1003]=  # Partly cloudy/116
    [1006]=  # Cloudy/119
    [1009]=  # Overcast/122
    [1030]=  # Mist/143
    [1063]=  # Patchy rain possible/176
    [1066]=  # Patchy snow possible/179
    [1069]=  # Patchy sleet possible/182
    [1072]=  # Patchy freezing drizzle possible/185
    [1087]=  # Thundery outbreaks possible/200
    [1114]=  # Blowing snow/227
    [1117]=  # Blizzard/230
    [1135]=  # Fog/248
    [1147]=  # Freezing fog/260
    [1150]=  # Patchy light drizzle/263
    [1153]=  # Light drizzle/266
    [1168]=  # Freezing drizzle/281
    [1171]=  # Heavy freezing drizzle/284
    [1180]=  # Patchy light rain/293
    [1183]=  # Light rain/296
    [1186]=  # Moderate rain at times/299
    [1189]=  # Moderate rain/302
    [1192]=  # Heavy rain at times/305
    [1195]=  # Heavy rain/308
    [1198]=  # Light freezing rain/311
    [1201]=  # Moderate or heavy freezing rain/314
    [1204]=  # Light sleet/317
    [1207]=  # Moderate or heavy sleet/320
    [1210]=  # Patchy light snow/323
    [1213]=  # Light snow/326
    [1216]=  # Patchy moderate snow/329
    [1219]=  # Moderate snow/332
    [1222]=  # Patchy heavy snow/335
    [1225]=  # Heavy snow/338
    [1237]=  # Ice pellets/350
    [1240]=  # Light rain shower/353
    [1243]=  # Moderate or heavy rain shower/356
    [1246]=  # Torrential rain shower/359
    [1249]=  # Light sleet showers/362
    [1252]=  # Moderate or heavy sleet showers/365
    [1255]=  # Light snow showers/368
    [1258]=  # Moderate or heavy snow showers/371
    [1261]=  # Light showers of ice pellets/374
    [1264]=  # Moderate or heavy showers of ice pellets/377
    [1273]=  # Patchy light rain with thunder/386
    [1276]=  # Moderate or heavy rain with thunder/389
    [1279]=  # Patchy light snow with thunder/392
    [1282]=  # Moderate or heavy snow with thunder/395
)

CITY=$(echo "$CITY" | curl -Gso /dev/null -w %{url_effective} --data-urlencode @- "" | cut -c 3- || true)
data=$(curl -s "http://api.weatherapi.com/v1/current.json?key=$API_KEY&q=$CITY")
condition=$(echo $data | jq -r '.current.condition.code')
temp=$(echo $data | jq -r '.current.temp_f | floor')
feelslike=$(echo $data | jq -r '.current.feelslike_f')
humidity=$(echo $data | jq -r '.current.humidity')
is_day=$(echo $data | jq -r '.current.is_day')

[ "$is_day" = "1" ] && icon=${weather_icons_day[$condition]} || icon=${weather_icons_night[$condition]}

[ -z "$icon" ] && exit 0

sketchybar -m \
  --set weather_logo icon="${icon}" \
  --set weather label="${temp}°F"
