AWK �û��Զ��庯��
���� ��̼���
һ����������ж�����ܣ�ÿ���������ǿ��Զ���һ��������

����������ߴ���ĸ����ԡ�

�û��Զ��庯�����﷨��ʽΪ��

function function_name(argument1, argument2, ...)
{
    function body
}
������

function_name ���û��Զ��庯�������ơ���������Ӧ������ĸ��ͷ�������������֡���ĸ���»��ߵ�������ϡ�AWK �����Ĺؼ��ֲ�����Ϊ�û��Զ��庯�������ơ�
�Զ��庯�����Խ��ܶ�������������Щ����֮��ͨ�����ŷָ������������Ǳ���ġ�����Ҳ���Զ���û���κ���������ĺ�����
function body �Ǻ����岿�֣������� AWK ������롣
����ʵ������ʵ���������򵥺��������Ƿֱ𷵻�������ֵ�е���Сֵ�����ֵ�������������� main �е����������������� �ļ� functions.awk �������£�

# ������Сֵ
function find_min(num1, num2)
{
  if (num1 < num2)
    return num1
  return num2
}

# �������ֵ
function find_max(num1, num2)
{
  if (num1 > num2)
    return num1
  return num2
}

# ������
function main(num1, num2)
{
  # ������Сֵ
  result = find_min(10, 20)
  print "Minimum =", result

  # �������ֵ
  result = find_max(10, 20)
  print "Maximum =", result
}

# �ű������￪ʼִ��
BEGIN {
  main(10, 20)
}  
ִ�� functions.awk �ļ������Եõ����µĽ����

$ awk -f functions.awk 
Minimum = 10
Maximum = 20