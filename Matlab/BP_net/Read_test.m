function [test_real_Labels,test_Features] = Read_test
testDigits=dir('E:\Matlab\bin\zhineng\testDigit');
fprintf('Loading testDigits....\n');
testDigits(1:2,:)=[];%名字中带有表示此文件和上一文件夹的字符
Cell_name={testDigits.name};%将单元数组中的某一字段取出放入一个单元数组中
Char_name=cell2mat(Cell_name);%将单元数组变成一字符串
index=regexpi(Char_name,'\d_\d');%利用正则表达式找到合适的字符
labels=Char_name(index);%利用索引将指定字符取出
test_real_Labels=(abs(labels)-48)';%获得样本的标签
size_testDigits=size(testDigits);
test_Features=zeros(size_testDigits(1),1024);
for i=1:size_testDigits(1)
    readname=strcat('E:\Matlab\bin\zhineng\testDigit\',testDigits(i).name);
    Middle_text=textread(readname,'%s');%读取样本
    Middle_text=cell2mat(Middle_text);
    Middle_text=abs(Middle_text)-48;
    test_Features(i,:)=reshape(Middle_text,[1,1024]);%将样本转化为1024维的向量
end

end

