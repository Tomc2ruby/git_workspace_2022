import requests

urldef = "http://10.0.2.15/PHP/array/post.php"

postData = {"name":"helloworld","passwd":"123321"}

res = requests.post(url=urldef,data= postData)

print (res.text)
print (res.url)
