import sys
import requests

search = sys.argv[1]

link = "http://api.openweathermap.org/data/2.5/weather?q={}&appid=b81347c5672e23b4e026a7533d499673".format(search)


response = requests.get(link)
response=response.json()
# print(response)
if response['cod']=="404":
	print("City Not Found")
	exit()

# print(response['cod'])

weather = response['main']['temp']-273.15
# weather = "hey"


if isinstance(weather, float):
	print (str(round(weather, 2))+"°C in {}".format(search))

else:
	print("Sorry, no city found")
	

