�������
IF ���
IF ��������﷨��ʽ���£�

if (condition)
    action
Ҳ����ʹ�û�������ִ��һ�������

if (condition)
{
    action-1
    action-1
    .
    .
    action-n
}
����ʵ�������ж���������������ż����

(1) $ awk 'BEGIN {num = 10; if (num % 2 == 0) printf "%d ��ż��\n", num }'
������Ϊ��
10 ��ż��

IF - ELSE ���
IF - ELSE ��������﷨��ʽ���£�

if (condition)
    action-1
else
    action-2
��������� condition Ϊ true ʱֻ�� action-1������ִ�� action-2��

(2)
$ awk 'BEGIN {
    num = 11; 
    if (num % 2 == 0) printf "%d ��ż��\n", num; 
    else printf "%d ������\n", num 
}'
������Ϊ��

11 ������
IF - ELSE - IF
���ǿ��Դ������ IF - ELSE ��ʽ���ж������ʵ�ֶ���������жϣ�

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
������Ϊ��

a = 30

ѭ��
For
For ѭ�����﷨���£�

for (initialisation; condition; increment/decrement)
    action
for �������ִ�г�ʼ������( initialisation )��Ȼ���ټ������( condition )���������Ϊ�棬��ִ�ж���( action )��Ȼ��ִ�е���( increment )���ߵݼ�( decrement )������ֻҪ����Ϊ true ѭ���ͻ�һֱִ�С�ÿ��ѭ�����������������飬������Ϊ false �����ѭ����

���������ʹ�� For ѭ��������� 1 �� 5��

(4)
$ awk 'BEGIN { for (i = 1; i <= 5; ++i) print i }'
������Ϊ��

1
2
3
4
5


While
While ѭ�����﷨���£�

while (condition)
    action
While ѭ�����ȼ������ condition �Ƿ�Ϊ true ��������Ϊ true ��ִ�ж��� action���˹���һֱ�ظ�ֱ������ condition Ϊ flase ��ֹͣ��

������ʹ�� While ѭ��������� 1 �� 5 �����ӣ�
(5)
$ awk 'BEGIN {i = 1; while (i < 6) { print i; ++i } }'
������Ϊ��

1
2
3
4
5


Break
break ���Խ���ѭ��:

�������ʾ�����У�������ĺʹ��� 50 ��ʱ��ʹ�� break ����ѭ����

$ awk 'BEGIN {
   sum = 0; for (i = 0; i < 20; ++i) { 
      sum += i; if (sum > 50) break; else print "Sum =", sum 
   } 
}'
������Ϊ��

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
Continue ���������ѭ�����ڲ���������ѭ�����Ӷ�ֱ�ӽ�����һ��ѭ��������

������������ 1 �� 20 ֮���ż����

$ awk 'BEGIN {for (i = 1; i <= 20; ++i) {if (i % 2 == 0) print i ; else continue} }'
������Ϊ��

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
Exit ���ڽ����ű������ִ�С�

�ú�������һ��������Ϊ������ʾ AWK ���̽���״̬�� ���û���ṩ�ò�������Ĭ��״̬Ϊ 0��

���������е��ʹ��� 50 ʱ���� AWK ����

$ awk 'BEGIN {
   sum = 0; for (i = 0; i < 20; ++i) {
      sum += i; if (sum > 50) exit(10); else print "Sum =", sum 
   } 
}'
������Ϊ��

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
�����Ǽ��һ�½ű�ִ�к�ķ���״̬��

$ echo $?
ִ�������������Եõ����µĽ����

19