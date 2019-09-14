import sys
import requests
from datetime import date



today = date.today()


searchArray = sys.argv[1:]
# print(len(searchArray))
search=""

# print(searchArray[0])
for i in searchArray:
	search+=i + " "


# if ' ' in search:
# 	print("true")
# 	search=search.replace(" ", "%20")

print(search)

link = f"https://newsapi.org/v2/top-headlines?q={search}&from={today}&sortBy=publishedAt&apiKey=4341fffce2704e9e991191574134ed38"


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
	if totalResults<6:
		maxArticles=totalResults
	if totalResults>6:
		maxArticles=5
	while count < maxArticles:
		articles = response['articles'][count]
		# print(articles)
		print("Article " + str(count+1) + ": ")
		print("Title: " + articles['title'])
		# print(articles['title'])
		print("Content: " + articles['content'])
		# print(articles['content'])
		print("Description: ")
		print(articles['description'] + "\n")	
		count+=1
if totalResults == 1:
	articles=response['articles'][0]
	print("Title: " + articles['title'])
	print("Content: " + articles['content'])
	print("Description: " + articles['description'])
	print("\n")

if totalResults ==0:
	print(f"Sorry, no available news for '{search}'")
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

