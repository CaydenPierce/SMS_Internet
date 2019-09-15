import sys
import requests
from datetime import date

from googletrans import Translator
translator = Translator()
n=translator.translate('bonjour moi')
# # import re

# print(type(n))
today = date.today()


searchArray = sys.argv[1:]
# print(len(searchArray))
search=""

# print(searchArray[0])

for i in searchArray:
	search+=i + " "


# regex = re.compile('[@_!#$%^&*()<>?/\|}{~:]') 

# if( not (regex.search(string)==None)):
# 	print("No Special Characters Please")
# 	exit()
# regex = re.compile('@_!$%^&*()<>?/|\}{~:"')

# def removeChar(text):
# 	remove regex.sub('', text)

# search = removeChar(search)
# print(search)

# if ' ' in search:
# 	print("true")
# 	search=search.replace(" ", "%20")

# print(search)


link = "https://newsapi.org/v2/top-headlines?q={}&from={}&sortBy=publishedAt&apiKey=4341fffce2704e9e991191574134ed38".format(search, today)


response = requests.get(link)
response=response.json()
# print(response)

# print(len(response))
count = 0 
# print(response)
# print(len(response))

totalResults = response['totalResults']


# if len(response)>1:
if totalResults>1:
	if totalResults<4:
		maxArticles=totalResults
	if totalResults>3:
		maxArticles=3
	while count < maxArticles:
		articles = response['articles'][count]
		# print(articles)
		print("Article " + str(count+1) + ": ")
		if(articles['title'] is not None):
			print("Title: " + articles['title'][:100] +"...")
		# print(articles['title'])
		if(articles['content'] is not None):
			print("Content: " + articles['content'][:200]+"..." +"\n")
		# print(articles['content'])
		# if(articles['description'] is not None):
		# 	print("Description: ")
		# 	print(articles['description'][:150] +"..." + "\n")	
		count+=1
if totalResults == 1:
	articles=response['articles'][0]
	print("Title: " + articles['title'])
	print("Content: " + articles['content'])
	# print("Description: " + articles['description'])
	print("\n")

if totalResults ==0:
	print("Sorry, no available news for '{}'".format(search))


	# print(articles['description'] + "\n")



# else:
# 	print("nothing")
# why does this loop work

# articles= response['articles'][0]
# print(articles['title'])
# print(articles)

# title=response.get('articles')

# print(title.get('title'))
# for x in response:
# 	print(response.get(x))
# content = response['articles']['content']
# url = response['articles']['url']

# for i in range(10):

# print(content)
# print(url)

