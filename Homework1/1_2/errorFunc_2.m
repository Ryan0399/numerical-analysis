function err = errorFunc_2(N)
y=zeros(1,101);
for i=1:101
    y(i)=(i-1)/10-5;
    fprintf('%f\t',chebyshevPoint(y(i),N));
    y(i)=abs(chebyshevPoint(y(i),N)-1.0/(1+y(i)^2));
end
fprintf('\n');
err=max(y);
end