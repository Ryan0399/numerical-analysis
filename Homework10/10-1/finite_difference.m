function [x,t]=finite_difference(u,v,w,n,x0,xn,a,b)
% 有限差分法解二阶微分方程
% 输入：二阶微分u,v,w，分割n，边界条件x0,xn，求解区间[a,b]
% 输出：函数值x，取值点t
t=linspace(a,b,n+2);
h=(b-a)/(n+1);

a=-1-h*w(t(3:n+1))/2;
d=2+h^2*v(t(2:n+1));
c=-1+h*w(t(2:n))/2;

b=-h^2*u(t(2:n+1));b=b.';
a0=-1-h*w(t(2))/2;cn=-1+h*w(t(n+1))/2;
b(1)=b(1)-a0*x0;b(n)=b(n)-cn*xn;

A=diag(a,-1)+diag(d)+diag(c,1);
x=A\b;
x=[x0 x.' xn];
end