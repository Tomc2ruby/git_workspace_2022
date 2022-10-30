import requests

urldef = "http://10.0.2.15/PHP/array/timeout.php"

try:
    res = requests.get(url=urldef,timeout=4)
    print (res.text)
except Exception as e:

    print ("Timeout")
