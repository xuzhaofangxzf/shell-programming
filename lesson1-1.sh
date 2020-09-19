#! /bin/bash
# for file in $(ls /etc);
# do
# echo "get ${file}Script"
# done

# your_name="tom"
# echo $your_name
# your_name="alibaba"
# echo $your_name


# #!/bin/bash
# myUrl="https://www.google.com"
# # readonly myUrl
# myUrl="https://www.runoob.com"
# unset myUrl
# echo $myUrl
# echo

# str="this is a string"
# echo $str

# your_name='runoob'
# str="hello, I know you are $your_name! \n"
# echo $str

# #拼接字符串
# your_name="runoob"
# #使用双引号拼接
# greeting="hello, "$your_name" !"
# greeting_1="hello, ${your_name} !"
# echo $greeting $greeting_1
# #使用单引号拼接
# greeting_2='hello, '$your_name' !'
# greeting_3='hello, ${your_name} !'
# echo $greeting_2 $greeting_3


#获取字符串的长度
string="abcd"
echo ${#string} #输出 4

#提取子字符串
#从第1个字符开始截取4个字符
string="runoob is a great site"
echo ${string:1:4} #unoo
#查找字符 i 或 o 的位置(哪个字母先出现就计算哪个)：
echo `expr index "$string" io` #4
