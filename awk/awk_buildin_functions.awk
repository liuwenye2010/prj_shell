AWK 内置函数

https://www.runoob.com/w3cnote/awk-built-in-functions.html

分类 编程技术
AWK 内置函数主要有以下几种：

算数函数
字符串函数
时间函数
位操作函数
其它函数
算数函数
函数名	说明	实例
atan2( y, x )	返回 y/x 的反正切。	
$ awk 'BEGIN {
  PI = 3.14159265
  x = -10
  y = 10
  result = atan2 (y,x) * 180 / PI;

  printf "The arc tangent for (x=%f, y=%f) is %f degrees\n", x, y, result
}'
输出结果为：

The arc tangent for (x=-10.000000, y=10.000000) is 135.000000 degrees
cos( x )	返回 x 的余弦；x 是弧度。	
$ awk 'BEGIN {
  PI = 3.14159265
  param = 60
  result = cos(param * PI / 180.0);

  printf "The cosine of %f degrees is %f.\n", param, result
}'
输出结果为：

The cosine of 60.000000 degrees is 0.500000.
sin( x )	返回 x 的正弦；x 是弧度。	
$ awk 'BEGIN {
  PI = 3.14159265
  param = 30.0
  result = sin(param * PI /180)

  printf "The sine of %f degrees is %f.\n", param, result
}'
输出结果为：

The sine of 30.000000 degrees is 0.500000.
exp( x )	返回 x 幂函数。	
$ awk 'BEGIN {
  param = 5
  result = exp(param);

  printf "The exponential value of %f is %f.\n", param, result
}'
输出结果为：

The exponential value of 5.000000 is 148.413159.
log( x )	返回 x 的自然对数。	
$ awk 'BEGIN {
  param = 5.5
  result = log (param)

  printf "log(%f) = %f\n", param, result
}'
输出结果为：

log(5.500000) = 1.704748
sqrt( x )	返回 x 平方根。	
$ awk 'BEGIN {
  param = 1024.0
  result = sqrt(param)

  printf "sqrt(%f) = %f\n", param, result
}'
输出结果为：

sqrt(1024.000000) = 32.000000
int( x )	返回 x 的截断至整数的值。	
$ awk 'BEGIN {
  param = 5.12345
  result = int(param)

  print "Truncated value =", result
}'
输出结果为：

Truncated value = 5
rand( )	返回任意数字 n，其中 0 <= n < 1。	
$ awk 'BEGIN {
  print "Random num1 =" , rand()
  print "Random num2 =" , rand()
  print "Random num3 =" , rand()
}'
输出结果为：

Random num1 = 0.237788
Random num2 = 0.291066
Random num3 = 0.845814
srand( [Expr] )	将 rand 函数的种子值设置为 Expr 参数的值，或如果省略 Expr 参数则使用某天的时间。返回先前的种子值。	
$ awk 'BEGIN {
  param = 10

  printf "srand() = %d\n", srand()
  printf "srand(%d) = %d\n", param, srand(param)
}'
输出结果为：

srand() = 1
srand(10) = 1417959587
字符串函数
函数	说明	实例
gsub( Ere, Repl, [ In ] )	gsub 是全局替换( global substitution )的缩写。除了正则表达式所有具体值被替代这点，它和 sub 函数完全一样地执行。	
$ awk 'BEGIN {
    str = "Hello, World"

    print "String before replacement = " str

    gsub("World", "Jerry", str)

    print "String after replacement = " str
}'
输出结果为：

String before replacement = Hello, World
String after replacement = Hello, Jerry
sub(regex,sub,string)	sub 函数执行一次子串替换。它将第一次出现的子串用 regex 替换。第三个参数是可选的，默认为 $0。	
$ awk 'BEGIN {
    str = "Hello, World"

    print "String before replacement = " str

    sub("World", "Jerry", str)

    print "String after replacement = " str
}'
输出结果为：

String before replacement = Hello, World
String after replacement = Hello, Jerry
substr(str, start, l)	substr 函数返回 str 字符串中从第 start 个字符开始长度为 l 的子串。如果没有指定 l 的值，返回 str 从第 start 个字符开始的后缀子串。	
$ awk 'BEGIN {
    str = "Hello, World !!!"
    subs = substr(str, 1, 5)

    print "Substring = " subs
}'
输出结果为：

Substring = Hello
index( String1, String2 )	在由 String1 参数指定的字符串（其中有出现 String2 指定的参数）中，返回位置，从 1 开始编号。如果 String2 参数不在 String1 参数中出现，则返回 0（零）。	
$ awk 'BEGIN {
    str = "One Two Three"
    subs = "Two"

    ret = index(str, subs)

    printf "Substring \"%s\" found at %d location.\n", subs, ret
}'
输出结果为：

Substring "Two" found at 5 location.
length [(String)]	返回 String 参数指定的字符串的长度（字符形式）。如果未给出 String 参数，则返回整个记录的长度（$0 记录变量）。	
$ awk 'BEGIN {
    str = "Hello, World !!!"

    print "Length = ", length(str)
}'
输出结果为：

Substring "Two" found at 5 location.
blength [(String)]	返回 String 参数指定的字符串的长度（以字节为单位）。如果未给出 String 参数，则返回整个记录的长度（$0 记录变量）。	 
substr( String, M, [ N ] )	返回具有 N 参数指定的字符数量子串。子串从 String 参数指定的字符串取得，其字符以 M 参数指定的位置开始。M 参数指定为将 String 参数中的第一个字符作为编号 1。如果未指定 N 参数，则子串的长度将是 M 参数指定的位置到 String 参数的末尾 的长度。	
$ awk 'BEGIN {
    str = "Hello, World !!!"
    subs = substr(str, 1, 5)

    print "Substring = " subs
}'
输出结果为：

Substring = Hello
match( String, Ere )	在 String 参数指定的字符串（Ere 参数指定的扩展正则表达式出现在其中）中返回位置（字符形式），从 1 开始编号，或如果 Ere 参数不出现，则返回 0（零）。RSTART 特殊变量设置为返回值。RLENGTH 特殊变量设置为匹配的字符串的长度，或如果未找到任何匹配，则设置为 -1（负一）。	
$ awk 'BEGIN {
    str = "One Two Three"
    subs = "Two"

    ret = match(str, subs)

    printf "Substring \"%s\" found at %d location.\n", subs, ret
}'
输出结果为：

Substring "Two" found at 5 location.
split( String, A, [Ere] )	将 String 参数指定的参数分割为数组元素 A[1], A[2], . . ., A[n]，并返回 n 变量的值。此分隔可以通过 Ere 参数指定的扩展正则表达式进行，或用当前字段分隔符（FS 特殊变量）来进行（如果没有给出 Ere 参数）。除非上下文指明特定的元素还应具有一个数字值，否则 A 数组中的元素用字符串值来创建。	
$ awk 'BEGIN {
    str = "One,Two,Three,Four"

    split(str, arr, ",")

    print "Array contains following values"

    for (i in arr) {
        print arr[i]
    }
}'
输出结果为：

Array contains following values
One
Two
Three
Four
tolower( String )	返回 String 参数指定的字符串，字符串中每个大写字符将更改为小写。大写和小写的映射由当前语言环境的 LC_CTYPE 范畴定义。	
$ awk 'BEGIN {
    str = "HELLO, WORLD !!!"

    print "Lowercase string = " tolower(str)
}'
输出结果为：

Lowercase string = hello, world !!!
toupper( String )	返回 String 参数指定的字符串，字符串中每个小写字符将更改为大写。大写和小写的映射由当前语言环境的 LC_CTYPE 范畴定义。	
$ awk 'BEGIN {
    str = "hello, world !!!"

    print "Uppercase string = " toupper(str)
}'
输出结果为：

Uppercase string = HELLO, WORLD !!!
sprintf(Format, Expr, Expr, . . . )	根据 Format 参数指定的 printf 子例程格式字符串来格式化 Expr 参数指定的表达式并返回最后生成的字符串。	
$ awk 'BEGIN {
    str = sprintf("%s", "Hello, World !!!")

    print str
}'
输出结果为：

Hello, World !!!
strtonum(str)	strtonum 将字符串 str 转换为数值。 如果字符串以 0 开始，则将其当作十进制数；如果字符串以 0x 或 0X 开始，则将其当作十六进制数；否则，将其当作浮点数。	
$ awk 'BEGIN {
    print "Decimal num = " strtonum("123")
    print "Octal num = " strtonum("0123")
    print "Hexadecimal num = " strtonum("0x123")
}'
输出结果为：

Decimal num = 123
Octal num = 83
Hexadecimal num = 291
注：Ere 部分可以是正则表达式。

1、gsub、sub 使用

$ awk 'BEGIN{info="this is a test2012test!";gsub(/[0-9]+/,"||",info);print info}'
this is a test||test!
2、查找字符串（index 使用）

使用了三元运算符: 表达式 ? 动作1 : 动作2

$ awk 'BEGIN{info="this is a test2012test!";print index(info,"11111")?"ok":"no found";}'
no found
$ awk 'BEGIN{info="this is a test2012test!";print index(info,"is")?"ok":"no found";}'
ok
$ awk 'BEGIN{info="this is a test2012test!";print index(info,"test")?"ok":"no found";}'
ok
3、正则表达式匹配查找(match 使用）

$ awk 'BEGIN{info="this is a test2012test!";print match(info,/[0-9]+/)?"ok":"no found";}'
ok
4、截取字符串(substr使用）

从第 4 个 字符开始，截取 10 个长度字符串。

$ awk 'BEGIN{info="this is a test2012test!";print substr(info,4,10);}'
s is a tes
5、字符串分割（split使用）

$ awk 'BEGIN{info="this is a test";split(info,tA," ");print length(tA);for(k in tA){print k,tA[k];}}'
4
2 is
3 a
4 test
1 this
分割 info，将 info 字符串使用空格切分为动态数组 tA。注意 awk for …in 循环，是一个无序的循环。 并不是从数组下标 1…n ，因此使用时候需要特别注意。

6、格式化字符串输出（sprintf使用）

其中格式化字符串包括两部分内容: 一部分是正常字符，这些字符将按原样输出; 另一部分是格式化规定字符， 以 % 开始, 后跟一个或几个规定字符，用来确定输出内容格式。 需要特别注意的是使用 printf 时默认是不会换行的，而 print 函数默认会在每行后面加上 \n 换行符。

格式符	说明
%d	十进制有符号整数
%u	十进制无符号整数
%f	浮点数
%s	字符串
%c	单个字符
%p	指针的值
%e	指数形式的浮点数
%x	%X 无符号以十六进制表示的整数
%o	无符号以八进制表示的整数
%g	自动选择合适的表示法
$ awk 'BEGIN{n1=124.113;n2=-1.224;n3=1.2345; printf("%.2f,%.2u,%.2g,%X,%o\n",n1,n2,n3,n1,n1);}'
124.11,4294967295,1.2,7C,174
$  awk 'BEGIN{n1=124.113;n2=-1.224;n3=1.2645; printf("%.2f,%.2u,%.2g,%X,%o\n",n1,n2,n3,n1,n1);}'
124.11,4294967295,1.3,7C,174
注：看上面的 n3 输出值会发现，在使用 printf 处理时一个比较智能的功能是可以进行四舍五入保留小数点位的。

时间函数
函数名	说明	实例
mktime( YYYY MM DD HH MM SS[ DST])	生成时间格式	
$ awk 'BEGIN {
    print "Number of seconds since the Epoch = " mktime("2014 12 14 30 20 10")
}'
输出结果为：

Number of seconds since the Epoch = 1418604610
strftime([format [, timestamp]])	格式化时间输出，将时间戳转为时间字符串
具体格式，见下表.	
$ awk 'BEGIN {
    print strftime("Time = %m/%d/%Y %H:%M:%S", systime())
}'
输出结果为：

Time = 12/14/2014 22:08:42
systime()	得到时间戳,返回从1970年1月1日开始到当前时间(不计闰年)的整秒数	
awk 'BEGIN{now=systime();print now}'
输出结果为：

1343210982
strftime 日期和时间格式说明符:

序号	描述
%a	星期缩写(Mon-Sun)。
%A	星期全称（Monday-Sunday）。
%b	月份缩写（Jan）。
%B	月份全称（January）。
%c	本地日期与时间。
%C	年份中的世纪部分，其值为年份整除100。
%d	十进制日期(01-31)
%D	等价于 %m/%d/%y.
%e	日期，如果只有一位数字则用空格补齐
%F	等价于 %Y-%m-%d，这也是 ISO 8601 标准日期格式。
%g	ISO8610 标准周所在的年份模除 100（00-99)。比如，1993 年 1 月 1 日属于 1992 年的第 53 周。所以，虽然它是 1993 年第 1 天，但是其　ISO8601 标准周所在年份却是 1992。同样，尽管 1973 年 12 月 31 日属于 1973 年但是它却属于 1994 年的第一周。所以 1973 年 12 月 31 日的 ISO8610　标准周所在的年是 1974 而不是 1973。
%G	ISO 标准周所在年份的全称。
%h	等价于 %b.
%H	用十进制表示的 24 小时格式的小时(00-23)
%I	用十进制表示的 12 小时格式的小时（00-12）
%j	一年中的第几天（001-366）
%m	月份（01-12）
%M	分钟数（00-59)
%n	换行符 (ASCII LF)
%p	十二进制表示法（AM/PM）
%r	十二进制表示法的时间（等价于 %I:%M:%S %p）。
%R	等价于 %H:%M。
%S	时间的秒数值（00-60）
%t	制表符 (tab)
%T	等价于 %H:%M:%S。
%u	以数字表示的星期(1-7),1 表示星期一。
%U	一年中的第几个星期（第一个星期天作为第一周的开始），00-53
%V	一年中的第几个星期（第一个星期一作为第一周的开始），01-53。
%w	以数字表示的星期（0-6），0表示星期日 。
%W	十进制表示的一年中的第几个星期（第一个星期一作为第一周的开始），00-53。
%x	本地日期表示
%X	本地时间表示
%y	年份模除 100。
%Y	十进制表示的完整年份。
%z	时区，表示格式为+HHMM（例如，格式要求生成的 RFC 822或者 RFC 1036 时间头）
%Z	时区名称或缩写，如果时区待定则无输出。
位操作函数
函数名	说明	实例
and	位与操作。	
$ awk 'BEGIN {
    num1 = 10
    num2 = 6

    printf "(%d AND %d) = %d\n", num1, num2, and(num1, num2)
}'
输出结果为：

(10 AND 6) = 2
compl	按位求补。	
$ awk 'BEGIN {
    num1 = 10

    printf "compl(%d) = %d\n", num1, compl(num1)
}'
输出结果为：

compl(10) = 9007199254740981
lshift	左移位操作	
$ awk 'BEGIN {
    num1 = 10

    printf "lshift(%d) by 1 = %d\n", num1, lshift(num1, 1)
}'
输出结果为：

lshift(10) by 1 = 20
rshift	右移位操作	
$ awk 'BEGIN {
    num1 = 10

    printf "rshift(%d) by 1 = %d\n", num1, rshift(num1, 1)
}'
输出结果为：

rshift(10) by 1 = 5
or	按位或操作	
$ awk 'BEGIN {
    num1 = 10
    num2 = 6

    printf "(%d OR %d) = %d\n", num1, num2, or(num1, num2)
}'
输出结果为：

(10 OR 6) = 14
xor	按位异或操作	
$ awk 'BEGIN {
    num1 = 10
    num2 = 6

    printf "(%d XOR %d) = %d\n", num1, num2, xor(num1, num2)
}'
输出结果为：

(10 bitwise xor 6) = 12
其他函数
函数名	说明	实例
close(expr)	关闭管道的文件	
$ awk 'BEGIN {
    cmd = "tr [a-z] [A-Z]"
    print "hello, world !!!" |& cmd
    close(cmd, "to")
    cmd |& getline out
    print out;
    close(cmd);
}'
输出结果为：

HELLO, WORLD !!!
第一条语句 cmd = "tr [a-z] [A-Z]" 在　AWK 中建立了一个双向的通信通道。
第二条语句 print 为 tr 命令提供输入。&| 表示双向通信。
第三条语句 close(cmd, "to") 完成执行后关闭 to 进程。
第四条语句 cmd |& getline out 使用 getline 函数将输出存储到 out 变量中。
接下来的输出语句打印输出的内容，最后 close 函数关闭 cmd。
delete	用于从数组中删除元素	
$ awk 'BEGIN {
    arr[0] = "One"
    arr[1] = "Two"
    arr[2] = "Three"
    arr[3] = "Four"

    print "Array elements before delete operation:"
    for (i in arr) {
        print arr[i]
    }

    delete arr[0]
    delete arr[1]

    print "Array elements after delete operation:"
    for (i in arr) {
        print arr[i]
    }
}'
输出结果为：

Array elements before delete operation:
One
Two
Three
Four

Array elements after delete operation:
Three
Four
exit	终止脚本执行，它可以接受可选的参数 expr 传递 AWK 返回状态。	
$ awk 'BEGIN {
    print "Hello, World !!!"

    exit 10

    print "AWK never executes this statement."
}'
输出结果为：

Hello, World !!!
flush	刷新打开文件或管道的缓冲区	 
getline	读入下一行	
使用 getline 从文件 marks.txt 中读入一行并输出：

$ awk '{getline; print $0}' marks.txt 
，AWK 从文件 marks.txt 中读入一行存储到变量 0 中。在下一条语句中，我们使用 getline 读入下一行。因此AWK读入第二行并存储到 0 中。最后，AWK 使用 print 输出第二行的内容。这个过程一直到文件结束。

next	停止处理当前记录，并且进入到下一条记录的处理过程。	
当模式串匹配成功后程序并不执行任何操作：

$ awk '{if ($0 ~/Shyam/) next; print $0}' marks.txt
nextfile	停止处理当前文件，从下一个文件第一个记录开始处理。	
首先创建两个文件。 file1.txt 内容如下:

file1:str1
file1:str2
file1:str3
file1:str4
文件 file2.txt 内容如下：

file2:str1
file2:str2
file2:str3
file2:str4
现在我们来测试 nextfile 函数。

$ awk '{ if ($0 ~ /file1:str2/) nextfile; print $0 }' file1.txt file2.txt
输出结果为：

file1:str1
file2:str1
file2:str2
file2:str3
file2:str4
return	从用户自定义的函数中返回值。请注意，如果没有指定返回值，那么的返回值是未定义的。	
创建文件 functions.awk，内容如下：

function addition(num1, num2)
{
    result = num1 + num2

    return result
}

BEGIN {
    res = addition(10, 20)
    print "10 + 20 = " res
}
执行该文件：

$ awk -f functions.awk 
10 + 20 = 30
system	执行特定的命令然后返回其退出状态。返回值为 0 表示命令执行成功；非 0 表示命令执行失败。	
$ awk 'BEGIN { ret = system("date"); print "Return value = " ret }'
输出结果为：

Sun Dec 21 23:16:07 IST 2014
Return value = 0
