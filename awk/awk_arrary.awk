AWK ����
���� ��̼���
��
AWK ����ʹ�ù��������������ݽṹ���������������ֻ��ַ�����

AWK������ ��Ҳ����Ҫ��ǰ�������С����Ϊ��������ʱ�����Զ���������С��

����ʹ�õ��﷨��ʽ��

array_name[index]=value
array_name�����������
index����������
value��������Ԫ���������ֵ
��������
��������һ����δ��������Լ���η�������Ԫ�أ�

$ awk 'BEGIN {
sites["runoob"]="www.runoob.com";
sites["google"]="www.google.com"
print sites["runoob"] "\n" sites["google"]
}'
ִ���������������Ϊ��

www.runoob.com
www.google.com
������������У����Ƕ�����һ��վ��(sites)���飬�����������Ϊ��վӢ�ļ�ƣ�ֵΪ��վ���ʵ�ַ������ʹ�����¸�ʽ��������Ԫ�أ�

array_name[index] 
ɾ������Ԫ��
���ǿ���ʹ�� delete �����ɾ������Ԫ�أ��﷨��ʽ���£�

delete array_name[index
����������У������е� google Ԫ�ر�ɾ����ɾ������û���������

$ awk 'BEGIN {
sites["runoob"]="www.runoob.com";
sites["google"]="www.google.com"
delete sites["google"];
print fruits["google"]
}'
��ά����
AWK ������֧�ֶ�ά���飬�������ǿ��Ժ����׵�ʹ��һά����ģ��ʵ�ֶ�ά���顣

����ʾ��Ϊһ�� 3x3 ����ά���飺

100 200 300
400 500 600
700 800 900
����ʵ���У�array[0][0] �洢 100��array[0][1] �洢 200 ���������ơ�Ϊ���� array[0][0] ���洢 100, ���ǿ���ʹ�������﷨�� array["0,0"] = 100��

����ʹ���� 0,0 ��Ϊ�����������Ⲣ������������ֵ����ʵ�ϣ�����һ���ַ������� 0,0��

������ģ���ά��������ӣ�

$ awk 'BEGIN {
array["0,0"] = 100;
array["0,1"] = 200;
array["0,2"] = 300;
array["1,0"] = 400;
array["1,1"] = 500;
array["1,2"] = 600;
# �������Ԫ��
print "array[0,0] = " array["0,0"];
print "array[0,1] = " array["0,1"];
print "array[0,2] = " array["0,2"];
print "array[1,0] = " array["1,0"];
print "array[1,1] = " array["1,1"];
print "array[1,2] = " array["1,2"];
}'
ִ�������������Եõ����½����

array[0,0] = 100
array[0,1] = 200
array[0,2] = 300
array[1,0] = 400
array[1,1] = 500
array[1,2] = 600
�������Ͽ���ִ�кܶ���������磬ʹ�� asort �������Ԫ�ص����򣬻���ʹ�� asorti ʵ����������������ȵȡ�