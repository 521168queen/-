function[w,b,w_h,b_h]=mytrain_mini(x_train,y_train)
%train function:����һ�����ز㣬1024-->���ز���Ԫ����-->10
%x_train:ѵ����������������
%y_train��ѵ�������ı�ǩ
%w�������Ȩ��
%b�������ƫ��
%w_h�����ز�Ȩ��
%b_h�����ز�ƫ��
%step��ѭ������

step=input('����������');
a=input('ѧϰ���ӣ�');
in = 1024; %������Ԫ����
hid = input('���ز���Ԫ������');%���ز���Ԫ����
out = 10; %�������Ԫ����
o =1;

w = randn(out,hid); %size:10*28
b = randn(out,1);   %size:10*1
w_h =randn(hid,in);  %28*1024
b_h = randn(hid,1);  %28*1


for i=0:step
    %����ѵ������
    r=randperm(1934);
    x_train = x_train(:,r);   
    y_train = y_train(:,r);   
    %mini_batch
    for jj=0:191
        %ȡbatchΪ10  ����ȡ10�ε�ƽ��ֵ
        for j=jj*10+1:(jj+1)*10%1 2 3 4 5 6 7 8 9 10
            x = x_train(:,j);%�����ȡͼƬ��Ϣsize:1024*1
            y = y_train(:,j);%������ȡͼƬ��ǩzise:10*1

            hid_put = layerout(w_h,b_h,x); %size:28*1
            out_put = layerout(w,b,hid_put);%10*1

            %���¹�ʽ��ʵ��
            o_update = (y-out_put).*out_put.*(1-out_put);% ���¹�ʽy(1-y)(d-y)��size:10*1
            h_update = ((w')*o_update).*hid_put.*(1-hid_put);%���뵽���ظ���    size:28*1

            if j==jj*10+1   %j=1 11 21
                outw_update = (double(a)/10)*(o_update*(hid_put'));
                outb_update = (double(a)/10)*o_update;
                hidw_update = (double(a)/10)*(h_update*(x'));
                hidb_update = (double(a)/10)*h_update;
            end

            if j~=jj*10+1 %1 11 21 
                outw_update = outw_update + (double(a)/10)*(o_update*(hid_put'));
                outb_update = outb_update -(double(a)/10)*o_update;  
                hidw_update = hidw_update + (double(a)/10)*(h_update*(x'));
                hidb_update = hidb_update -(double(a)/10)*h_update; 
            end
        end

        w = w + outw_update;
        b = b+ outb_update;
        w_h = w_h +hidw_update;
        b_h =b_h +hidb_update;
    end  
end
end