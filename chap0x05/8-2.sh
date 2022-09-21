# 进阶算术运算请使用命令行工具 bc

# 计算 4 * arctangent(1) ，计算结果保留 10 位有效数字
# -l 表示使用标准数学库
pi=$(echo "scale=10; 4*a(1)" | bc -l)

# 计算 4 * arctangent(1) ，计算结果保留 1000 位有效数字
# 禁止输出结果因超长而自动折行
pi=$(BC_LINE_LENGTH=0 bc -l <<< "scale=1000; 4*a(1)")
# 获得字符串长度值
STRING="this is a string"
echo ${#STRING}            # 16

# 注意非拉丁语系字符串长度计算
M_STRING="中文"
export LC_ALL=C.UTF-8
echo ${#M_STRING}            # 2
export LC_ALL=C
echo ${#M_STRING}            # 6

# 字符串截取子串
STRING="this is a string"
POS=1
LEN=3
echo ${STRING:$POS:$LEN}   # his
echo ${STRING:1}           # $STRING contents without leading character
echo ${STRING:12}          # ring

# 注意非拉丁语系字符串截取
export LANG=C
echo -n "${M_STRING:0:1}" | xxd -p # e4
export LANG=C.UTF-8
echo -n "${M_STRING:0:1}" | xxd -p # e4b8ad

# 字符串查找并替换第一次匹配到的子串
STRING="to be or not to be"
echo ${STRING[@]/be/eat}   # to eat or not to be
# 字符串查找并替换所有匹配到的子串
STRING="to be or not to be"
echo ${STRING[@]//be/eat}  # to eat or not to eat

# 字符串查找并删除（替换为空）所有匹配到的子串
STRING="to be or not to be"
echo ${STRING[@]// not/}        # to be or to be

# 字符串查找并替换匹配到行首的子串
STRING="to be or not to be"
echo ${STRING[@]/#to be/eat now}    # eat now or not to be

# 字符串查找并替换匹配到行尾的子串
STRING="to be or not to be"
echo ${STRING[@]/%be/eat}        # to be or not to eat

# 字符串查找并使用子命令输出结果替换匹配项
STRING="to be or not to be"
echo ${STRING[@]/%be/be on $(date +%Y-%m-%d)}    # to be or not to be on 2012-06-14
数值比较运算表达式


