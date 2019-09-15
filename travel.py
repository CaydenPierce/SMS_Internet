import sys
import requests
import re

search = sys.argv[1:]

origin=search[0]
destination=search[1]
mode=search[2]

origin=origin.replace(" ", "+")
destination=destination.replace(" ", "+")
mode=mode.replace(" ", "+")
# print(origin)
# print(destination)
# print(mode)



# Format: py travel.py "553 powell road whitby on" "26 barnes drive ajax on" walking
#py travel.py <"origin"> <"destination"> <"ModeOfTravel">


regex= re.compile(r'<[^>]+>')
def removeHTML(html):
	return regex.sub('', html)


link = "https://maps.googleapis.com/maps/api/directions/json?origin={}&destination={}&mode={}&key=AIzaSyAcQJy-FIV-bKCYsm4Q9TRP8BKfKizIbEM".format(origin, destination, mode)


response = requests.get(link)
response=response.json()

if response['status']== "ZERO_RESULTS":
	print("No results")
	exit()

else:
# print(len(response))
	routes=response['routes'][0]
	# print(response['status'])
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

# Front End: Add + between every character before sending to backend python


# weather = response['main']['temp']-273.15