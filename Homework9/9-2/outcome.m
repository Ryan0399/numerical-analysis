clear
clc

f=@(t,x) exp(t*x)+cos(x-t); % 一阶微分
g=@(t,x) sqrt(t)/(x + 1) + cos(t) + sin(3 * x);
% 初始条件
a=1;x0=3;h=0.01;
delta=1e-6;

[x,t]=rkf54(f,a,delta,x0,h,10000);
fprintf("解的范围：[1,%f]\n",t(end));
ti=input("任意区间内的值：");
for i=1:length(t)-1
    if ti>=t(i)&&ti<t(i+1)
        xi=(x(i+1)-x(i))/(t(i+1)-t(i))*(ti-t(i))+x(i);
    end
end
fprintf("对应的函数值为：%f\n",xi);
plot(t,x);
