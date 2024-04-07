import supabase
import json

# Initialize Supabase client
supabase_url = 'https://xybfaozzukgnheeudlzo.supabase.co'
supabase_key = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh5YmZhb3p6dWtnbmhlZXVkbHpvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTI0MzQzMDYsImV4cCI6MjAyODAxMDMwNn0.sjBatcvjHuNt3rBMH-sTzDbPhaoRITXJZdgO2ZddZxA'
supabase_client = supabase.Client(supabase_url, supabase_key)
with open('keywords.json') as f:
    keywords_data = json.load(f)

def search_arc_teryx_products(gender, weather, activity):

    if "sunny" in weather or "sun" in weather:
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


    

def search_arc_teryx_products(gender, weather, activity):
    query = f"""
        SELECT * FROM products
        WHERE gender = '{gender}' 
        AND WHERE description LIKE activity
        OR description LIKE 
        OR description LIKE '%word3%'
        AND activity = '{activity}'
    """
    # Execute query
    response = supabase_client.query(query)
    
    # Check if query was successful
    if response['status'] == 200:
        products = response['data']
        return products
    else:
        print("Error querying database:", response['error'])
        return None

# Example 
gender = 'male'
weather = 'cold'
activity = 'hiking'
arc_teryx_products = search_arc_teryx_products(gender, weather, activity)
if arc_teryx_products:
    for product in arc_teryx_products:
        print(product['name'])
