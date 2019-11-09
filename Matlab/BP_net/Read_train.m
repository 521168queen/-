function [train_Labels,train_Features] = Read_train
%% 读取训练样本及其标签
trainingDigits=dir('E:\Matlab\bin\zhineng\trainingDigits');
fprintf('Loading trainingDigits....\n');
trainingDigits(1:2,:)=[];%名字中带有表示此文件和上一文件夹的字符将其去掉
Cell_name={trainingDigits.name};%将单元数组中的某一字段取出放入一个单元数组中
Char_name=cell2mat(Cell_name);%将单元数组变成一字符串
index=regexpi(Char_name,'\d_\d');%利用正则表达式找到合适的字符
labels=Char_name(index);%利用索引将指定字符取出
train_Labels=(abs(labels)-48)';%获得样本的标签
size_trainingDigits=size(trainingDigits);
train_Features=zeros(size_trainingDigits(1),1024);
for i=1:size_trainingDigits(1)
    readname=strcat('E:\Matlab\bin\zhineng\trainingDigits\',trainingDigits(i).name);
    Middle_text=textread(readname,'%s');%读取样本
    Middle_text=cell2mat(Middle_text);
    Middle_text=abs(Middle_text)-48;
    train_Features(i,:)=reshape(Middle_text,[1,1024]);%将样本转化为1024维的向量
end
end

