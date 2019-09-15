#strips images, Jav applets, and Javascript from the page, just html baby
#then changes all links in html to deep links so our app can make SMS requests

from urllib.request import urlopen
from bs4 import BeautifulSoup as soup
import sys

def getPage(url): #gets the raw html of the page we want
        scrapeClient = urlopen(url)
        searchPage_html = scrapeClient.read()
        scrapeClient.close()
        return searchPage_html

def ballsDeepLinking(soup):
	for link in soup.find_all('a'):
		location = link['href']
		try:
			title = link.string
		except:
			try:
				title = link['title']
			except:
				title = "NA"
		link = link.replace_with('<a href="http://smsinternet.tech/smsbrowse?{}">{}</a>'.format(location, title))
		#link = link.replace_with('gay')
	#for link in soup.find_all('a', href=True):
		#print("a" + link)
	return soup
#main
if __name__ == "__main__":
	page = getPage(sys.argv[1])
	parsedPage = soup(page, "html.parser") #parse html
	parsedPage = ballsDeepLinking(parsedPage) #turn regular links into deep links
	parsedPage = parsedPage.prettify(formatter=None)
	with open("./public/currentpage.html", "w") as f:
		f.write(str(parsedPage)) #write html to file
	print("browser", end="")
