import  requests

url = "http://10.0.2.15/PHP/array/get.php"

header = {"User-Ager":"ajest"}

res = requests.get(url=url,headers=header)

print (res.headers ) 

print (res.request.headers)

print (res.headers[1])
print (res.headers.server)
print (res.headers.x-power-by)
print (res.headers.Content-Length)
print (res.headers.keep-alive)
print (res.headers.connetction)

print (res.headers.content-type)


