from fastapi import FastAPI
import json

import customer
import location
import openweather

import GearRecommendation as gr
import trail as tr

app = FastAPI()

@app.get("/customer")
async def root():
    customer_test = customer.Customer(name='test', age=23, gender="men", experience="Beginner", location=location.Location(city="Vancouver", country="Canada"))
    city = customer_test.location.city
    country = customer_test.location.country
    gender = customer_test.gender
    weather = openweather.get_weather(city=city, country=country)
    experience = customer_test.experience

    print(weather['description'])

    products = gr.search_arc_teryx_products(gender=gender, weather=weather["description"])
    print(products)

    trails = tr.find_trail(experience=experience)
    print(trails)

    return {"message": "Hello World"}


