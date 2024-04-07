from pydantic import BaseModel
import openweather as op

class Trail(BaseModel):
    name: str
    ranking: int
    difficulty: str
    distance: int
    elevation: int
    time: int
    pet: bool
    region: str

def filter_data(location, experience):
    response = op.get_weather(location)
    if response["description"] == "hello":
        