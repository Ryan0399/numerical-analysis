function err = errorFunc(f,g)
x=zeros(1,101);
for i=1:101
    x(i)=abs(f(i)-g(i));
end
err=max(x);
end