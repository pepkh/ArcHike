from pydantic import BaseModel
import location

class Customer(BaseModel):
    name: str
    gender: str
    experience: str
    location: location.Location