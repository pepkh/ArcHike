from pydantic import BaseModel
import location

class Customer(BaseModel):
    name: str
    age: int
    gender: str
    experience: str
    location: location.Location