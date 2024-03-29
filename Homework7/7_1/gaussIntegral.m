function J=gaussIntegral(f,x)
% s=[0 0.538469310105683 0.906179845938664];
% A=[0.568888888888889 0.478628670499366 0.236926885056189];
s=[0 0.7745966692414834];
A=[0.8888888888888888 0.55555555555555556];
n=length(x);
I=zeros(1,n-1);
for i=1:n-1
    u=(x(i)+x(i+1))/2;
    I(i)=A(1)*f(u);
    u=((x(i+1)-x(i))*s(2)+x(i)+x(i+1))/2;
    v=((x(i)-x(i+1))*s(2)+x(i)+x(i+1))/2;
    I(i)=I(i)+A(2)*(f(u)+f(v));
    I(i)=(x(i+1)-x(i))*I(i)/2;
end
J=sum(I);
end