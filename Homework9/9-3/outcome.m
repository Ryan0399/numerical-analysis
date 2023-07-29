clear
clc

f=@(t,x) (t-exp(-t))/(x+exp(x));
% g=@(t,x) sqrt(t)/(x + 1) + cos(t) + sin(3 * x);
F=@(t,x) x.^2-t.^2+2*exp(x)-2*exp(-t);

a=0;b=1;x0=0;
error=[];
syms sx;
% realx1=solve(F(1,sx)==0,sx);
realx1=-1;
for k=3:8
    t=linspace(a,b,2^k+1);
    x=adams_bashforth(f,x0,t);
    error(end+1)=max(abs(x(end)-realx1));
    subplot(2,3,(k-2))
    fimplicit(@(t,x) x.^2-t.^2+2*exp(x)-2*exp(-t),[0 1 -1 0],'LineWidth',2);hold on;
    plot(t,x,"Marker","o",'LineWidth',1);

    legend('exact solution','numerical solution');
end

for i=1:6
    fprintf("%d & ",2^(i+2));
    fprintf("%.5e & ",error(i));
    if i==1
        fprintf("%s %s\n",'-','\\');
    else
        fprintf("%.5f %s\n",log(error(i-1)/error(i))/log(2),'\\');
    end
end

    

