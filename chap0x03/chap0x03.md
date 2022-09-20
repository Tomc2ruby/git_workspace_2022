## Linux 常用命令

+ 修改主机名

```bash
#  test为修改后的主机名

hostnamectl set-hostname   test
```

![image](img/hostnamectl.png)

+ 修改为主机名 还需要修改 **/etc/hosts** 文件 

![image](img/hosts.png)

+ 查看文件安装目录
  
```bash
dpkg -L vim
```

![image](img/dpkg.png)

+ grep 
  
```bash
# 后接相应参数
grep -B    grep -A   grep -i   grep -n  grep -c
```

![image](img/grep.png)

+ 查看系统版本几种方法
  
  ```bash
  # 针对ubuntu 系统 全部可用， 其他系统自行尝试
   cat /etc/issue 
   cat /etc/os-release
   cat /etc/lsb-release
  ```

+ man的几种方式

```bash
# 数字3 可为1- 9中的数字（需按实际替换）
man 3 pcre
```

![image](img/man.png)

 man 7 查看后 按q 退出 ，会提示还有可看文档  如果查看 按 回车 ，否则，按quit 退出

 ![imag](img/man1.png)

 + 进程常用指令
  
  ```bash
  ps aux  
  pstree  
  pidof  
  top
  htop
  kill/kill -9 / kill -s N /killall <process_imagename>   
  ```

  ![image](img/ps.png)

  + scp
   
  ```bash
  #scp  源目标   目的目标 
  # 把远程主机10.0.2.14上的test文件 ，拷贝到本地 根目标  
  #注意 冒号  和 空格 

  scp tomc@10.0.2.14:/home/tomc/test ./
  ```

  ![imag](img/scp.png)

  + tail 时时监听syslog 日志

```bash
tail -F /var/log/syslog
tail -F /var/log/auth.log
```

![image](img/tail1.png)
![image](img/tail-F.png)

+ Linux 系统中解压 来自Windows的压缩文件 乱码问题  

```bash
# 添加 大写字母O cp936 即可实现转码显示

unzip -l test.zip
unzip -O cp936 -l test.zip
```

![image](img/unzip.png)


### **配置免密登陆方法:**

1、本地主机生成公钥文件

```bash
ssh-keygen -b 4096

```

- 公钥存储目录

     ~/.ssh/id-rsa.pub

- 使用终端 `ssh-copy-id`命令 把本地公钥发送 远程主机 

```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub tom@192.168.0.10
```
![imag](img/ssh-copy-id.png)

### **root 用户设置免密登陆**

- 首先在远程主机 root 家目录 新建  .ssh 目录

```bash
sudo mkdir /root/.ssh
# 把远程tom 用户家目录下的 authorized_keys 文件 拷贝到 /root/.ssh 下
sudo cp /home/tom/.ssh/authorized_keys /root/.ssh/authorized_keys
```

![image](img/root-ssh.png)

- 使用指定 源更新 安装软件方法

```bash
#使用国内 pypi 镜像加速下载
pip3 install ansible -i https://pypi.tuna.tsinghua.edu.cn/simple
#验证 pip 方式安装的 ansible 版本
pip3 freeze | grep ansible
```
![image](img/pip-i.png)

- 使用 pip freeze 查看安装版本

```bash
pip freeze | grep requests 
```

![image](img/pip.png)

- 修改本机 hosts 文件  添加  域名指定未被污染的IP地址

```bash
# 可以通过 ipip.net或者其他网上在线查找工具，查找访问域名对应的无污染IP 
 vim /etc/hosts
 cat /etc/hosts
```
![img](img/etc-host.png)

- 查找 配置文件是否使用的80 或者 8088 端口方法：
 
```bash
# 当前目录 搜索 所有文档中 是否 含有 80  ，递归方式
grep 80 -R .. 
grep 8088 -R ..
```
 
![image](img/grep80.png)

- ps aux 中 STAT 所对应参数含义：

          D --不可中断 Uninterruptible sleep 通常未 I/O ,

          R  -- 正在运行 或者在队列中的进程，

          S  -- 处于休眠状态，

          T  -- 停止或者被追踪，

          Z  -- 僵尸进程，

          W  -- 进入内存交换（从内核2.6开始无效），

          X  -- 死掉的进程，

          <  -- 高优先级，

          N  -- 低优先级，

          L  --有些页被锁进内存，

          s  -- 包含子进程，

          +-  --位于后台的进程组，

          l   --多线程，克隆线程：，

![image](img/ps-stat.png)

- 如何验证一个中文汉字 是三个字节 

```bash
# 中字 e4b8 ad   文字e6 9687
echo -n '中文'  | xxd
```

![image](img/zw.png)

- bash 脚本第一行 书写方式

```bash
#! /usr/bin/env bash
# cat -n查看 
cat -n 2-3.sh
```

![image](img/bash.png)

- 日期格式转换显示 

```bash
date -d "$date1" +%A
# 日期转星期
date -d "sep 18 2022" +%A
```

![image](img/date.png)

![image](img/date1.png)

---

*待续*

----

---

**未完**

---

### 参考资料
* [Github网络安全链接](https://github.com/c4pr1c3/cuc-ns)

