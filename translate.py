import sys
import requests
from googletrans import Translator
from googletrans import LANGUAGES

search = sys.argv[1:2]

words=sys.argv[1]
destination=sys.argv[2]

LANGCODES = dict(map(reversed, LANGUAGES.items()))
translator = Translator()


print(words)
print(destination)
print(LANGCODES[destination])

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