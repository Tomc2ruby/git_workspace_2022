#!/bin/bash
# 将本段代码复制粘贴保存为一个文件，假设文件名为：test.sh
echo $3 # --> results with: banana

BIG=$5

echo "A $BIG costs just $6"

# 输出所有参数
echo "$@"

# 以下代码输出命令行参数的总数
echo $#
