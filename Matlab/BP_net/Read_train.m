function [train_Labels,train_Features] = Read_train
%% ��ȡѵ�����������ǩ
trainingDigits=dir('E:\Matlab\bin\zhineng\trainingDigits');
fprintf('Loading trainingDigits....\n');
trainingDigits(1:2,:)=[];%�����д��б�ʾ���ļ�����һ�ļ��е��ַ�����ȥ��
Cell_name={trainingDigits.name};%����Ԫ�����е�ĳһ�ֶ�ȡ������һ����Ԫ������
Char_name=cell2mat(Cell_name);%����Ԫ������һ�ַ���
index=regexpi(Char_name,'\d_\d');%����������ʽ�ҵ����ʵ��ַ�
labels=Char_name(index);%����������ָ���ַ�ȡ��
train_Labels=(abs(labels)-48)';%��������ı�ǩ
size_trainingDigits=size(trainingDigits);
train_Features=zeros(size_trainingDigits(1),1024);
for i=1:size_trainingDigits(1)
    readname=strcat('E:\Matlab\bin\zhineng\trainingDigits\',trainingDigits(i).name);
    Middle_text=textread(readname,'%s');%��ȡ����
    Middle_text=cell2mat(Middle_text);
    Middle_text=abs(Middle_text)-48;
    train_Features(i,:)=reshape(Middle_text,[1,1024]);%������ת��Ϊ1024ά������
end
end

