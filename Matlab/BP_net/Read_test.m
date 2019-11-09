function [test_real_Labels,test_Features] = Read_test
testDigits=dir('E:\Matlab\bin\zhineng\testDigit');
fprintf('Loading testDigits....\n');
testDigits(1:2,:)=[];%�����д��б�ʾ���ļ�����һ�ļ��е��ַ�
Cell_name={testDigits.name};%����Ԫ�����е�ĳһ�ֶ�ȡ������һ����Ԫ������
Char_name=cell2mat(Cell_name);%����Ԫ������һ�ַ���
index=regexpi(Char_name,'\d_\d');%����������ʽ�ҵ����ʵ��ַ�
labels=Char_name(index);%����������ָ���ַ�ȡ��
test_real_Labels=(abs(labels)-48)';%��������ı�ǩ
size_testDigits=size(testDigits);
test_Features=zeros(size_testDigits(1),1024);
for i=1:size_testDigits(1)
    readname=strcat('E:\Matlab\bin\zhineng\testDigit\',testDigits(i).name);
    Middle_text=textread(readname,'%s');%��ȡ����
    Middle_text=cell2mat(Middle_text);
    Middle_text=abs(Middle_text)-48;
    test_Features(i,:)=reshape(Middle_text,[1,1024]);%������ת��Ϊ1024ά������
end

end

