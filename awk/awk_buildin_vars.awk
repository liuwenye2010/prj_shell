8 �������� Awk �ڽ�����
���� ��̼���
Awk �м����ǳ�ǿ�������ñ���.ͨ����˵����Ϊ�������͵����ñ���: - ��һ���Ƕ���ı������Ըı�,�������ֶηָ�(FS)���¼�ָ�(RS) - �ڶ����ǿ����������ݴ�����������ܽᣬ�����¼��(NR)���ֶ���Ŀ(NF) ���� ������: FS,OFS, RS, ORS, NR, NR, FNR

FS: �����ֶηָ�������
FS(Field Separator) ��ȡ�����������ļ��е�ÿһ��ʱ��Ĭ�ϰ��տո�ָ�Ϊ�ֶα���,$1,$2...�ȡ�FS ��������������ÿһ��¼���ֶηָ����š�FS ������������ַ�������������ʽ.�����ʹ���������ַ�ʽ������FS:

ʹ�� -F ����ѡ��

��Ϊ����Ϊ��ͨ����ʹ��

�﷨:

$ awk -F 'FS' 'commands' inputfilename

����

$ awk 'BEGIN{FS="FS";}'
FS �����������ַ�����������ʽ

FS ���Զ�θı�, �����ᱣ�ֲ���ֱ������ȷ�޸ġ����������Ҫ�ı��ֶηָ���,��������ڶ����ı�֮ǰ�͸ı� FS, �����ı�Ż����������ı���Ч��

������һ��ʹ�� FS ��ȡ /etc/passwd �� : ��Ϊ�ָ���������

$ cat etc_passwd.awk
BEGIN{
FS=":";
print "Name\tUserID\tGroupID\tHomeDirectory";
}
{
    print $1"\t"$3"\t"$4"\t"$6;
}
END {
    print NR,"Records Processed";
}
ʹ�ý��:

$ awk -f etc_passwd.awk /etc/passwd
Name    UserID  GroupID        HomeDirectory
gnats    41    41    /var/lib/gnats
libuuid    100    101    /var/lib/libuuid
syslog    101    102    /home/syslog
hplip    103    7    /var/run/hplip
avahi    105    111    /var/run/avahi-daemon
saned    110    116    /home/saned
pulse    111    117    /var/run/pulse
gdm    112    119    /var/lib/gdm
8 Records Processed
OFS: ����ֶηָ�������
OFS(Output Field Separator) �൱������ϵ� FS, Ĭ������һ���ո��ַ���Ϊ����ָ����ģ�������һ�� OFS ������:

$ awk -F':' '{print $3,$4;}' /etc/passwd
41 41
100 101
101 102
103 7
105 111
110 116
111 117
112 119
ע�������е� print ����, ��ʾ��ʹ��һ���ո���������������Ҳ����Ĭ�ϵ�OFS��ֵ����� OFS �����������������뵽������ֶ�֮��:

$ awk -F':' 'BEGIN{OFS="=";} {print $3,$4;}' /etc/passwd
41=41
100=101
101=102
103=7
105=111
110=116
111=117
112=11
RS: ��¼�ָ���
RS(Record Separator)������һ�м�¼����ȡ�ļ�ʱ��Ĭ�Ͻ�һ����Ϊһ����¼�� ����������� student.txt ��Ϊ�����ļ�����¼֮�������п��зָ�������ÿ����¼��ÿ���ֶ���һ�����з��ָ�:

$ cat student.txt
Jones
2143
78
84
77

Gondrol
2321
56
58
45

RinRao
2122
38
37
65

Edwin
2537
78
67
45

Dayan
2415
30
47
20
Ȼ������Ľű��ͻ��student.txt�����������:

$ cat student.awk
BEGIN {
    RS="\n\n";
    FS="\n";
}
{
    print $1,$2;
}
$ awk -f student.awk  student.txt
Jones 2143
Gondrol 2321
RinRao 2122
Edwin 2537
Dayan 2415
�� student.awk �У���ÿ��ѧ������ϸ��Ϣ��Ϊһ����¼����������ΪRS(��¼�ָ���)�Ǳ�����Ϊ�������з���������Ϊ FS (�ֶηָ���)��һ�����з�������һ�о���һ���ֶΡ�

ORS: �����¼�ָ�������
ORS(Output Record Separator)����˼����൱������� RS�� ÿ����¼�����ʱ����÷ָ���������������� ORS ������:

$  awk 'BEGIN{ORS="=";} {print;}' student-marks
Jones 2143 78 84 77=Gondrol 2321 56 58 45=RinRao 2122 38 37 65=Edwin 2537 78 67 45=Dayan 2415 30 47 20=
����Ľű��������ļ���ÿ����¼�� = �ָ����� ��:student-marks ������������.

NR: ��¼������
NR(Number of Record) ��ʾ�����Ѿ���������ܼ�¼��Ŀ������˵�к�(��һ����һ���ļ��������Ƕ��)����������ӣ�NR ��ʾ�кţ��� END ���֣�NR �����ļ��е����м�¼��Ŀ��

$ awk '{print "Processing Record - ",NR;}END {print NR, "Students Records are processed";}' student-marks
Processing Record -  1
Processing Record -  2
Processing Record -  3
Processing Record -  4
Processing Record -  5
5 Students Records are processed
NF:һ����¼�ļ�¼��Ŀ
NF(Number for Field)��ʾ���ǣ�һ����¼���ֶε���Ŀ.�������ж�ĳ����¼�Ƿ������ֶζ�����ʱ�ǳ����á� �����ǹ۲� student-mark �ļ�����:

$ cat student-marks
Jones 2143 78 84 77
Gondrol 2321 56 58 45
RinRao 2122 38 37
Edwin 2537 78 67 45
Dayan 2415 30 47
���������Awk���򣬴�ӡ�˼�¼��(NR),�Լ��ü�¼���ֶ���Ŀ: ��˿��Էǳ����׵ķ�����Щ���ݶ�ʧ�ˡ�

$ awk '{print NR,"->",NF}' student-marks
1 -> 5
2 -> 5
3 -> 4
4 -> 5
5 -> 4
FILENAME: ��ǰ�����ļ�������
FILENAME ��ʾ��ǰ����������ļ������֡� AWK ���Խ��ܶ�ȡ�ܶ���ļ�ȥ���������������:

$ awk '{print FILENAME}' student-marks
student-marks
student-marks
student-marks
student-marks
student-marks
��������ļ���ÿһ����¼������������֡�

FNR: ��ǰ�����ļ��ļ�¼��Ŀ
��awk��ȡ����ļ�ʱ��NR ������ǵ�ǰ���������ļ���ȫ����¼������ FNR ���ǵ�ǰ�ļ��ļ�¼���������������:

$ awk '{print FILENAME, "FNR= ", FNR,"  NR= ", NR}' student-marks bookdetails
student-marks FNR=  1   NR=  1
student-marks FNR=  2   NR=  2
student-marks FNR=  3   NR=  3
student-marks FNR=  4   NR=  4
student-marks FNR=  5   NR=  5
bookdetails FNR=  1   NR=  6
bookdetails FNR=  2   NR=  7
bookdetails FNR=  3   NR=  8
bookdetails FNR=  4   NR=  9
bookdetails FNR=  5   NR=  10
��: bookdetails �� student-marks ����һ����������. ���Կ����� NR �� FNR ������

����ʹ�� NR �� FNR ��������������ļ��������������ļ�:

$ cat a.txt
����|000002
����|000001
����|000003
����|000004

$ cat b.txt
000001|10
000001|20
000002|30
000002|15
000002|45
000003|40
000003|25
000004|60
���������Ӧ�Ļ�,����������|000001|10

$ awk -F '|' 'NR == FNR{a[$2]=$1;} NR>FNR {print a[$1],"|", $0}' a.txt b.txt
���� | 000001|10
���� | 000001|20
���� | 000002|30
���� | 000002|15
���� | 000002|45
���� | 000003|40
���� | 000003|25
���� | 000004|60
Ӣ��ԭ�ģ�http://www.thegeekstuff.com/2010/01/8-powerful-awk-built-in-variables-fs-ofs-rs-ors-nr-nf-filename-fnr/

���� ��http://shomy.top/2016/05/05/trans-8-powerful-awk-built-in-variables/