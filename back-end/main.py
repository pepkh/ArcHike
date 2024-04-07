from fastapi import FastAPI
import json

import customer
import location
import openweather

app = FastAPI()

@app.get("/")
async def root():
    customer_test = customer.Customer(name='test', age=23, gender="woman", experience=False, location=location.Location(city="Vancouver", country="Canada"))
    city = customer_test.location.city
    country = customer_test.location.country
    weather = openweather.get_weather(city=city, country=country)
    print(weather["description"])

    return {"message": "Hello World"}


