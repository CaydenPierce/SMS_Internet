import sys
import requests
import re
from googletrans import Translator
from googletrans import LANGUAGES
# 


search = sys.argv[1:]

if len(search)!=2:
	print("Please enter valid inputs")
	exit()
# print(len(search))

# print(sys.argv[1])

words=re.sub(r"[^\w\s]", '',sys.argv[1])
# print(words)
# print(words)
destination=sys.argv[2]


LANGCODES = dict(map(reversed, LANGUAGES.items()))
translator = Translator()


if (destination not in LANGCODES.keys()):
 	print('No Language Found, Please Clarify')
 	exit()

# print(LANGCODES.keys())
# regex=re.sub('[.,()0-9:;]+', '', words)
# # print(regex)


# LANGCODES = dict(map(reversed, LANGUAGES.items()))
# translator = Translator()


new=translator.translate(words, destination)
print(new.text)

# def translate(thisText, destn):
# 	translator.translate(thisText, dest=destn)
# 	newWords=translator.translate(words)
# 	return newWords.text

# print(translate(words, destination))



# print(translate('hey'))


# print(translate('bonjour'))

# print(LANGCODES)



# n=translator.translate('bonjour moi')