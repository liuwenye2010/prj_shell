AWK 用户自定义函数
分类 编程技术
一个程序包含有多个功能，每个功能我们可以独立一个函数。

函数可以提高代码的复用性。

用户自定义函数的语法格式为：

function function_name(argument1, argument2, ...)
{
    function body
}
解析：

function_name 是用户自定义函数的名称。函数名称应该以字母开头，其后可以是数字、字母或下划线的自由组合。AWK 保留的关键字不能作为用户自定义函数的名称。
自定义函数可以接受多个输入参数，这些参数之间通过逗号分隔。参数并不是必须的。我们也可以定义没有任何输入参数的函数。
function body 是函数体部分，它包含 AWK 程序代码。
以下实例我们实现了两个简单函数，它们分别返回两个数值中的最小值和最大值。我们在主函数 main 中调用了这两个函数。 文件 functions.awk 代码如下：

# 返回最小值
function find_min(num1, num2)
{
  if (num1 < num2)
    return num1
  return num2
}

# 返回最大值
function find_max(num1, num2)
{
  if (num1 > num2)
    return num1
  return num2
}

# 主函数
function main(num1, num2)
{
  # 查找最小值
  result = find_min(10, 20)
  print "Minimum =", result

  # 查找最大值
  result = find_max(10, 20)
  print "Maximum =", result
}

# 脚本从这里开始执行
BEGIN {
  main(10, 20)
}  
执行 functions.awk 文件，可以得到如下的结果：

$ awk -f functions.awk 
Minimum = 10
Maximum = 20