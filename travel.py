import sys
import requests
import re

search = sys.argv[1:]

origin=search[0]
destination=search[1]
mode=search[2]

print(search)

# for x in xrange(1,10):
# 	pass

regex= re.compile(r'<[^>]+>')
def removeHTML(html):
	return regex.sub('', html)


link = f"https://maps.googleapis.com/maps/api/directions/json?origin={origin}&destination={destination}&mode={mode}&key=AIzaSyAcQJy-FIV-bKCYsm4Q9TRP8BKfKizIbEM"


response = requests.get(link)
response=response.json()
routes=response['routes'][0]
legs=routes['legs'][0]
distance=legs['distance']['text']

print("Distance: " + distance)

time = legs['duration']['text']

print("Time: " + time )
steps=legs['steps']
# print(len(steps))

i=0
while i < len(steps):
	print(removeHTML(steps[i]['html_instructions']))
	print('Proceed ' + steps[i]['distance']['text'] + ". Approximately " + steps[i]['duration']['text'])

	i+=1

#Front End: Add + between every character before sending to backend python


# weather = response['main']['temp']-273.15



