% @三次样条函数
% @输入t为等距结点，x为自变量，输出S是三次样条函数在x处的值
function S=cubicSplineInter(t,x)
N=length(t);
%% 计算三次样条函数在结点处的二阶导数
h=zeros(1,N-1);b=zeros(1,N-1);
for i=1:N-1
    h(i)=t(i+1)-t(i);
    b(i)=6*(exp(t(i+1))-exp(t(i)))/h(i);
end
u=ones(1,N-1);v=ones(1,N-1);g=zeros(1,N);
for i=1:N-2
    u(i)=h(i)/(h(i+1)+h(i));v(i+1)=1-u(i);
    g(i+1)=(b(i+1)-b(i))/(h(i+1)+h(i));
end
g(1)=(b(1)-6*1)/h(1);
g(N)=(exp(1)*6-b(N-1))/h(N-1);
m=ones(1,N)*2;
M=diag(m)+diag(u,-1)+diag(v,1);
z=M\g.';
%% 构造三次样条函数
A=zeros(1,N-1);B=zeros(1,N-1);C=zeros(1,N-1);
for i=1:N-1
    A(i)=(z(i+1)-z(i))/(6*h(i));
    B(i)=z(i)/2;
    C(i)=-h(i)*z(i+1)/6-h(i)*z(i)/3+(exp(t(i+1))-exp(t(i)))/h(i);
end

for i=1:N-1
    if x>=t(i)&&x<=t(i+1)
        S=exp(t(i))+(x-t(i))*(C(i)+(x-t(i))*(B(i)+(x-t(i))*A(i)));
        break;
    end
end
end