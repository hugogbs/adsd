import requests
import random
import time


while (time.clock() < 1.5):
	seletor = random.randint(0, 10)
	
	print seletor

	if (seletor <= 2):
		r = requests.get('https://aloccaadsd.firebaseapp.com/classes')
	elif (seletor <= 4):
		r = requests.get('https://aloccaadsd.firebaseapp.com/view-professors')
		r = requests.get('https://aloccaadsd.firebaseapp.com/view-courses')
	elif ( seletor <= 7):
		r = requests.get('https://aloccaadsd.firebaseapp.com/classes')
		r = requests.get('https://aloccaadsd.firebaseapp.com/view-professors')
		r = requests.get('https://aloccaadsd.firebaseapp.com/view-courses')
		r = requests.get('https://aloccaadsd.firebaseapp.com/schedules-table')
	else:
		time.sleep(2)
