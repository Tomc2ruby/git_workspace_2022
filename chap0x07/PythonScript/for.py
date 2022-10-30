# for 循环 ， 从变量赋值 进行循环  


for item in "q":
    print("hello"+item)

for item in "python":     # 字符串
    print("hello: "+item)

for  item in ["tom","jerry","bob"]:   # 列表
    print("hello[]:"+item)

for item in ("tom","jerry","bob"):      # 元祖
    print ("hello(): "+item )

for item in {"tom":"123","jerry":"456","bob":"789"}:     #字典　
    print ("hello{}: "+item)

dicta = {"tom":"123","jerry":"456","bob":"789"}
for item in dicta :
    print ("hello{key}:"+ dicta[item])

sumn = 0
for item in range(0,11):    # 10 以内　偶数和，　或者　　基数和
　　item += 1
    if item % 2 :
        continue
    print (item)
    sumn += item
    print (sumn)
    
