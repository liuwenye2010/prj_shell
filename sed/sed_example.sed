Linux sed ���������ýű��������ı��ļ���
https://www.runoob.com/linux/linux-comm-sed.html
cygwin's help for more

sed �����սű���ָ���������༭�ı��ļ���
Sed ��Ҫ�����Զ��༭һ�������ļ����򻯶��ļ��ķ�����������дת������ȡ�

�﷨
sed [-hnV][-e<script>][-f<script�ļ�>][�ı��ļ�]
����˵����

-e<script>��--expression=<script> ��ѡ����ָ����script������������ı��ļ���
-f<script�ļ�>��--file=<script�ļ�> ��ѡ����ָ����script�ļ�������������ı��ļ���
-h��--help ��ʾ������
-n��--quiet��--silent ����ʾscript�����Ľ����
-V��--version ��ʾ�汾��Ϣ��
����˵����

a �������� a �ĺ�����Խ��ִ�������Щ�ִ������µ�һ�г���(Ŀǰ����һ��)��
c ��ȡ���� c �ĺ�����Խ��ִ�����Щ�ִ�����ȡ�� n1,n2 ֮����У�
d ��ɾ������Ϊ��ɾ���������� d ����ͨ�������κ����ˣ�
i �����룬 i �ĺ�����Խ��ִ�������Щ�ִ������µ�һ�г���(Ŀǰ����һ��)��
p ����ӡ���༴��ĳ��ѡ�������ӡ����ͨ�� p ������� sed -n һ�����С�
s ��ȡ��������ֱ�ӽ���ȡ���Ĺ�������ͨ����� s �Ķ������Դ��������ʾ�������� 1,20s/old/new/g ��������


ʵ��
(1) ��testfile�ļ��ĵ����к����һ�У���������������׼���������������ʾ���������������
$ sed -e 4a\newline testfile #ʹ��sed �ڵ����к�������ַ���  
HELLO LINUX! #testfile�ļ�ԭ�е�����  
Linux is a free unix-type opterating system.  
This is a linux testfile!  
Linux test  
newline 

(2) ����Ϊ��λ������/ɾ��
�� /etc/passwd �������г�������ӡ�кţ�ͬʱ���뽫�� 2~5 ��ɾ����

[root@www ~]# nl /etc/passwd | sed '2,5d'
1 root:x:0:0:root:/root:/bin/bash
6 sync:x:5:0:sync:/sbin:/bin/sync
7 shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
.....(����ʡ��).....
sed �Ķ���Ϊ '2,5d' ���Ǹ� d ����ɾ������Ϊ 2-5 �и���ɾ���ˣ�������ʾ�����ݾ�û�� 2-5 ���ޡ� ���⣬ע��һ�£�ԭ��Ӧ����Ҫ�´� sed -e �Ŷԣ�û�� -e Ҳ������ͬʱҲҪע����ǣ� sed ����ӵĶ������������ '' ������������סร�

(3)ֻҪɾ���� 2 ��

nl /etc/passwd | sed '2d' 

(4)Ҫɾ���� 3 �����һ��
nl /etc/passwd | sed '3,$d' 

(5) �ڵڶ��к�(�༴�Ǽ��ڵ�����)���ϡ�drink tea?��������

[root@www ~]# nl /etc/passwd | sed '2a drink tea'
1 root:x:0:0:root:/root:/bin/bash
2 bin:x:1:1:bin:/bin:/sbin/nologin
drink tea
3 daemon:x:2:2:daemon:/sbin:/sbin/nologin
.....(����ʡ��).....

(6)�������Ҫ�ڵڶ���ǰ���ϡ�drink tea?��������

nl /etc/passwd | sed '2i drink tea' 

(7) �����Ҫ�����������ϣ��ڵڶ��к�����������֣����� Drink tea or ..... �� drink beer?

[root@www ~]# nl /etc/passwd | sed '2a Drink tea or ......\
> drink beer ?'
1 root:x:0:0:root:/root:/bin/bash
2 bin:x:1:1:bin:/bin:/sbin/nologin
Drink tea or ......
drink beer ?
3 daemon:x:2:2:daemon:/sbin:/sbin/nologin
.....(����ʡ��).....
ÿһ��֮�䶼����Ҫ�Է�б�ܡ� \ �����������е����ร����ԣ�����������У����ǿ��Է����ڵ�һ�е��������� \ ���ڡ�

(8) ����Ϊ��λ���滻����ʾ
����2-5�е�����ȡ����Ϊ��No 2-5 number���أ�

[root@www ~]# nl /etc/passwd | sed '2,5c No 2-5 number'
1 root:x:0:0:root:/root:/bin/bash
No 2-5 number
6 sync:x:5:0:sync:/sbin:/bin/sync
.....(����ʡ��).....
͸������������Ǿ��ܹ�����������ȡ���ˣ�

(9) ���г� /etc/passwd �ļ��ڵĵ� 5-7 ��

[root@www ~]# nl /etc/passwd | sed -n '5,7p'
5 lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
6 sync:x:5:0:sync:/sbin:/bin/sync
7 shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
����͸����� sed ������Ϊ��λ����ʾ���ܣ� ���ܹ���ĳһ���ļ��ڵ�ĳЩ�к�ѡ�������ʾ��

(10)���ݵ���Ѱ����ʾ
���� /etc/passwd��root�ؼ��ֵ���

nl /etc/passwd | sed '/root/p'
1  root:x:0:0:root:/root:/bin/bash
1  root:x:0:0:root:/root:/bin/bash
2  daemon:x:1:1:daemon:/usr/sbin:/bin/sh
3  bin:x:2:2:bin:/bin:/bin/sh
4  sys:x:3:3:sys:/dev:/bin/sh
5  sync:x:4:65534:sync:/bin:/bin/sync
....������� 
���root�ҵ���������������У��������ƥ���С�

(11)ʹ��-n��ʱ��ֻ��ӡ����ģ����С�

nl /etc/passwd | sed -n '/root/p'
1  root:x:0:0:root:/root:/bin/bash

(12) ���ݵ���Ѱ��ɾ��
ɾ��/etc/passwd���а���root���У����������

nl /etc/passwd | sed  '/root/d'
2  daemon:x:1:1:daemon:/usr/sbin:/bin/sh
3  bin:x:2:2:bin:/bin:/bin/sh
....�������
#��һ�е�ƥ��root�Ѿ�ɾ����

(13) ���ݵ���Ѱ��ִ������
����/etc/passwd,�ҵ�root��Ӧ���У�ִ�к��滨�����е�һ�����ÿ������֮���÷ֺŷָ��������bash�滻Ϊblueshell����������У�

nl /etc/passwd | sed -n '/root/{s/bash/blueshell/;p;q}'    
1  root:x:0:0:root:/root:/bin/blueshell
����q���˳���

(14)���ݵ���Ѱ���滻
�������еĴ���ģʽ֮�⣬ sed ����������Ϊ��λ���в������ݵ���Ѱ��ȡ���������� sed ����Ѱ��������� vi �൱�����ƣ����е���������

sed 's/Ҫ��ȡ�����ִ�/�µ��ִ�/g'
�ȹ۲�ԭʼ��Ϣ������ /sbin/ifconfig ��ѯ IP

[root@www ~]# /sbin/ifconfig eth0
eth0 Link encap:Ethernet HWaddr 00:90:CC:A6:34:84
inet addr:192.168.1.100 Bcast:192.168.1.255 Mask:255.255.255.0
inet6 addr: fe80::290:ccff:fea6:3484/64 Scope:Link
UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
.....(����ʡ��).....
������ip��192.168.1.100��

�� IP ǰ��Ĳ�������ɾ��

[root@www ~]# /sbin/ifconfig eth0 | grep 'inet addr' | sed 's/^.*addr://g'
192.168.1.100 Bcast:192.168.1.255 Mask:255.255.255.0
����������ɾ�������Ĳ��֣��༴�� 192.168.1.100 Bcast:192.168.1.255 Mask:255.255.255.0

�� IP ����Ĳ�������ɾ��

[root@www ~]# /sbin/ifconfig eth0 | grep 'inet addr' | sed 's/^.*addr://g' | sed 's/Bcast.*$//g'
192.168.1.100
(15) ���༭
һ��sed���ɾ��/etc/passwd�����е�ĩβ�����ݣ�����bash�滻Ϊblueshell

nl /etc/passwd | sed -e '3,$d' -e 's/bash/blueshell/'
1  root:x:0:0:root:/root:/bin/blueshell
2  daemon:x:1:1:daemon:/usr/sbin:/bin/sh
-e��ʾ���༭����һ���༭����ɾ��/etc/passwd�����е�ĩβ�����ݣ��ڶ�����������bash�滻Ϊblueshell��

(16)ֱ���޸��ļ�����(Σ�ն���)
sed ����ֱ���޸��ļ������ݣ�����ʹ�ùܵ�������������ص��� ������������������ֱ���޸ĵ�ԭʼ���ļ�����������ǧ��Ҫ�����ϵͳ���������ԣ� ���ǻ���ʹ���ļ� regular_express.txt �ļ������Կ����ɣ�

regular_express.txt �ļ��������£�

[root@www ~]# cat regular_express.txt 
runoob.
google.
taobao.
facebook.
zhihu-
weibo-
���� sed �� regular_express.txt ��ÿһ�н�β��Ϊ . �򻻳� !

[root@www ~]# sed -i 's/\.$/\!/g' regular_express.txt
[root@www ~]# cat regular_express.txt 
runoob!
google!
taobao!
facebook!
zhihu-
weibo-:q:q
(17) ���� sed ֱ���� regular_express.txt ���һ�м��� # This is a test:

[root@www ~]# sed -i '$a # This is a test' regular_express.txt
[root@www ~]# cat regular_express.txt 
runoob!
google!
taobao!
facebook!
zhihu-
weibo-
# This is a test
��� $ ����������һ�У��� a �Ķ�������������˸��ļ�������� # This is a test��

sed �� -i ѡ�����ֱ���޸��ļ����ݣ��⹦�ܷǳ��а�����������˵���������һ�� 100 ���е��ļ�����Ҫ�ڵ� 100 �м�ĳЩ���֣���ʱʹ�� vim ���ܻ�������Ϊ�ļ�̫���ˣ������죿������ sed ����͸�� sed ֱ���޸�/ȡ���Ĺ��ܣ�����������Ҫʹ�� vim ȥ�޶���



(18)׷���е�˵����

sed -e 4a\newline testfile
a ��������ƥ�����֮��׷���ַ�����׷�ӵ��ַ����п��԰������з���ʵ��׷�Ӷ��е��������

׷��һ�еĻ�ǰ�󶼲���Ҫ��ӻ��з� \n��ֻ��׷�Ӷ���ʱ��������֮�����Ҫ��ӻ��з�(���һ�����Ҳ������ӣ���ӵĻ�����һ������)��

man sed ��Ϣ��

Append text, which has each embedded newline preceded by a backslash.
���磺

4 ��֮�����һ�У�

sed -e '4 a newline' testfile
4 ��֮��׷�� 2 �У�

sed -e '4 a newline\nnewline2' testfile
4 ��֮��׷�� 3 ��(2 �����ֺ� 1 �п���)

sed -e '4 a newline\nnewline2\n' testfile
4 ��֮��׷�� 1 �п��У�

#����sed -e '4 a \n' testfile
sed -e '4 a \ ' testfile ʵ����
ʵ�����ǲ�����һ������һ���ո���У�����һ����ȫΪ�յĿ���û���ҵ�����������Ӧ��û���������ɣ���Ҫ�������˲�����и����أ���

��ӿ��У�
# �������һ����ȫΪ�յĿ���
sed '4 a \\'

# �������������ȫΪ�յĿ���
sed '4 a \\n'