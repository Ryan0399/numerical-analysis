clear
clc

l=5;
f=@(t,x) l*x+cos(t)-l*sin(t);
g=@(t) sin(t); % 解析解
a=0;b=5;h=0.01;
n=(b-a)/h+1;
x=linspace(a,b,n);
y=rungeKutta(f,a,b,h,0);
plot(x,y,'r');hold on;
plot(x,g(x),'b');
fprintf('参数=%d时，误差为：%.5e\n',l,max(abs(y-g(x))));
legend('Numerical solution','Analytical solution');
