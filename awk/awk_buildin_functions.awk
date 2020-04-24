AWK ���ú���

https://www.runoob.com/w3cnote/awk-built-in-functions.html

���� ��̼���
AWK ���ú�����Ҫ�����¼��֣�

��������
�ַ�������
ʱ�亯��
λ��������
��������
��������
������	˵��	ʵ��
atan2( y, x )	���� y/x �ķ����С�	
$ awk 'BEGIN {
  PI = 3.14159265
  x = -10
  y = 10
  result = atan2 (y,x) * 180 / PI;

  printf "The arc tangent for (x=%f, y=%f) is %f degrees\n", x, y, result
}'
������Ϊ��

The arc tangent for (x=-10.000000, y=10.000000) is 135.000000 degrees
cos( x )	���� x �����ң�x �ǻ��ȡ�	
$ awk 'BEGIN {
  PI = 3.14159265
  param = 60
  result = cos(param * PI / 180.0);

  printf "The cosine of %f degrees is %f.\n", param, result
}'
������Ϊ��

The cosine of 60.000000 degrees is 0.500000.
sin( x )	���� x �����ң�x �ǻ��ȡ�	
$ awk 'BEGIN {
  PI = 3.14159265
  param = 30.0
  result = sin(param * PI /180)

  printf "The sine of %f degrees is %f.\n", param, result
}'
������Ϊ��

The sine of 30.000000 degrees is 0.500000.
exp( x )	���� x �ݺ�����	
$ awk 'BEGIN {
  param = 5
  result = exp(param);

  printf "The exponential value of %f is %f.\n", param, result
}'
������Ϊ��

The exponential value of 5.000000 is 148.413159.
log( x )	���� x ����Ȼ������	
$ awk 'BEGIN {
  param = 5.5
  result = log (param)

  printf "log(%f) = %f\n", param, result
}'
������Ϊ��

log(5.500000) = 1.704748
sqrt( x )	���� x ƽ������	
$ awk 'BEGIN {
  param = 1024.0
  result = sqrt(param)

  printf "sqrt(%f) = %f\n", param, result
}'
������Ϊ��

sqrt(1024.000000) = 32.000000
int( x )	���� x �Ľض���������ֵ��	
$ awk 'BEGIN {
  param = 5.12345
  result = int(param)

  print "Truncated value =", result
}'
������Ϊ��

Truncated value = 5
rand( )	������������ n������ 0 <= n < 1��	
$ awk 'BEGIN {
  print "Random num1 =" , rand()
  print "Random num2 =" , rand()
  print "Random num3 =" , rand()
}'
������Ϊ��

Random num1 = 0.237788
Random num2 = 0.291066
Random num3 = 0.845814
srand( [Expr] )	�� rand ����������ֵ����Ϊ Expr ������ֵ�������ʡ�� Expr ������ʹ��ĳ���ʱ�䡣������ǰ������ֵ��	
$ awk 'BEGIN {
  param = 10

  printf "srand() = %d\n", srand()
  printf "srand(%d) = %d\n", param, srand(param)
}'
������Ϊ��

srand() = 1
srand(10) = 1417959587
�ַ�������
����	˵��	ʵ��
gsub( Ere, Repl, [ In ] )	gsub ��ȫ���滻( global substitution )����д������������ʽ���о���ֵ�������㣬���� sub ������ȫһ����ִ�С�	
$ awk 'BEGIN {
    str = "Hello, World"

    print "String before replacement = " str

    gsub("World", "Jerry", str)

    print "String after replacement = " str
}'
������Ϊ��

String before replacement = Hello, World
String after replacement = Hello, Jerry
sub(regex,sub,string)	sub ����ִ��һ���Ӵ��滻��������һ�γ��ֵ��Ӵ��� regex �滻�������������ǿ�ѡ�ģ�Ĭ��Ϊ $0��	
$ awk 'BEGIN {
    str = "Hello, World"

    print "String before replacement = " str

    sub("World", "Jerry", str)

    print "String after replacement = " str
}'
������Ϊ��

String before replacement = Hello, World
String after replacement = Hello, Jerry
substr(str, start, l)	substr �������� str �ַ����дӵ� start ���ַ���ʼ����Ϊ l ���Ӵ������û��ָ�� l ��ֵ������ str �ӵ� start ���ַ���ʼ�ĺ�׺�Ӵ���	
$ awk 'BEGIN {
    str = "Hello, World !!!"
    subs = substr(str, 1, 5)

    print "Substring = " subs
}'
������Ϊ��

Substring = Hello
index( String1, String2 )	���� String1 ����ָ�����ַ����������г��� String2 ָ���Ĳ������У�����λ�ã��� 1 ��ʼ��š���� String2 �������� String1 �����г��֣��򷵻� 0���㣩��	
$ awk 'BEGIN {
    str = "One Two Three"
    subs = "Two"

    ret = index(str, subs)

    printf "Substring \"%s\" found at %d location.\n", subs, ret
}'
������Ϊ��

Substring "Two" found at 5 location.
length [(String)]	���� String ����ָ�����ַ����ĳ��ȣ��ַ���ʽ�������δ���� String �������򷵻�������¼�ĳ��ȣ�$0 ��¼��������	
$ awk 'BEGIN {
    str = "Hello, World !!!"

    print "Length = ", length(str)
}'
������Ϊ��

Substring "Two" found at 5 location.
blength [(String)]	���� String ����ָ�����ַ����ĳ��ȣ����ֽ�Ϊ��λ�������δ���� String �������򷵻�������¼�ĳ��ȣ�$0 ��¼��������	 
substr( String, M, [ N ] )	���ؾ��� N ����ָ�����ַ������Ӵ����Ӵ��� String ����ָ�����ַ���ȡ�ã����ַ��� M ����ָ����λ�ÿ�ʼ��M ����ָ��Ϊ�� String �����еĵ�һ���ַ���Ϊ��� 1�����δָ�� N ���������Ӵ��ĳ��Ƚ��� M ����ָ����λ�õ� String ������ĩβ �ĳ��ȡ�	
$ awk 'BEGIN {
    str = "Hello, World !!!"
    subs = substr(str, 1, 5)

    print "Substring = " subs
}'
������Ϊ��

Substring = Hello
match( String, Ere )	�� String ����ָ�����ַ�����Ere ����ָ������չ������ʽ���������У��з���λ�ã��ַ���ʽ������ 1 ��ʼ��ţ������ Ere ���������֣��򷵻� 0���㣩��RSTART �����������Ϊ����ֵ��RLENGTH �����������Ϊƥ����ַ����ĳ��ȣ������δ�ҵ��κ�ƥ�䣬������Ϊ -1����һ����	
$ awk 'BEGIN {
    str = "One Two Three"
    subs = "Two"

    ret = match(str, subs)

    printf "Substring \"%s\" found at %d location.\n", subs, ret
}'
������Ϊ��

Substring "Two" found at 5 location.
split( String, A, [Ere] )	�� String ����ָ���Ĳ����ָ�Ϊ����Ԫ�� A[1], A[2], . . ., A[n]�������� n ������ֵ���˷ָ�����ͨ�� Ere ����ָ������չ������ʽ���У����õ�ǰ�ֶηָ�����FS ��������������У����û�и��� Ere ������������������ָ���ض���Ԫ�ػ�Ӧ����һ������ֵ������ A �����е�Ԫ�����ַ���ֵ��������	
$ awk 'BEGIN {
    str = "One,Two,Three,Four"

    split(str, arr, ",")

    print "Array contains following values"

    for (i in arr) {
        print arr[i]
    }
}'
������Ϊ��

Array contains following values
One
Two
Three
Four
tolower( String )	���� String ����ָ�����ַ������ַ�����ÿ����д�ַ�������ΪСд����д��Сд��ӳ���ɵ�ǰ���Ի����� LC_CTYPE ���붨�塣	
$ awk 'BEGIN {
    str = "HELLO, WORLD !!!"

    print "Lowercase string = " tolower(str)
}'
������Ϊ��

Lowercase string = hello, world !!!
toupper( String )	���� String ����ָ�����ַ������ַ�����ÿ��Сд�ַ�������Ϊ��д����д��Сд��ӳ���ɵ�ǰ���Ի����� LC_CTYPE ���붨�塣	
$ awk 'BEGIN {
    str = "hello, world !!!"

    print "Uppercase string = " toupper(str)
}'
������Ϊ��

Uppercase string = HELLO, WORLD !!!
sprintf(Format, Expr, Expr, . . . )	���� Format ����ָ���� printf �����̸�ʽ�ַ�������ʽ�� Expr ����ָ���ı��ʽ������������ɵ��ַ�����	
$ awk 'BEGIN {
    str = sprintf("%s", "Hello, World !!!")

    print str
}'
������Ϊ��

Hello, World !!!
strtonum(str)	strtonum ���ַ��� str ת��Ϊ��ֵ�� ����ַ����� 0 ��ʼ�����䵱��ʮ������������ַ����� 0x �� 0X ��ʼ�����䵱��ʮ�������������򣬽��䵱����������	
$ awk 'BEGIN {
    print "Decimal num = " strtonum("123")
    print "Octal num = " strtonum("0123")
    print "Hexadecimal num = " strtonum("0x123")
}'
������Ϊ��

Decimal num = 123
Octal num = 83
Hexadecimal num = 291
ע��Ere ���ֿ�����������ʽ��

1��gsub��sub ʹ��

$ awk 'BEGIN{info="this is a test2012test!";gsub(/[0-9]+/,"||",info);print info}'
this is a test||test!
2�������ַ�����index ʹ�ã�

ʹ������Ԫ�����: ���ʽ ? ����1 : ����2

$ awk 'BEGIN{info="this is a test2012test!";print index(info,"11111")?"ok":"no found";}'
no found
$ awk 'BEGIN{info="this is a test2012test!";print index(info,"is")?"ok":"no found";}'
ok
$ awk 'BEGIN{info="this is a test2012test!";print index(info,"test")?"ok":"no found";}'
ok
3��������ʽƥ�����(match ʹ�ã�

$ awk 'BEGIN{info="this is a test2012test!";print match(info,/[0-9]+/)?"ok":"no found";}'
ok
4����ȡ�ַ���(substrʹ�ã�

�ӵ� 4 �� �ַ���ʼ����ȡ 10 �������ַ�����

$ awk 'BEGIN{info="this is a test2012test!";print substr(info,4,10);}'
s is a tes
5���ַ����ָsplitʹ�ã�

$ awk 'BEGIN{info="this is a test";split(info,tA," ");print length(tA);for(k in tA){print k,tA[k];}}'
4
2 is
3 a
4 test
1 this
�ָ� info���� info �ַ���ʹ�ÿո��з�Ϊ��̬���� tA��ע�� awk for ��in ѭ������һ�������ѭ���� �����Ǵ������±� 1��n �����ʹ��ʱ����Ҫ�ر�ע�⡣

6����ʽ���ַ��������sprintfʹ�ã�

���и�ʽ���ַ�����������������: һ�����������ַ�����Щ�ַ�����ԭ�����; ��һ�����Ǹ�ʽ���涨�ַ��� �� % ��ʼ, ���һ���򼸸��涨�ַ�������ȷ��������ݸ�ʽ�� ��Ҫ�ر�ע�����ʹ�� printf ʱĬ���ǲ��ỻ�еģ��� print ����Ĭ�ϻ���ÿ�к������ \n ���з���

��ʽ��	˵��
%d	ʮ�����з�������
%u	ʮ�����޷�������
%f	������
%s	�ַ���
%c	�����ַ�
%p	ָ���ֵ
%e	ָ����ʽ�ĸ�����
%x	%X �޷�����ʮ�����Ʊ�ʾ������
%o	�޷����԰˽��Ʊ�ʾ������
%g	�Զ�ѡ����ʵı�ʾ��
$ awk 'BEGIN{n1=124.113;n2=-1.224;n3=1.2345; printf("%.2f,%.2u,%.2g,%X,%o\n",n1,n2,n3,n1,n1);}'
124.11,4294967295,1.2,7C,174
$  awk 'BEGIN{n1=124.113;n2=-1.224;n3=1.2645; printf("%.2f,%.2u,%.2g,%X,%o\n",n1,n2,n3,n1,n1);}'
124.11,4294967295,1.3,7C,174
ע��������� n3 ���ֵ�ᷢ�֣���ʹ�� printf ����ʱһ���Ƚ����ܵĹ����ǿ��Խ����������뱣��С����λ�ġ�

ʱ�亯��
������	˵��	ʵ��
mktime( YYYY MM DD HH MM SS[ DST])	����ʱ���ʽ	
$ awk 'BEGIN {
    print "Number of seconds since the Epoch = " mktime("2014 12 14 30 20 10")
}'
������Ϊ��

Number of seconds since the Epoch = 1418604610
strftime([format [, timestamp]])	��ʽ��ʱ���������ʱ���תΪʱ���ַ���
�����ʽ�����±�.	
$ awk 'BEGIN {
    print strftime("Time = %m/%d/%Y %H:%M:%S", systime())
}'
������Ϊ��

Time = 12/14/2014 22:08:42
systime()	�õ�ʱ���,���ش�1970��1��1�տ�ʼ����ǰʱ��(��������)��������	
awk 'BEGIN{now=systime();print now}'
������Ϊ��

1343210982
strftime ���ں�ʱ���ʽ˵����:

���	����
%a	������д(Mon-Sun)��
%A	����ȫ�ƣ�Monday-Sunday����
%b	�·���д��Jan����
%B	�·�ȫ�ƣ�January����
%c	����������ʱ�䡣
%C	����е����Ͳ��֣���ֵΪ�������100��
%d	ʮ��������(01-31)
%D	�ȼ��� %m/%d/%y.
%e	���ڣ����ֻ��һλ�������ÿո���
%F	�ȼ��� %Y-%m-%d����Ҳ�� ISO 8601 ��׼���ڸ�ʽ��
%g	ISO8610 ��׼�����ڵ����ģ�� 100��00-99)�����磬1993 �� 1 �� 1 ������ 1992 ��ĵ� 53 �ܡ����ԣ���Ȼ���� 1993 ��� 1 �죬�����䡡ISO8601 ��׼���������ȴ�� 1992��ͬ�������� 1973 �� 12 �� 31 ������ 1973 �굫����ȴ���� 1994 ��ĵ�һ�ܡ����� 1973 �� 12 �� 31 �յ� ISO8610����׼�����ڵ����� 1974 ������ 1973��
%G	ISO ��׼��������ݵ�ȫ�ơ�
%h	�ȼ��� %b.
%H	��ʮ���Ʊ�ʾ�� 24 Сʱ��ʽ��Сʱ(00-23)
%I	��ʮ���Ʊ�ʾ�� 12 Сʱ��ʽ��Сʱ��00-12��
%j	һ���еĵڼ��죨001-366��
%m	�·ݣ�01-12��
%M	��������00-59)
%n	���з� (ASCII LF)
%p	ʮ�����Ʊ�ʾ����AM/PM��
%r	ʮ�����Ʊ�ʾ����ʱ�䣨�ȼ��� %I:%M:%S %p����
%R	�ȼ��� %H:%M��
%S	ʱ�������ֵ��00-60��
%t	�Ʊ�� (tab)
%T	�ȼ��� %H:%M:%S��
%u	�����ֱ�ʾ������(1-7),1 ��ʾ����һ��
%U	һ���еĵڼ������ڣ���һ����������Ϊ��һ�ܵĿ�ʼ����00-53
%V	һ���еĵڼ������ڣ���һ������һ��Ϊ��һ�ܵĿ�ʼ����01-53��
%w	�����ֱ�ʾ�����ڣ�0-6����0��ʾ������ ��
%W	ʮ���Ʊ�ʾ��һ���еĵڼ������ڣ���һ������һ��Ϊ��һ�ܵĿ�ʼ����00-53��
%x	�������ڱ�ʾ
%X	����ʱ���ʾ
%y	���ģ�� 100��
%Y	ʮ���Ʊ�ʾ��������ݡ�
%z	ʱ������ʾ��ʽΪ+HHMM�����磬��ʽҪ�����ɵ� RFC 822���� RFC 1036 ʱ��ͷ��
%Z	ʱ�����ƻ���д�����ʱ���������������
λ��������
������	˵��	ʵ��
and	λ�������	
$ awk 'BEGIN {
    num1 = 10
    num2 = 6

    printf "(%d AND %d) = %d\n", num1, num2, and(num1, num2)
}'
������Ϊ��

(10 AND 6) = 2
compl	��λ�󲹡�	
$ awk 'BEGIN {
    num1 = 10

    printf "compl(%d) = %d\n", num1, compl(num1)
}'
������Ϊ��

compl(10) = 9007199254740981
lshift	����λ����	
$ awk 'BEGIN {
    num1 = 10

    printf "lshift(%d) by 1 = %d\n", num1, lshift(num1, 1)
}'
������Ϊ��

lshift(10) by 1 = 20
rshift	����λ����	
$ awk 'BEGIN {
    num1 = 10

    printf "rshift(%d) by 1 = %d\n", num1, rshift(num1, 1)
}'
������Ϊ��

rshift(10) by 1 = 5
or	��λ�����	
$ awk 'BEGIN {
    num1 = 10
    num2 = 6

    printf "(%d OR %d) = %d\n", num1, num2, or(num1, num2)
}'
������Ϊ��

(10 OR 6) = 14
xor	��λ������	
$ awk 'BEGIN {
    num1 = 10
    num2 = 6

    printf "(%d XOR %d) = %d\n", num1, num2, xor(num1, num2)
}'
������Ϊ��

(10 bitwise xor 6) = 12
��������
������	˵��	ʵ��
close(expr)	�رչܵ����ļ�	
$ awk 'BEGIN {
    cmd = "tr [a-z] [A-Z]"
    print "hello, world !!!" |& cmd
    close(cmd, "to")
    cmd |& getline out
    print out;
    close(cmd);
}'
������Ϊ��

HELLO, WORLD !!!
��һ����� cmd = "tr [a-z] [A-Z]" �ڡ�AWK �н�����һ��˫���ͨ��ͨ����
�ڶ������ print Ϊ tr �����ṩ���롣&| ��ʾ˫��ͨ�š�
��������� close(cmd, "to") ���ִ�к�ر� to ���̡�
��������� cmd |& getline out ʹ�� getline ����������洢�� out �����С�
���������������ӡ��������ݣ���� close �����ر� cmd��
delete	���ڴ�������ɾ��Ԫ��	
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
������Ϊ��

Array elements before delete operation:
One
Two
Three
Four

Array elements after delete operation:
Three
Four
exit	��ֹ�ű�ִ�У������Խ��ܿ�ѡ�Ĳ��� expr ���� AWK ����״̬��	
$ awk 'BEGIN {
    print "Hello, World !!!"

    exit 10

    print "AWK never executes this statement."
}'
������Ϊ��

Hello, World !!!
flush	ˢ�´��ļ���ܵ��Ļ�����	 
getline	������һ��	
ʹ�� getline ���ļ� marks.txt �ж���һ�в������

$ awk '{getline; print $0}' marks.txt 
��AWK ���ļ� marks.txt �ж���һ�д洢������ 0 �С�����һ������У�����ʹ�� getline ������һ�С����AWK����ڶ��в��洢�� 0 �С����AWK ʹ�� print ����ڶ��е����ݡ��������һֱ���ļ�������

next	ֹͣ����ǰ��¼�����ҽ��뵽��һ����¼�Ĵ�����̡�	
��ģʽ��ƥ��ɹ�����򲢲�ִ���κβ�����

$ awk '{if ($0 ~/Shyam/) next; print $0}' marks.txt
nextfile	ֹͣ����ǰ�ļ�������һ���ļ���һ����¼��ʼ����	
���ȴ��������ļ��� file1.txt ��������:

file1:str1
file1:str2
file1:str3
file1:str4
�ļ� file2.txt �������£�

file2:str1
file2:str2
file2:str3
file2:str4
�������������� nextfile ������

$ awk '{ if ($0 ~ /file1:str2/) nextfile; print $0 }' file1.txt file2.txt
������Ϊ��

file1:str1
file2:str1
file2:str2
file2:str3
file2:str4
return	���û��Զ���ĺ����з���ֵ����ע�⣬���û��ָ������ֵ����ô�ķ���ֵ��δ����ġ�	
�����ļ� functions.awk���������£�

function addition(num1, num2)
{
    result = num1 + num2

    return result
}

BEGIN {
    res = addition(10, 20)
    print "10 + 20 = " res
}
ִ�и��ļ���

$ awk -f functions.awk 
10 + 20 = 30
system	ִ���ض�������Ȼ�󷵻����˳�״̬������ֵΪ 0 ��ʾ����ִ�гɹ����� 0 ��ʾ����ִ��ʧ�ܡ�	
$ awk 'BEGIN { ret = system("date"); print "Return value = " ret }'
������Ϊ��

Sun Dec 21 23:16:07 IST 2014
Return value = 0
