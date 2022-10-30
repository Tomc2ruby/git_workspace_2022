import requests

urldef = "http://10.0.2.15/PHP/array/index.php"

res = requests.get (url=urldef)

print (res.text)
print (res.history)
print (res.status_code)

res = requests.get(url=urldef,allow_redirects = False)
 
#print (res.headers)
print (res.text)
print (res.status_code)
  
