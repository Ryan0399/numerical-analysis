% @误差计算函数
% @输入结点t，输出两种样条函数的最大误差
function [err_1,err_2]=errorFunc(t)
N=length(t);
x=zeros(1,N-1);y_1=zeros(1,N-1);y_2=zeros(1,N-1);
for i=1:N-1
    x(i)=(t(i)+t(i+1))/2;
    y_1(i)=abs(exp(x(i))-linearSplineInter(t,x(i)));
    y_2(i)=abs(exp(x(i))-cubicSplineInter(t,x(i)));
end
err_1=max(y_1);err_2=max(y_2);
end