import sys
import requests

search = sys.argv[1]

url = f"http://api.openweathermap.org/data/2.5/weather?q={search}&appid=b81347c5672e23b4e026a7533d499673"

response = requests.get(url)
response=response.json()
print (response['main']['temp']-273.15)