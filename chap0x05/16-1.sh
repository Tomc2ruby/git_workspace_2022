#!/bin/bash
urls=("https://www.taobao.com" "http://www.qq.com" "https://www.baidu.com")
fbs=("taobao.com" "qq.com" "baidu.com")
count=${#urls[@]}
err=1
bench=`expr $count - $err`

# login variables
uid="[your_uid]"
psw="[your_psw_extracted_from_account.cuc.edu.cn_login_post]" # 注意一定要使用URL编码之后的数据

# cookie文件持久化存储路径
cookie_file="acuc.txt"

UA="Mozilla/5.0 (X11; Linux i686) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.772.0 Safari/535.1"

# 校园网认证首页
index_url="http://account.cuc.edu.cn/connect/index.jsp"

# 校园网登录API
login_url="http://account.cuc.edu.cn/connect/ws/ws_login.jsp?act=2&userid=${uid}&passwd=${psw}&act=2"

# 校园网认证心跳API
hb_url_0="http://account.cuc.edu.cn/connect/ws/ws_action.jsp?act=4" # 认证成功后，只联接校园网，需要通过该API完成联接互联网
hb_url_1="http://account.cuc.edu.cn/connect/ws/ws_action.jsp?act=6"
hb_url_2="http://account.cuc.edu.cn/connect/ws/ws_action.jsp?act=7"

# 校园网注销API
logout_url="http://account.cuc.edu.cn/connect/ws/ws_login.jsp?act=3"

# 调试用文件路径
log_result="res.html"

isNetworkConnected() {
  success=0;
  for((i=0;i<$count;i++));do
    url=${urls[$i]};
    fb=${fbs[$i]};
    res=`curl -s -4 -m 5 $url`;
    if [[ $res =~ $fb ]];then
      ((success++));
    fi
  done

  if [ $success -gt $bench ];then
    connected=1; # connected to internet
  else
    connected=0; # connection error
  fi
  echo $connected;
}


keep_connected() {
  curl -k -e "$index_url" -b "$cookie_file" "$hb_url_1"
  curl -k -e "$index_url" -b "$cookie_file" "$hb_url_2"
}

log_out() {
  curl -k -e "$index_url" -b $cookie_file "$logout_url" # 先注销，再联网，避免重复登录
}

connect_lan() {
  # 连接校园网
  curl -k -c "$cookie_file" -L -e "$login_url" -A "$UA" -o "$log_result" "$login_url"
}

connect_internet() {
  # 连接互联网
  curl -k -e "$index_url" -b "$cookie_file" "$hb_url_0"
}

connected=$(isNetworkConnected)

if [ $connected -eq "1" ];then
  echo "we are connected!";
  # 当前是已联网状态，保持心跳即可
  keep_connected
else
  # 当前是未联网状态
  echo "we are disconnected";
  log_out
  connect_lan
  connect_internet
  keep_connected
fi
