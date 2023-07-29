function y = rungeKutta(f,a,b,h,x)
% input-f 函数一阶导数
%           a,b 函数定义域
%           h 步长
%           x 初始值
% output-y 格点函数
n=(b-a)/h+1;
y=zeros(1,n);
y(1)=x;t=a;
for i=2:n
    x=y(i-1);
    F1=h*f(t,x);
    F2=h*f(t+h/2,x+F1/2);
    F3=h*f(t+h/2,x+F2/2);
    F4=h*f(t+h,x+F3);
    y(i)=x+(F1+2*F2+2*F3+F4)/6;t=t+h;
end
end