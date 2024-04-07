import supabase
import json

import os

from dotenv import load_dotenv

load_dotenv()
SP_URL = os.getenv('SP_URL')
SP_API_KEY = os.getenv('SP_KEY')

url = SP_URL
api_key = SP_API_KEY

# Initialize Supabase client
supabase_client: supabase.Client = supabase.create_client(url, api_key)
with open('keywords_data.json') as f:
    keywords_data = json.load(f)

def search_arc_teryx_products(gender, weather):

    if "sunny" in weather or "sun" in weather:
        weather_keywords = keywords_data.get("sunny_weather_keywords", [])
    elif "rainy" in weather or "rain" in weather or "clouds" in weather:
        weather_keywords = keywords_data.get("rainy_weather_keywords", [])
    else: 
        weather_keywords = []

    # Construct the SQL query with dynamic conditions for keywords
    conditions = []
    for keyword in weather_keywords:
        conditions.append(f'description.like."%{keyword}%"')
    
    
    #Join the conditions with OR operator
    keyword_conditions=",".join(conditions)

    #Construct the final query
    query = f"""
        SELECT * FROM products
        WHERE gender = '{gender}' 
        AND ({keyword_conditions})
    """
    
    # print(weather_keywords)
    response = supabase_client.table('products').select("*").eq('gender', gender).or_(keyword_conditions).execute()
        
    return response

