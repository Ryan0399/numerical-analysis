N=5;
x=zeros(1,101);
for i=1:101
    x(1,i)=(i-1)/50-1;
end
f=zeros(1,101);
g=zeros(1,101);
h=zeros(1,101);
for i=1:101
    f(1,i)=1.0/(1+25*x(1,i)^2);
end
while N<=40
    fprintf('N=%d\n',N);
    s=zeros(1,N+1);
    t=zeros(1,N+1);
    %构造均匀插值点
    for i=0:N
        t(i+1)=1-i*2/N;
    end
    for i=0:N
        s(i+1)=1/(1+25*t(i+1)^2);
    end
    g=newtonPolynomia(s,t,N,x);
    err_1=errorFunc(f,g);
    %构造chebyshev插值点
    for i=0:N
        t(i+1)=-cos(pi*(2*i+1)/(2*N+2));
    end
    for i=0:N
        s(i+1)=1.0/(1+25*(t(i+1)^2));
    end
    h=newtonPolynomia(s,t,N,x);
    err_2=errorFunc(f,h);
    if N==20
        g_1=g;
        h_1=h;
    end
    fprintf('Max Error of grid(1): %e\n',err_1);
    fprintf('Max Error of grid(2): %e\n',err_2);
    fprintf('\n');
    N=N*2;
end
plot(x,f,x,g_1,'--',x,h_1,':');