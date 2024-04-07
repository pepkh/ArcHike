import supabase

# Initialize Supabase client
supabase_url = ''
supabase_key = ''
supabase_client = supabase.Client(supabase_url, supabase_key)

def search_arc_teryx_products(gender, weather, activity):
    query = f"""
        SELECT * FROM products
        WHERE gender = '{gender}' 
        AND description contains
        AND weather = '{weather}'
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
