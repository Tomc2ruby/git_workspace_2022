# 利用I/O重定向机制

# 清空一个文件（文件大小变为0）
> file
# 用一段文本内容覆盖一个文件
echo "some string" > file
# 在文件尾部追加内容
echo "some string" >> file

# 读取文件的第一行并将其赋值给一个变量

# read是bash的内置函数
# read命令会从标准输入读取一行，并将其赋值给变量line。-r选项表示read将读取原生内容，所有字符都不会被转义，例如反斜线不会用于转义（只是反斜线）。输入重定向命令"<file"会打开文件并执行读操作，并且会将读取的内容以标准输入的形式提供给read命令。
read -r line < file
# read命令会删除特殊变量IFS所表示的字符。IFS是Internal Field Separator（内部字段分隔符）的缩写，它的值为用于分隔单词和行的字符组成的字符串。IFS的默认值为空格符、制表符和换行符组成的字符串。这意味着前导和尾随的空格符和制表符都会被删除。如果你想保留这些字符，你可以将IFS设置为空字符：
IFS= read -r line < file
# 利用外部程序head
line=$(head -1 file)
line=`head -1 file`

# 构造一个「畸形」测试用例
echo -n -e " 123 \x0a456" > file
# 逐行读文件 **有 BUG**
while read -r line; do
      # do something with $line
      echo "$line" | xxd -p
done < file
# 逐行读文件，防止行两端的空白字符被删除 **依然有 BUG**
while IFS= read -r line; do
      # do something with $line
      echo "$line" | xxd -p
done < file
# 文件读写的最佳实践
while IFS= read -r line || [[ -n "$line" ]]; do
      # do something with $line
      echo "$line" | xxd -p
done < file
