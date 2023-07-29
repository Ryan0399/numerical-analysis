function y = uniformPoint(x,N)
%均匀插值点
arr=zeros(1,N+1);
for i=0:N
   arr(i+1)=5-(10/N)*i;
end
y=0;
l=ones(1,N+1);
for i=0:N
    for j=0:i-1
        l(i+1)=l(i+1)*(x-arr(j+1))/(arr(i+1)-arr(j+1));
    end
    for j=i+1:N
        l(i+1)=l(i+1)*(x-arr(j+1))/(arr(i+1)-arr(j+1));
    end
    l(i+1)=l(i+1)/(1+arr(i+1)^2);
    y=y+l(i+1);
end
end