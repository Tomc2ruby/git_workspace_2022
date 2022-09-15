####试验报告

#####session manmagentflaws-spoof an authentication cookie

实验过程：

1、按照提示 输入 webgoat/webgoat   , 和 aspect/aspect  
2、打开 burpsuit  ,抓包 ，

![burpsuit 开启抓包界面](img\1.PNG)

3 、在 logger++  选项卡  把 ，POST登陆请求，登陆成功后的响应包（ resposnes）（status：200 ），分别 send to compare 模块 ， 
![图片2](img\2.PNG)

4 、在compare 模块中 对 服务器 设置的cookie  进行分析 ， 找到其算法 规律  
  webgoat----> taogbew---> 向后移一位
 所以 
 Alice   --》eclia --->  fdjmb 
 ![](img\3.PNG)

 ![](./img\4.PNG)

5、 在请求包中   请求头部分 cookie 添加  authcookie=65432fdimb    ,使用 burpsuit 发生即可返回  ALICE 登陆成功结果。
![](./img\5.PNG)

![](./img\6.PNG)

![](./img\7.PNG)

********
*结束!!*      **完**
_________

