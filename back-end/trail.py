from pydantic import BaseModel
import openweather as op
import supabase as sp
import json

class Trail(BaseModel):
    name: str
    difficulty: str
    distance: float
    elevation: int
    time: int
    pet: bool
    region: str

def filter_experience(experience):
    if experience == "Beginner":
        return "Very Easy"
    elif experience == "Experienced":
        return "Easy"
    elif experience == "Advanced":
        return "Moderate"
    elif experience == "Crazy":
        return "Difficult"
    
sp_url = ''
sp_key = ''
sp_client = sp.Client(sp_url, sp_key)
with open('keywords.json') as f:
    keywords_data = json.load(f)

def find_trail(difficulty):

    if "Very Easy" == 
        weather_keywords = keywords_data.get("sunny_weather_keywords", [])
    elif "rainy" in weather or "rain" in weather or "cloud" in weather:
        weather_keywords = keywords_data.get("rainy_weather_keywords", [])
    else: 
        weather_keywords = []

    # Construct the SQL query with dynamic conditions for keywords
    conditions = []
    for keyword in weather_keywords:
        conditions.append(f"description LIKE '%{keyword}%'")
    
    # Join the conditions with OR operator
    keyword_condition = " OR ".join(conditions)

    # Construct the final query
    query = f"""
        SELECT * FROM products
        WHERE gender = '{gender}' 
        AND ({keyword_condition})
        AND activity = '{activity}'
    """
    response = supabase_client.query(query)
    