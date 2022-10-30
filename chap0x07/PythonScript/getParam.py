import requests

urldef = "http://10.0.2.15/PHP/array/get.php"

getPara = {"name":"ajest","psswd":"12345"}

res = requests.get( url=urldef,params=getPara)

print (res.text)
#print (requests.url)
print (res.url)
