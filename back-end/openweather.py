import requests
import pandas as pd
from geopy.geocoders import Nominatim
from geopy.extra.rate_limiter import RateLimiter
import datetime

import os
from dotenv import load_dotenv

load_dotenv()

OPENWEATHER_API_KEY = os.getenv('OPW_API_KEY')
 
# variables
api_key = OPENWEATHER_API_KEY

geolocator = Nominatim(user_agent="john.dohdsk343@gmail.com")

def get_weather(city, country):
  response = geolocator.geocode(city + ", " + country)

  owm_url = f"https://api.openweathermap.org/data/2.5/weather?lat={response.latitude}&lon={response.longitude}&appid={api_key}"
  owm_response = requests.get(owm_url)
  owm_response_json = owm_response.json()
  sunset_utc = datetime.datetime.fromtimestamp(owm_response_json["sys"]["sunset"])
  return {
      "temp": owm_response_json["main"]["temp"] - 273.15,
      "description": owm_response_json["weather"][0]["description"]
  }