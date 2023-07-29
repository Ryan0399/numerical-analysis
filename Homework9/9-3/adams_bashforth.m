function x=adams_bashforth(f,x0,t)
% 5阶adams-bashforth公式
% 输入：一阶微分f，初值x0，结点t
% 输出：函数值x
N=length(t)-1;
h=(t(end)-t(1))/N;
x=rk5(f,t(1),t(5),x0,h);
for i=5:N
    x(end+1)=x(end)+h*(1901*f(t(i),x(i))-2774*f(t(i-1),x(i-1))+2616*f(t(i-2),x(i-2))-...
        1274*f(t(i-3),x(i-3))+251*f(t(i-4),x(i-4)))/720;
end
end