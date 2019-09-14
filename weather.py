import sys
import requests

search = sys.argv[1]

link = f"http://api.openweathermap.org/data/2.5/weather?q={search}&appid=b81347c5672e23b4e026a7533d499673"


response = requests.get(link)
response=response.json()
# print(response)
weather = response['main']['temp']-273.15
# weather = "hey"


if isinstance(weather, float):
	print (round(weather, 2))

else:
	print("Sorry, no city found")
	

