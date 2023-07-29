N=5;
while N<=40
    fprintf('N=%d\n',N);
    err_1=errorFunc_1(N);
    err_2=errorFunc_2(N);
    fprintf('Max Error of grid(1): %e\n',err_1);
    fprintf('Max Error of grid(2): %e\n',err_2);
    fprintf('\n');
    N=N*2;
end
x=zeros(1,101);
for i=1:101
    x(1,i)=(i-1)/10-5;
end
f=zeros(1,101);
for i=1:101
    f(1,i)=1.0/(1+x(1,i)^2);
end
y_1=zeros(1,101);
for i=1:101
    y_1(1,i)=uniformPoint(x(1,i),10);
end
y_2=zeros(1,101);
for i=1:101
    y_2(1,i)=chebyshevPoint(x(1,i),10);
end
plot(x,f,x,y_1,x,y_2);