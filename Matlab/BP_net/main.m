[x_train,y_train,x_test,y_test]=getdata();

%��һ��
x_train = mapminmax(x_train,0,1);
x_test =mapminmax(x_test,0,1);


[w2,b2,w_h2,b_h2]=mytrain_mini(x_train,y_train);
fprintf('mytrain_mini��ȷ��:\n');
mytest(x_test,y_test,w2,b2,w_h2,b_h2);