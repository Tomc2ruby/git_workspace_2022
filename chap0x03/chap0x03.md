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

### ****进程相关命令**


+ 进程查询 `ps  | grep`  `lsof -p 进程号


```bash
#查看当前shell 进程号
 ps | grep $$

#查看指定进程号的 进程状态
 ps aux | grep 8798

#bash 进程的绝对路径
 type bash

#bash的 版本
bash --version 

lsof -p pid
```

![image](img/ps-grep.png)

![image](img/lsof.png)

+ grep 查询 已知文件内包含 所查内容 


![](img/grep-ls.png)


+ Bash 脚本 调试模式

```bash
#命令行 -x 进行脚本逐行调试，并打印输入的参数值
 bash -x <script.sh>
# 代码片段临时开启调试模式 (开始：-x，结束：+x)
 set -x
 w
 set +x
# echo -n -e 包括不可打印字符 参数写文件 >> 追加
 echo -n -e "$msg" | xxd -p >> /tmp/debug.log
```

![image](img/bash-set-x.png)

+ 显示列表命令 `ls` ,查询命令`find`

```bash
# 按时间排序 查看最近10条 
 ls -alt | head -n 10
#查找24小时内，新建的所有 .jsp 文件
 find ./ -mtime 0 -name "*.jsp"
#同上
 find ./ -mtime 0 -name "*.sh"
# 查找所有.sh 权限问777的所有文件
 find ./*.sh -perm 4777
```

![image](img/ls-find.png)

+ 命令`ls -at`

```bash
 ls -at /tmp | grep $(date)
 ls -at /tmp | grep "$date"
```

![image](img/ls-al.png)

+ 查看用户信息 命令 `last`

```bash
 last
```

![image](img/last-user.png)

+ 查看系统中所有用户最近一次登陆消息 命令 `lastlog`

```bash
 lastlog
```

![image](img/lastlog.png)

+ 查看用户错误的登陆列表  `lastb`

```bash
 lastb
```

![image](img/lastb.png)

+ 查看用户登陆时间 命令 `uptime`

```bash
 uptime
```

![image](img/uptime.png)

+ 查看当前用户 命令`w` ， `who` ，`whoami` ， `users` 

```bash
 w 
 who
 whoami
 users
```

![image](img/w-user.png)

![image](img/who.png)

+ wc -l 计算文件内多少行 

```bash
wc -l
```

![](img/wc-l.png)


+ 解压缩命令：

+ “文件”的解压缩命令 有两种 ：

+ `gzip` +   （.gz结尾）

  +  `gzip`+文件名称    ---- 压缩文件 

  + `gunzip`  压缩包     ----解压缩

![](img/gunzip.png)


+  `bzip2`    （.bz2结尾）

  + `bzip`+ 文件名称   ---- 压缩文件

  + `bunzip2`+ 压缩包    --- 解压缩

+ “目录”进行打包压缩 命令：

  + （对.tar  包 进行 解压缩 操作 ）
```bash
tar -xf  xxx.tar  -C /root 

 -x 解压缩 tar 包。  -C（大写）  指定 解压缩后目录存放路径 

对 （*.tar.gz / *.tar.bz2 ）两种压缩文件进行 压缩 / 解压缩 操作 
```
+ 1、 *.tar.gz   
    +  压缩：  
`tar  -zcf  压缩后文件路径名称    被压缩的目录`

    + 解压缩：
`tar -zxf  被解压缩的压缩包    解压后存放路径`( -C 指定存放目录)

+ `tar -zvxf   *.tar.gz   `   显示所有文件  信息


+ 2、 *.tar.bz2 
	  
    +  压缩：
  `tar  -jcf 压缩后文件路径名称（*.tar.bz2） 被压缩的目录`

	+   解压缩：
     `tar -jxf  被解压缩的压缩包（*.tar.bz2）  解压后存放路径` ( -C 指定存放目录)   


+  总结： 

	`-z `     用于  zip  
	`-j `  用于bzip2


+ 分布进行：
     （*.tar.gz）源码包

 	1、 `gunzip   *.tar.gz  `   [-C  路径]
	
  2、 `tar -xf  *.tar    `  [-C  路径]

![](img/tar-xf-ls-ld.png)

 + `ls /ls -l/ls -lh 目录 / ls-lhd `
 
 ![](img/file-ls-lhd.png)

 +  （显示目录内文件大小 /显。示文件目录内容/ 查看目录内容及大小（人类可读方式）/ 查看当前目录大写 ）


+ `du -sh`  目录       查看当前目录内文件大小  （统计查看目录）

![](img/ls.du.png)

+ `file 文件名称`  ：分析文件类型

+` find / -name 名称` 按文件名查找

+ `apt search 文件名称 `  搜索文件包

![](img/apt-search.png)

+ github 下载 tar包，通过scp 从宿主机拷贝到 虚拟机，Debian11 指定位置， 

+ `tar -zxf *.tar.gz    目录
`

+ docker 安装  ：

https://docs.docker.com/engine/install/ubuntu/

安装操作文档一步一步执行即可   ，注意platform

+ 

+ docker 官方：
docker-ce 

+ Ubuntu官方：（kali内置）
docker.io

```bash
apt update && apt install docker.io python3-pip    [-y] 参数
```
安装完检查 ：
```bash
sudo systemctl status docker     查看dockers状态

sudo docker images  		查看 镜像文件
```
+ docker 默认管理员权限 

+ 修改权限 ：

+ 查看 当前用户属性 `id`

![](img/id.docker.png)

![](img/docker-ps-exec.png)


+ 把当前用户添加到docker 组

```bash
sudo usermod  -a -G docker tomc 
```
![](img/usermod-a-G.png)

![](img/id.docker.1.png)

+ 添加后重新登陆


+查看docker组：
 查看组文件

```bash
cat /etc/group
```
![](img/etc.group.png)

```bash
docker help /docker help push  #  查看命令 帮助

tldr docker    # 查看常用参数
```

![](img/docker.help.tldr.png)

```bash
docker version  #  查看docker版本 

```
![](img/docker.version.png)

+ docker命令简单分类整理助记忆：

![](img/dockercommand.png)

+ 安装pip3 

```bash
sudo apt  install python3-pip
```

+ 安装 docker-compose  

```bash
which docker-compose     #  查看是否已安装
apt policy docker-compose    #   查看可安装版本 
```
```bash
apt search docker-compose  # 搜索可用版本 
```
![](img/apt-search.1.png)


```bash
pip3 install docker-compose     #  用 python3中的 pip3  进行安装  
```
![](img/docker-compose.png)

```bash
git remote -v   #  查看从哪里clone的镜像   
```
![](img/git-remote-v.png)


+ 进入容器：
```bash
docker  ps   显示运行的容器

docker exec -it container(名称) bash     进入容器内部  
docker exec -it container(名称) sh
```

![](img/docker-exec-bash.png)

![](img/docker-ps-exec.png)

+ 查看当前所有可用shell 及位置

```bash
cat /etc/shells
```
![](img/etc-shells.png)


```bash
docker history   dinotools/dionaea（镜像名）  -- no --trunc          #反向解析 build过程  （不进行截断）
```
![](img/docker-history.png)

+ 可以进入 dokcerhub  远程仓库 查看进行对比：

```bash 
 docker run --rm -it  镜像名称  bash    #  进入 交互式镜像环境，PHP 
```
![](img/docker-ru-it.png)


```bash
docker cp 容器名称（ID）：路径/文件名称     ./(当前路径)                 # 从容器中copy 文件到宿主机 
 ```
![](img/docker-fromcon-host-cp.png)


+ history   #查询历史命令
```bash
!number  # 执行第number个 历史命令

 ！command    # 由最近命令向前搜索 指令以command  开头哪个指令 并执行` ！！`
 ```
![](img/history-number.png)

```bash
 !!     	#执行上一条指令 ，相当于 按上建后 按 enter
```
![image](img/history.png)


+ ` ping -c -n    domain`     # ping 包数 、不解析

![](img/ping-c-n.png)

+  `cd - `      # 返回上一个目录   ， 不小心 输入了 cd  回到了 根目录， 想返回之前的目录   就用此命令

![](img/cd-cd.png)

+  git bash中 `CTRL+l`     # 清屏      

+ Linux  查看环境中支持哪些 shell
```bash
  cat  /etc/shells  
```

+ kali 系统 ： machine-id   重置方法：
```bash  
  cat  /etc/machine-id
  cat /var/lib/dbus/machine-id
   # 此两处 machine-id  值需要一样 ，避免出现不必要的麻烦  

  sudo rm  /etc/machine-id  /var/lib/dbus/machine-id

# 重新生成 
  # 当文件machine-id 内容为空或者文件缺失时 ，创建   /var/lib/dbus/machine-id
 并写入 /etc/machine-id
 ```
 ```bash
   sudo dbus-uuidgen  --ensure
   sudo  systemd-machine-id-setup
```
![](img/kali-machine-id.png)




---
*待续*

----

---

**未完**

---

### 参考资料
* [Github网络安全链接](https://github.com/c4pr1c3/cuc-ns)

