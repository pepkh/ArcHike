from pydantic import BaseModel
import openweather as op
import supabase as sp
import json

import os

from dotenv import load_dotenv

load_dotenv()
SP_URL = os.getenv('SP_URL')
SP_API_KEY = os.getenv('SP_KEY')

url = SP_URL
api_key = SP_API_KEY

# Initialize Supabase client
sp_client: sp.Client = sp.create_client(url, api_key)

class Trail(BaseModel):
    name: str
    difficulty: str
    distance: float
    elevation: int
    time: int
    pet: bool
    region: str
    
sp_client = sp.Client(url, api_key)

def find_trail(experience):
    if experience == "Beginner":
        difficulty = "Very Easy"
    elif experience == "Experienced":
        difficulty = "Easy"
    elif experience == "Advanced":
        difficulty = "Moderate"
    elif experience == "Crazy":
        difficulty = "Difficult"
    else:
        difficulty = ""
    
    response = sp_client.table('trails').select("*").eq('difficulty', difficulty).execute()
    return response

    