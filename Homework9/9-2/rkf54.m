function [x,t]=rkf54(f,a,delta,x0,h,M)
% 输入：一阶微分f(t,x)，区间起点a，容限delta，初值x0，初始步长h，步数上界M
% 输出：函数值x，取值点t
p=5;
t=a;x=x0;
e=1; % 局部截断误差
k=1;
while ~isnan(e)&&~isinf(e)&&k<=M % 解溢出或到达步数上界
    s=t(end);
    y=x(end);

    F1=h*f(s,y);
    F2=h*f(s+h/4,y+F1/4);
    F3=h*f(s+3*h/8,y+3*F1/32+9*F2/32);
    F4=h*f(s+12*h/13,y+1932*F1/2197-7200*F2/2197+7296*F3/2197);
    F5=h*f(s+h,y+439*F1/216-8*F2+3680*F3/513-845*F4/4104);
    F6=h*f(s+h/2,y-8*F1/27+2*F2-3544*F3/2565+1859*F4/4104-11*F5/40);
    
    e=F1/360-128*F3/4275-2197*F4/75240+F5/50+2*F6/55;
    if abs(e)<=delta
        t(end+1)=t(end)+h;
        x(end+1)=y+16*F1/135+6656*F3/12825+28561*F4/56430-9*F5/50+2*F6/55;
%         if abs((x(end)-x(end-1))/h-f(t(end),x(end)))>10,break;end % 解失去意义
        k=k+1;
    end
    h=0.9*h*(delta/abs(e))^(1/(1+p)); % 自适应调整步长
    
end
x(end)=[];t(end)=[];
end