#lesson1
'''
    变量替换总结
    1. ${变量#匹配规则} #从头开始匹配,最短删除\
    2. ${变量##匹配规则} #从头开始匹配,最长删除
    3. ${变量%匹配规则} #从尾部开始匹配,最短删除
    4. ${变量%%匹配规则} #从尾部开始匹配,最长删除

    5. ${变量/旧字符串/新字符串} #替换变量内的旧字符串为新字符串,只替换第一个
    6. ${变量//旧字符串/新字符串} #替换变量内的旧字符串为新字符串,替换全部的

'''
#变量名和等号之间不能有空格

variable_1="hello world"
echo $variable_1
#输出hello,world
#1.删除第一个匹配到ll之前的所有字符
var1=${variable_1#*ll}
echo $var1
#o world

#2.删除能匹配到最长的l的所有字符
var2=${variable_1##*l}
echo $var2
#d

#3.从尾部开始匹配 %
var3=${variable_1%l*}
echo $var3

#4.
var4=${variable_1%%l*}
echo $var4



var5=${PATH/bin/BIN}
echo $var5

var6=${PATH//bin/BIN}
echo $var6


for skill in Ada Coffe Action Java;do
    echo "I am good at ${skill}Script"
done
#如果不给skill变量加花括号，写成echo "I am good at $skillScript"，解释器就会把$skillScript当成一个变量（其值为空）
# I am good at AdaScript
# I am good at CoffeScript
# I am good at ActionScript
# I am good at JavaScript
#推荐给所有变量加上花括号，这是个好的编程习惯。

#已定义的变量，可以被重新定义，如：
your_name="tom"
echo $your_name
your_name="alibaba"
echo $your_name
#第二次赋值的时候不能写$your_name="alibaba",使用变量的时候才加$

#只读变量

'''
    使用readonly命令可以将变量定义为只读变量,只读变量的值不能被改变

'''
#!/bin/bash
myUrl="http://www.google.com"
readonly myUrl
myUrl="http://www.runoob.com"
#报错/bin/sh: myUrl: This variable is read only.


#删除变量
#使用unset命令删除变量,语法:unset variable_name,变量被删除后不能再次使用,unset命令不能删除只读变量

#!/bin/bash
myUrl="http://www.runoob.com"
unset myUrl
echo $myUrl
#没有任何输出

#3. 变量的类型
#运行shell时,会同时存在三种变量:
#1) 局部变量 局部变量在脚本或命令中定义,仅在当前shell实例中有效,其他shell启动的程序不能访问局部变量
#2)环境变量 所有的程序,包括shell启动的程序,都能访问环境变量,有些程序需要环境变量来保证其正常运行.必要的时候shell脚本也可以定义环境变量.
#3)shell变量:shell变量是由shell程序设置的特殊变量.shell变量中由一部分是环境变量,有一部分是局部变量,这些变量保证了shell的正常运行.
#4. shell字符串
'''
字符串是shell变成中最常用最有用的数据类型(除了数字和字符串,也没啥其他类型好用了),字符串可以用单引号,也可以用双引号,也可以不用引号
'''
#4.1单引号
str='this is a string'
'''
单引号字符的限制:
    单引号里的任何字符都会原样输出,单引号字符串中的变量是无效的;
    单引号字符串中不能出现单独的一个单引号(对单引号使用转义字符也不行),但可成对出现,作为字符串的拼接使用.
'''
#4.2双引号
your_name='runoob'
str="hello,I know you are \"$your_name\"! \n"
echo -e $str #-e 识别\n换行
'''
    双引号的优点:
        双引号里可以由变量
        双引号里可以出现转义字符
'''
#5. 拼接字符串
your_name="runoob"
#使用双引号拼接
greeting_1="hello, "$your_name" !"
greeting="hello, ${your_name} !"
echo $greeting $greeting_1
# hello, runoob ! hello, runoob !

#使用单引号拼接
greeting_2='hello, '$your_name' !'
greeting_3='hello, ${your_name}'
echo $greeting_2 $greeting_3

#hello, runoob ! hello, ${your_name}

#获取字符串的长度

string="abcdefg"
echo ${#string}
#4



#获取子字符串
string="runoob is a great site"
echo ${string:1:4} #unoo

#查找字符串, 查找字符i或o的位置(那个字母先出现就计算哪个)
strign="runoob is a great site"
echo `expr index "$string" io` #4


#shell数组
'''
    bash支持一维数组（不支持多维数组），并且没有限定数组的大小。
    类似于 C 语言，数组元素的下标由 0 开始编号。获取数组中的元素要利用下标，下标可以是整数或算术表达式，其值应大于或等于 0。
'''
#定义数组
#在shell中,用括号来表示数组,数组元素用"空格"符号分隔开,定义数组的一般形式为:
#数组名=(值1 值2 值3 ... 值n)
array_name={value0 value1 value2 value3}
array_name={
    value0
    value1
    value2
    value3

}
array_name[0]=value0
array_name[1]=value1
array_name[2]=value2
#读取数组:${数组名[下标]}
valuen=${array_name[n]}
#使用@符号key8i获取数组中所有的元素
echo ${array_name[@]}


#获取数组长度
#获取数组元素的个数
length=${#array_name[@]}
#or
length=${#array_name[*]}
#取得数组单个元素的长度
lengthn=${#array_name[n]}


#多行注释
:<<EOF
注释内容...
只是内容...
注释内容...

EOF

#or
:<<'
注释内容...
注释内容...
'

#or

:<<!
注释内容...
注释内容...
!
