function [x_train,y_train,x_test,y_test]=getdata()
%获取训练集，测试集
%x_train:训练集样本像素矩阵(1024,1936)
%y_train:训练样本标签(10,1936)
%x_test:测试集样本像素矩阵(1024,946)
%y_test:测试集样本标签(10,946)

[test_Labels,test_Features] = Read_test;
[train_Labels,train_Features] = Read_train;
y_train=train_Labels';
y_test=test_Labels;
%构造测试集标签的one-hot编码
a=zeros(946,10);
for i=1:946
    a(i,y_test(i)+1)=1;
end
y_test=a';

x_train=train_Features';
x_test=test_Features';
%构造训练集标签的one-hot标签
b=zeros(1934,10);
for i=1:1934
    b(i,y_train(i)+1)=1;
end
y_train=b';

x_train;
y_train;
x_test;
y_test;
