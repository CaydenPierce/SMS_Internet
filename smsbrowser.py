#strips images, Jav applets, and Javascript from the page, just html baby

from urllib.request import urlopen
from bs4 import BeautifulSoup as soup
import sys

def getPage(url): #gets the raw html of the page we want
        scrapeClient = urlopen(url)
        searchPage_html = scrapeClient.read()
        scrapeClient.close()
        return searchPage_html

#main
if __name__ == "__main__":
	page = getPage(sys.argv[1])
	parsedPage = soup(page, "html.parser") #parse html
	with open("./public/currentpage.html", "w") as f:
		f.write(str(parsedPage)) #write html to file
	print("browser", end="")
