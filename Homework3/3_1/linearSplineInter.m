% @一次样条函数
% @输入t为等距结点，x为自变量，输出S是一次样条函数在x处的值
function S=linearSplineInter(t,x)
N=length(t);
%% 构造一次样条函数系数
a=zeros(1,N-1);b=zeros(1,N-1);
for i=1:N-1
    a(i)=(exp(t(i+1))-exp(t(i)))/(t(i+1)-t(i));
    b(i)=exp(t(i))-t(i)*(exp(t(i+1))-exp(t(i)))/(t(i+1)-t(i));
end
%% 计算一次样条函数
for i=1:N-1
    if x>=t(i)&&x<=t(i+1)
        S=a(i)*x+b(i);
        break;
    end
end
end