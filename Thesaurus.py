import sys
import requests
import json

searchArray = sys.argv[1:]
search=searchArray[0]
# print(len(searchArray))

if len(searchArray)>1:
	print("Please use a single word")
	exit()
	

url = "https://www.dictionaryapi.com/api/v3/references/thesaurus/json/{}?key=1b3e731e-bfe5-4034-af25-e386cfc6a899".format(search)

response = requests.get(url)
response=response.json()
# print(response)

if len(response)==0:
	print("Word Not Found")
	exit()
# response=json.loads(response)
meta= response[0]['meta']
synonyms=meta['syns'][0]
# print(synonyms)
	
for i in synonyms:	
	print(i)