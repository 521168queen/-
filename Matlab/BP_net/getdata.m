function [x_train,y_train,x_test,y_test]=getdata()
%��ȡѵ���������Լ�
%x_train:ѵ�����������ؾ���(1024,1936)
%y_train:ѵ��������ǩ(10,1936)
%x_test:���Լ��������ؾ���(1024,946)
%y_test:���Լ�������ǩ(10,946)

[test_Labels,test_Features] = Read_test;
[train_Labels,train_Features] = Read_train;
y_train=train_Labels';
y_test=test_Labels;
%������Լ���ǩ��one-hot����
a=zeros(946,10);
for i=1:946
    a(i,y_test(i)+1)=1;
end
y_test=a';

x_train=train_Features';
x_test=test_Features';
%����ѵ������ǩ��one-hot��ǩ
b=zeros(1934,10);
for i=1:1934
    b(i,y_train(i)+1)=1;
end
y_train=b';

x_train;
y_train;
x_test;
y_test;
