function x=rk5(f,a,b,x0,h)
% 5阶Runge-Kutta公式
% 输入：一阶微分f，求解区间[a,b]，步长h，初值x0
% 输出：函数值x
t=a;x=x0;
while t(end)<b
    s=t(end);
    y=x(end);

    F1=h*f(s,y);
    F2=h*f(s+h/4,y+F1/4);
    F3=h*f(s+3*h/8,y+3*F1/32+9*F2/32);
    F4=h*f(s+12*h/13,y+1932*F1/2197-7200*F2/2197+7296*F3/2197);
    F5=h*f(s+h,y+439*F1/216-8*F2+3680*F3/513-845*F4/4104);
    F6=h*f(s+h/2,y-8*F1/27+2*F2-3544*F3/2565+1859*F4/4104-11*F5/40);
    
    t(end+1)=t(end)+h;
    x(end+1)=y+16*F1/135+6656*F3/12825+28561*F4/56430-9*F5/50+2*F6/55;
end