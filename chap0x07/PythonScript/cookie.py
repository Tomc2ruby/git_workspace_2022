import requests

urldef = "http://10.0.2.15/PHP/cookie/2.php"

cookiedef = {"name":"ajest"}

res = requests.get(url = urldef,cookies=cookiedef)

print (res.text)

