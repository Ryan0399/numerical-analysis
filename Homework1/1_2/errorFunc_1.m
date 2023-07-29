function err = errorFunc_1(N)
y=zeros(1,101);
for i=1:101
    y(i)=(i-1)/10-5;
    fprintf('%f\t',uniformPoint(y(1,i),N));
    y(i)=abs(uniformPoint(y(i),N)-1.0/(1+y(i)^2));
end
fprintf('\n');
err=max(y);
end