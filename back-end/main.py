from fastapi import FastAPI
import json
from pydantic import BaseModel

import customer
import location
import openweather

import GearRecommendation as gr
import trail as tr

import strava

app = FastAPI()

class Item(BaseModel):
    item : customer.Customer

# customer_test = customer.Customer(name='test', gender="men", experience="Beginner", location=location.Location(city="Vancouver", country="Canada"))
# city = customer_test.location.city
# country = customer_test.location.country
# gender = customer_test.gender
# weather = openweather.get_weather(city=city, country=country)
# experience = customer_test.experience

@app.post("/customer")
async def request(item: customer.Customer):
    city = item.location.city
    country = item.location.country
    gender = item.gender
    weather = openweather.get_weather(city=city, country=country)
    experience = item.experience

    products = gr.search_arc_teryx_products(gender=gender, weather=weather["description"])
    
    jackets = tr.find_trail(experience=experience)
    print(products.data)
    return {"products": products.data, "jackets":jackets.data}






