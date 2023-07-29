function f = newtonPolynomia(s,t,N,x)
%构造牛顿插值多项式
f=zeros(1,101);
for i = 2:N+1
    for j = N+1:-1:i
        s(j)=(s(j)-s(j-1))/(t(j)-t(j-i+1));z
    end
end
for j=1:101
    f(j)=s(N+1);
    for i=N+1:-1:2
        f(j)=s(i-1)+(x(j)-t(i-1))*f(j);
    end
end