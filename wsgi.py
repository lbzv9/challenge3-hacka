import bottle
from bottle import *
import os,sys,logging, traceback, json, string, urllib, urllib2
import pymongo
from pymongo import *
from pymongo import Connection

from BeautifulSoup import BeautifulSoup
import httplib2

# Configs from BlueMix 
vcap_config = os.environ.get('VCAP_SERVICES')
decoded_config = json.loads(vcap_config)

for key, value in decoded_config.iteritems():
	if key.startswith('mongo'):
		mongo_creds = decoded_config[key][0]['credentials']

# ---- configuring mongo ---- 
mongo_url = str(mongo_creds['uri'])
client = pymongo.Connection(mongo_url)
mongo_db = mongo_url.split('@')[1].split('/')[1]


mongoDB = client[mongo_db]
itemCollection = mongoDB["ItemCollection"]
# ---- end of mongo config ---- 


#Provide all the static css and js files under the static dir to browser
@route('/static/:filename#.*#')
def server_static(filename):
	""" This is for JS files """
	return static_file(filename, root='static')

# Displays the home page
@bottle.get("/")
def testFunc():
	return bottle.template('home')
	
@bottle.get("/report")
def testFunc():
	return bottle.template('report')
	
# Get the prices for all of the items stored in the database
@bottle.get('/getCurrentPrices')		
def getCurrentPrices():
	items = itemCollection.find()
	

	for item in items:
		getCurrentPrice(item)
		
	return bottle.template('currentPrice')

# Get the current price of a particular item
def getCurrentPrice(item):
	
	try: 			
		http = httplib2.Http()
		status, page = http.request(item["url"])
		soup = BeautifulSoup(page)
		price = soup.find(id=item["idToCheck"]).string	
		
		if price is not None:
			
			itemCollection.update({'url': item["url"]},{"$set" : {'price':price}})
			
			return bottle.template('currentPrice', price=price)
		
		else:
			return bottle.template('currentPriceError')
	except:
		return bottle.template('currentPriceError')

# Saves the item info in the database
@bottle.post('/recordItemInfo')
def recordItemInfo():

	name = request.forms.get('name')
	url = request.forms.get('url')
	idToCheck = request.forms.get('idToCheck')
	
	existTest = itemCollection.find({'url': url}).count()
	if existTest == 0:
		data = {'url': url, 'name': name,'idToCheck': idToCheck}
		insert_id = itemCollection.insert(data)
		print "Data inserted"
	else:
		itemCollection.update({'url': url},{"$set" : {'name':name}})
		itemCollection.update({'url': url},{"$set" : {'idToCheck':idToCheck}})
		print "Data updated"
	cursor = list(itemCollection.find())
	totinf = int(itemCollection.count())

	return bottle.template ('dbdump',totinf=totinf,cursor=cursor)


#  Displays all the records in the database
@bottle.get('/displayall')
def displayData():
#cursor = list(itemCollection.find({'url': 'E3998'}))
#cursor = list(itemCollection.find({'name': 'QATAR'}))
	cursor = list(itemCollection.find())
	totinf = int(itemCollection.count())
	#totinf = 10
	
	return bottle.template ('dbdump',totinf=totinf,cursor=cursor)
	

@bottle.get('/displayall1')
def displayall1():
#cursor = list(itemCollection.find({'url': 'E3998'}))
#cursor = list(itemCollection.find({'name': 'QATAR'}))
	cursor = list(itemCollection.find())
	totinf = int(itemCollection.count())
	#totinf = 10
	
	return bottle.template ('dbdump1',totinf=totinf,cursor=cursor)
# Removes all the records from the database
@bottle.post('/clearall')
def clearAll():
	itemCollection.remove()
	cursor = list(itemCollection.find())
	totinf = int(itemCollection.count())
	print "this is the value: %d" % totinf
	return bottle.template ('dbdump1',totinf=totinf,cursor=cursor)


# Removes only the selected stuff from the database
@bottle.post('/delselected')
def removeSelected():
	s = str(request.forms.get('url'))
	itemCollection.remove({'url' : s})
	cursor = list(itemCollection.find())
	totinf = int(itemCollection.count())
	print "this is the value: %d" % totinf
	return bottle.template ('dbdump',totinf=totinf,cursor=cursor)

debug(True)

# Error Methods
@bottle.error(404)
def error404(error):
    return 'Nothing here--sorry!'


application = bottle.default_app()

if __name__ == '__main__':
    port = int(os.getenv('PORT', '8000'))
    bottle.run(host='0.0.0.0', port=port)
