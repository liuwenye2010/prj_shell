Linux awk ����
https://www.runoob.com/linux/linux-comm-awk.html

AWK ����ԭ�� https://www.runoob.com/w3cnote/awk-work-principle.html

AWK ����   https://www.runoob.com/w3cnote/awk-arrays.html

AWK ���������ѭ�� https://www.runoob.com/w3cnote/awk-if-loop.html

AWK �û��Զ��庯�� https://www.runoob.com/w3cnote/awk-user-defined-functions.html

AWK ���ú��� https://www.runoob.com/w3cnote/awk-built-in-functions.html

8 �������� Awk �ڽ����� https://www.runoob.com/w3cnote/8-awesome-awk-built-in-variables.html

AWK �ٷ��ֲ� https://www.gnu.org/software/gawk/manual/gawk.html

man awk for more 
Linux �����ȫ Linux �����ȫ

AWK��һ�ִ����ı��ļ������ԣ���һ��ǿ����ı��������ߡ�

֮���Խ�AWK����Ϊ��ȡ����λ��ʼ�� Alfred Aho��Peter Weinberger, �� Brian Kernighan �� Family Name �����ַ���

�﷨
awk [ѡ�����] 'script' var=value file(s)
��
awk [ѡ�����] -f scriptfile var=value file(s)
ѡ�����˵����

-F fs or --field-separator fs
ָ�������ļ��۷ָ�����fs��һ���ַ���������һ���������ʽ����-F:��
-v var=value or --asign var=value
��ֵһ���û����������
-f scripfile or --file scriptfile
�ӽű��ļ��ж�ȡawk���
-mf nnn and -mr nnn
��nnnֵ�����������ƣ�-mfѡ�����Ʒ����nnn��������Ŀ��-mrѡ�����Ƽ�¼�������Ŀ��������������Bellʵ���Ұ�awk����չ���ܣ��ڱ�׼awk�в����á�
-W compact or --compat, -W traditional or --traditional
�ڼ���ģʽ������awk������gawk����Ϊ�ͱ�׼��awk��ȫһ�������е�awk��չ�������ԡ�
-W copyleft or --copyleft, -W copyright or --copyright
��ӡ��̵İ�Ȩ��Ϣ��
-W help or --help, -W usage or --usage
��ӡȫ��awkѡ���ÿ��ѡ��ļ��˵����
-W lint or --lint
��ӡ������ͳunixƽ̨��ֲ�Ľṹ�ľ��档
-W lint-old or --lint-old
��ӡ���ڲ�����ͳunixƽ̨��ֲ�Ľṹ�ľ��档
-W posix
�򿪼���ģʽ�������������ƣ���ʶ��/x�������ؼ��֡�func�����������Լ���fs��һ���ո�ʱ����������Ϊһ����ָ�����������**��**=���ܴ���^��^=��fflush��Ч��
-W re-interval or --re-inerval
��������������ʽ��ʹ�ã��ο�(grep�е�Posix�ַ���)�������ű���ʽ[[:alpha:]]��
-W source program-text or --source program-text
ʹ��program-text��ΪԴ���룬����-f������á�
-W version or --version
��ӡbug������Ϣ�İ汾��


�����÷�
log.txt�ı��������£�

2 this is a test
3 Are you like awk
This's a test
10 There are orange,apple,mongo
 �÷�һ��

awk '{[pattern] action}' {filenames}   # ��ƥ����� awk '' ֻ���õ�����
ʵ����

(1) ÿ�а��ո��TAB�ָ����ı��е�1��4��
 $ awk '{print $1,$4}' log.txt
 ---------------------------------------------
 2 a
 3 like
 This's
 10 orange,apple,mongo
(2) ��ʽ�����
 $ awk '{printf "%-8s %-10s\n",$1,$4}' log.txt
 ---------------------------------------------
 2        a
 3        like
 This's
 10       orange,apple,mongo
 
�÷�����

awk -F  #-F�൱�����ñ���FS, ָ���ָ��ַ�
ʵ����

(3) ʹ��","�ָ�
 $  awk -F, '{print $1,$2}'   log.txt
 ---------------------------------------------
 2 this is a test
 3 Are you like awk
 This's a test
 10 There are orange apple
(4) ����ʹ���ڽ�����
 $ awk 'BEGIN{FS=","} {print $1,$2}'     log.txt
 ---------------------------------------------
 2 this is a test
 3 Are you like awk
 This's a test
 10 There are orange apple
(5)ʹ�ö���ָ���,��ʹ�ÿո�ָȻ��Էָ�����ʹ��","�ָ�
 $ awk -F '[ ,]'  '{print $1,$2,$5}'   log.txt
 ---------------------------------------------
 2 this test
 3 Are awk
 This's a
 10 There apple
�÷�����

(6) awk -v  # ���ñ���
ʵ����

 $ awk -va=1 '{print $1,$1+a}' log.txt
 ---------------------------------------------
 2 3
 3 4
 This's 1
 10 11
 $ awk -va=1 -vb=s '{print $1,$1+a,$1b}' log.txt
 ---------------------------------------------
 2 3 2s
 3 4 3s
 This's 1 This'ss
 10 11 10s
�÷��ģ�

(7) awk -f {awk�ű�} {�ļ���}
ʵ����

 $ awk -f cal.awk log.txt

(8) �����
�����	����
= += -= *= /= %= ^= **=	��ֵ
?:	C��������ʽ
||	�߼���
&&	�߼���
~ �� !~	ƥ���������ʽ�Ͳ�ƥ���������ʽ
< <= > >= != ==	��ϵ�����
�ո�	����
+ -	�ӣ���
* / %	�ˣ���������
+ - !	һԪ�ӣ������߼���
^ ***	����
++ --	���ӻ���٣���Ϊǰ׺���׺
$	�ֶ�����
in	�����Ա

(9) ���˵�һ�д���2����

$ awk '$1>2' log.txt    #����
#���
3 Are you like awk
This's a test
10 There are orange,apple,mongo
(10) ���˵�һ�е���2����

$ awk '$1==2 {print $1,$3}' log.txt    #����
#���
2 is

(11) ���˵�һ�д���2���ҵڶ��е���'Are'����

$ awk '$1>2 && $2=="Are" {print $1,$2,$3}' log.txt    #����
#���
3 Are you

(12) �ڽ�����
����	����
$n	��ǰ��¼�ĵ�n���ֶΣ��ֶμ���FS�ָ�
$0	�����������¼
ARGC	�����в�������Ŀ
ARGIND	�������е�ǰ�ļ���λ��(��0��ʼ��)
ARGV	���������в���������
CONVFMT	����ת����ʽ(Ĭ��ֵΪ%.6g)ENVIRON����������������
ERRNO	���һ��ϵͳ���������
FIELDWIDTHS	�ֶο����б�(�ÿո���ָ�)
FILENAME	��ǰ�ļ���
FNR	���ļ��ֱ�������к�
FS	�ֶηָ���(Ĭ�����κοո�)
IGNORECASE	���Ϊ�棬����к��Դ�Сд��ƥ��
NF	һ����¼���ֶε���Ŀ
NR	�Ѿ������ļ�¼���������кţ���1��ʼ
OFMT	���ֵ������ʽ(Ĭ��ֵ��%.6g)
OFS	�����¼�ָ�����������з��������ʱ��ָ���ķ��Ŵ��滻�з�
ORS	�����¼�ָ���(Ĭ��ֵ��һ�����з�)
RLENGTH	��match������ƥ����ַ����ĳ���
RS	��¼�ָ���(Ĭ����һ�����з�)
RSTART	��match������ƥ����ַ����ĵ�һ��λ��
SUBSEP	�����±�ָ���(Ĭ��ֵ��/034)
(13)
$ awk 'BEGIN{printf "%4s %4s %4s %4s %4s %4s %4s %4s %4s\n","FILENAME","ARGC","FNR","FS","NF","NR","OFS","ORS","RS";printf "---------------------------------------------\n"} {printf "%4s %4s %4s %4s %4s %4s %4s %4s %4s\n",FILENAME,ARGC,FNR,FS,NF,NR,OFS,ORS,RS}'  log.txt
FILENAME ARGC  FNR   FS   NF   NR  OFS  ORS   RS
---------------------------------------------
log.txt    2    1         5    1
log.txt    2    2         5    2
log.txt    2    3         3    3
log.txt    2    4         4    4
$ awk -F\' 'BEGIN{printf "%4s %4s %4s %4s %4s %4s %4s %4s %4s\n","FILENAME","ARGC","FNR","FS","NF","NR","OFS","ORS","RS";printf "---------------------------------------------\n"} {printf "%4s %4s %4s %4s %4s %4s %4s %4s %4s\n",FILENAME,ARGC,FNR,FS,NF,NR,OFS,ORS,RS}'  log.txt
FILENAME ARGC  FNR   FS   NF   NR  OFS  ORS   RS
---------------------------------------------
log.txt    2    1    '    1    1
log.txt    2    2    '    1    2
log.txt    2    3    '    2    3
log.txt    2    4    '    1    4
# ���˳��� NR, ƥ���ı��к�
$ awk '{print NR,FNR,$1,$2,$3}' log.txt
---------------------------------------------
1 1 2 this is
2 2 3 Are you
3 3 This's a test
4 4 10 There are
# ָ������ָ��
$  awk '{print $1,$2,$5}' OFS=" $ "  log.txt
---------------------------------------------
2 $ this $ test
3 $ Are $ awk
This's $ a $
10 $ There $

(14)
ʹ�������ַ���ƥ��
# ����ڶ��а��� "th"������ӡ�ڶ����������
$ awk '$2 ~ /th/ {print $2,$4}' log.txt
---------------------------------------------
this a
~ ��ʾģʽ��ʼ��// ����ģʽ��

(15) # �������"re" ����
$ awk '/re/ ' log.txt
---------------------------------------------
3 Are you like awk
10 There are orange,apple,mongo
(16)���Դ�Сд
$ awk 'BEGIN{IGNORECASE=1} /this/' log.txt
---------------------------------------------
2 this is a test
This's a test
(17)ģʽȡ��
$ awk '$2 !~ /th/ {print $2,$4}' log.txt
---------------------------------------------
Are like
a
There orange,apple,mongo
$ awk '!/th/ {print $2,$4}' log.txt
---------------------------------------------
Are like
a
There orange,apple,mongo

(18) awk�ű�
����awk�ű���������Ҫע�������ؼ���BEGIN��END��

BEGIN{ ������ŵ���ִ��ǰ����� }
END {������ŵ��Ǵ��������е��к�Ҫִ�е���� }
{������ŵ��Ǵ���ÿһ��ʱҪִ�е����}
��������ôһ���ļ���ѧ���ɼ�������

$ cat score.txt
Marry   2143 78 84 77
Jack    2321 66 78 45
Tom     2122 48 77 71
Mike    2537 87 97 95
Bob     2415 40 57 62
���ǵ�awk�ű����£�

$ cat cal.awk
#!/bin/awk -f
#����ǰ
BEGIN {
    math = 0
    english = 0
    computer = 0
 
    printf "NAME    NO.   MATH  ENGLISH  COMPUTER   TOTAL\n"
    printf "---------------------------------------------\n"
}
#������
{
    math+=$3
    english+=$4
    computer+=$5
    printf "%-6s %-6s %4d %8d %8d %8d\n", $1, $2, $3,$4,$5, $3+$4+$5
}
#���к�
END {
    printf "---------------------------------------------\n"
    printf "  TOTAL:%10d %8d %8d \n", math, english, computer
    printf "AVERAGE:%10.2f %8.2f %8.2f\n", math/NR, english/NR, computer/NR
}
��������һ��ִ�н����

$ awk -f cal.awk score.txt
NAME    NO.   MATH  ENGLISH  COMPUTER   TOTAL
---------------------------------------------
Marry  2143     78       84       77      239
Jack   2321     66       78       45      189
Tom    2122     48       77       71      196
Mike   2537     87       97       95      279
Bob    2415     40       57       62      159
---------------------------------------------
  TOTAL:       319      393      350
AVERAGE:     63.80    78.60    70.00
����һЩʵ��
AWK��hello world����Ϊ��

BEGIN { print "Hello, world!" }
�����ļ���С

$ ls -l *.txt | awk '{sum+=$6} END {print sum}'
--------------------------------------------------
666581
���ļ����ҳ����ȴ���80����

awk 'length>80' log.txt
��ӡ�žų˷���

seq 9 | sed 'H;g' | awk -v RS='' '{for(i=1;i<=NF;i++)printf("%dx%d=%d%s", i, NR, i*NR, i==NR?"\n":"\t")}'
�������ݣ�

AWK ����ԭ�� https://www.runoob.com/w3cnote/awk-work-principle.html

AWK ����   https://www.runoob.com/w3cnote/awk-arrays.html

AWK ���������ѭ�� https://www.runoob.com/w3cnote/awk-if-loop.html

AWK �û��Զ��庯�� https://www.runoob.com/w3cnote/awk-user-defined-functions.html

AWK ���ú��� https://www.runoob.com/w3cnote/awk-built-in-functions.html

8 �������� Awk �ڽ����� https://www.runoob.com/w3cnote/8-awesome-awk-built-in-variables.html

AWK �ٷ��ֲ� https://www.gnu.org/software/gawk/manual/gawk.html

Linux �����ȫ Linux �����ȫ


awk��sed��grep���ʺϵķ���

 grep ���ʺϵ����Ĳ��һ�ƥ���ı�
 sed ���ʺϱ༭ƥ�䵽���ı�
 awk ���ʺϸ�ʽ���ı������ı����нϸ��Ӹ�ʽ����
����awk�ڽ��������˼��⣬���׶�

����һ�±�����

��������Ϊ���ñ������Զ������;����ָ���FS������ָ���OFS���������ñ�����

���ñ�������awkԤ����õġ�������awk�ڲ��ı��������Զ�����������û�����ı�����

 FS(Field Separator)�������ֶηָ����� Ĭ��Ϊ�հ��ַ�
 OFS(Out of Field Separator)������ֶηָ����� Ĭ��Ϊ�հ��ַ�
 RS(Record Separator)�������¼�ָ���(���뻻�з�)�� ָ������ʱ�Ļ��з�
 ORS(Output Record Separate)�������¼�ָ�����������з��������ʱ��ָ�����Ŵ��滻�з�
 NF(Number for Field)����ǰ�е��ֶεĸ���(����ǰ�б��ָ���˼���)
 NR(Number of Record)���кţ���ǰ�������ı��е��кš�
 FNR�����ļ��ֱ�������к�
 ARGC�������в����ĸ���
 ARGV�����飬��������������������ĸ�����
�Զ�������ķ���

 ����һ��-v varname=value �������������ַ���Сд��
 ����������program��ֱ�Ӷ��塣