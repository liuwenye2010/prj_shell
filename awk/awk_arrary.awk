AWK 数组
分类 编程技术
　
AWK 可以使用关联数组这种数据结构，索引可以是数字或字符串。

AWK关联数 组也不需要提前声明其大小，因为它在运行时可以自动的增大或减小。

数组使用的语法格式：

array_name[index]=value
array_name：数组的名称
index：数组索引
value：数组中元素所赋予的值
创建数组
接下来看一下如何创建数组以及如何访问数组元素：

$ awk 'BEGIN {
sites["runoob"]="www.runoob.com";
sites["google"]="www.google.com"
print sites["runoob"] "\n" sites["google"]
}'
执行以上命令，输出结果为：

www.runoob.com
www.google.com
在上面的例子中，我们定义了一个站点(sites)数组，该数组的索引为网站英文简称，值为网站访问地址。可以使用如下格式访问数组元素：

array_name[index] 
删除数组元素
我们可以使用 delete 语句来删除数组元素，语法格式如下：

delete array_name[index
下面的例子中，数组中的 google 元素被删除（删除命令没有输出）：

$ awk 'BEGIN {
sites["runoob"]="www.runoob.com";
sites["google"]="www.google.com"
delete sites["google"];
print fruits["google"]
}'
多维数组
AWK 本身不支持多维数组，不过我们可以很容易地使用一维数组模拟实现多维数组。

如下示例为一个 3x3 的三维数组：

100 200 300
400 500 600
700 800 900
以上实例中，array[0][0] 存储 100，array[0][1] 存储 200 ，依次类推。为了在 array[0][0] 处存储 100, 我们可以使用如下语法： array["0,0"] = 100。

我们使用了 0,0 作为索引，但是这并不是两个索引值。事实上，它是一个字符串索引 0,0。

下面是模拟二维数组的例子：

$ awk 'BEGIN {
array["0,0"] = 100;
array["0,1"] = 200;
array["0,2"] = 300;
array["1,0"] = 400;
array["1,1"] = 500;
array["1,2"] = 600;
# 输出数组元素
print "array[0,0] = " array["0,0"];
print "array[0,1] = " array["0,1"];
print "array[0,2] = " array["0,2"];
print "array[1,0] = " array["1,0"];
print "array[1,1] = " array["1,1"];
print "array[1,2] = " array["1,2"];
}'
执行上面的命令可以得到如下结果：

array[0,0] = 100
array[0,1] = 200
array[0,2] = 300
array[1,0] = 400
array[1,1] = 500
array[1,2] = 600
在数组上可以执行很多操作，比如，使用 asort 完成数组元素的排序，或者使用 asorti 实现数组索引的排序等等。