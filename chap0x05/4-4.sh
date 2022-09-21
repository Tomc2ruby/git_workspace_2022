#!/usr/bin/env bash
# 代码填空，使用最终输出3个包含correct的语句
BIRTHDATE="Jan 1 2000"    # 填入一个字符串
Presents=10   # 填入一个整数
BIRTHDAY="Saturday"   # 使用命令替换方法赋值


# 测试代码 - 勿修改
set -x
if [ "$BIRTHDATE" == "Jan 1 2000" ] ; then
    echo "BIRTHDATE is correct, it is $BIRTHDATE"
else
    echo "BIRTHDATE is incorrect - please retry"
fi
set +x
if [ $Presents == 10 ] ; then
    echo "correct! I have received $Presents presents"
else
    echo "Presents is incorrect - please retry"
fi
if [ "$BIRTHDAY" == "Saturday" ] ; then
    echo "correct! I was born on a $BIRTHDAY"
else
    echo "BIRTHDAY is incorrect - please retry"
fi
