function I=multinomial(f,x,a,b)
n=length(x);s=zeros(n,1);
X=fliplr(vander(x)).';
for i=1:n
    s(i)=(b^i-a^i)/i;
end
A=linsolve(X,s);
for i=1:n
    s(i)=f(x(i));
end
I=dot(A,s);
end