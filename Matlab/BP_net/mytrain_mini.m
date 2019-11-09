function[w,b,w_h,b_h]=mytrain_mini(x_train,y_train)
%train function:设置一个隐藏层，1024-->隐藏层神经元个数-->10
%x_train:训练样本的像素数据
%y_train：训练样本的标签
%w：输出层权重
%b：输出层偏置
%w_h：隐藏层权重
%b_h：隐藏层偏置
%step：循环步数

step=input('迭代步数：');
a=input('学习因子：');
in = 1024; %输入神经元个数
hid = input('隐藏层神经元个数：');%隐藏层神经元个数
out = 10; %输出层神经元个数
o =1;

w = randn(out,hid); %size:10*28
b = randn(out,1);   %size:10*1
w_h =randn(hid,in);  %28*1024
b_h = randn(hid,1);  %28*1


for i=0:step
    %打乱训练样本
    r=randperm(1934);
    x_train = x_train(:,r);   
    y_train = y_train(:,r);   
    %mini_batch
    for jj=0:191
        %取batch为10  更新取10次的平均值
        for j=jj*10+1:(jj+1)*10%1 2 3 4 5 6 7 8 9 10
            x = x_train(:,j);%逐个获取图片信息size:1024*1
            y = y_train(:,j);%主攻获取图片标签zise:10*1

            hid_put = layerout(w_h,b_h,x); %size:28*1
            out_put = layerout(w,b,hid_put);%10*1

            %更新公式的实现
            o_update = (y-out_put).*out_put.*(1-out_put);% 更新公式y(1-y)(d-y)，size:10*1
            h_update = ((w')*o_update).*hid_put.*(1-hid_put);%输入到隐藏更新    size:28*1

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