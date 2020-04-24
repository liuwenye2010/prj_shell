条件语句
IF 语句
IF 条件语句语法格式如下：

if (condition)
    action
也可以使用花括号来执行一组操作：

if (condition)
{
    action-1
    action-1
    .
    .
    action-n
}
以下实例用来判断数字是奇数还是偶数：

(1) $ awk 'BEGIN {num = 10; if (num % 2 == 0) printf "%d 是偶数\n", num }'
输出结果为：
10 是偶数

IF - ELSE 语句
IF - ELSE 条件语句语法格式如下：

if (condition)
    action-1
else
    action-2
在条件语句 condition 为 true 时只需 action-1，否则执行 action-2。

(2)
$ awk 'BEGIN {
    num = 11; 
    if (num % 2 == 0) printf "%d 是偶数\n", num; 
    else printf "%d 是奇数\n", num 
}'
输出结果为：

11 是奇数
IF - ELSE - IF
我们可以创建多个 IF - ELSE 格式的判断语句来实现多个条件的判断：

(3)
$ awk 'BEGIN {
a=30;
if (a==10)
  print "a = 10";
else if (a == 20)
  print "a = 20";
else if (a == 30)
  print "a = 30";
}'
输出结果为：

a = 30

循环
For
For 循环的语法如下：

for (initialisation; condition; increment/decrement)
    action
for 语句首先执行初始化动作( initialisation )，然后再检查条件( condition )。如果条件为真，则执行动作( action )，然后执行递增( increment )或者递减( decrement )操作。只要条件为 true 循环就会一直执行。每次循环结束都会进条件检查，若条件为 false 则结束循环。

下面的例子使用 For 循环输出数字 1 至 5：

(4)
$ awk 'BEGIN { for (i = 1; i <= 5; ++i) print i }'
输出结果为：

1
2
3
4
5


While
While 循环的语法如下：

while (condition)
    action
While 循环首先检查条件 condition 是否为 true ，若条件为 true 则执行动作 action。此过程一直重复直到条件 condition 为 flase 才停止。

下面是使用 While 循环输出数字 1 到 5 的例子：
(5)
$ awk 'BEGIN {i = 1; while (i < 6) { print i; ++i } }'
输出结果为：

1
2
3
4
5


Break
break 用以结束循环:

在下面的示例子中，当计算的和大于 50 的时候使用 break 结束循环：

$ awk 'BEGIN {
   sum = 0; for (i = 0; i < 20; ++i) { 
      sum += i; if (sum > 50) break; else print "Sum =", sum 
   } 
}'
输出结果为：

Sum = 0
Sum = 1
Sum = 3
Sum = 6
Sum = 10
Sum = 15
Sum = 21
Sum = 28
Sum = 36
Sum = 45


Continue
Continue 语句用于在循环体内部结束本次循环，从而直接进入下一次循环迭代。

下面的例子输出 1 到 20 之间的偶数：

$ awk 'BEGIN {for (i = 1; i <= 20; ++i) {if (i % 2 == 0) print i ; else continue} }'
输出结果为：

2
4
6
8
10
12
14
16
18
20


Exit
Exit 用于结束脚本程序的执行。

该函数接受一个整数作为参数表示 AWK 进程结束状态。 如果没有提供该参数，其默认状态为 0。

下面例子中当和大于 50 时结束 AWK 程序。

$ awk 'BEGIN {
   sum = 0; for (i = 0; i < 20; ++i) {
      sum += i; if (sum > 50) exit(10); else print "Sum =", sum 
   } 
}'
输出结果为：

Sum = 0
Sum = 1
Sum = 3
Sum = 6
Sum = 10
Sum = 15
Sum = 21
Sum = 28
Sum = 36
Sum = 45
让我们检查一下脚本执行后的返回状态：

$ echo $?
执行上面的命令可以得到如下的结果：

19