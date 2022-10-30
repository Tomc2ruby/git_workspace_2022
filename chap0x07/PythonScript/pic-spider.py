import requests
import urllib.request
import re
# 面向对象方式 ，进行 网页图片爬虫  
class getHtml(object):    #  定义 类 
    def __init__(self,URL,HEAD):                   # 定义 属性  
        self.url = URL
        self.head = HEAD
    def get_index(self):                          #   定义方法    
        self.res = requests.get(url=self.url,headers = self.head)
        return self.res.content     
    def get_list(self):                           # 定义方法。 显示图片地址  可以用正则表达式  
        self.strimglist = []
        self.imglist = re.findall(b"\.\./upload/201207/1342404422.jpg",self.get_index())
        #print (self.imglist)
        #return self.imglist
        for i in self.imglist:
            self.strimglist.append(self.url+str("/../include/thumb.php?dir=")+str(i,encoding="utf8")+str("&x=220&y=200"))
        print (self.strimglist)
        return self.strimglist 
    def get_image(self):             #   定义方法， 通过图片地址 读取图片 ，并进行修改名称后  保存  ，二进制格式  
        num = 0
        for self.url in self.get_list():
            num += 1
            with open(str(num)+".png","wb") as f:    # 以二进制写的方式打开一个文件，没有文件 新创建
                f.write(self.get_index())         # 进行二进制写 调用方法
        
 # 面向对象 
html = getHtml("http://10.0.2.15/MetInfo5.3/index.php",{"user-agent":"Mozilla/5.0 (Windows NT 10; 32; rv:46.0)"})    

#html.get_list()
#print (html.get_index())
html.get_image()      # 在当前目录下生成 图片



#以上是 获取 网页源码 


# 使用证则表达式 
