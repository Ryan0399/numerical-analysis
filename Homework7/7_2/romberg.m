function R=romberg(f,a,b,M)
    h=b-a;
    R=zeros(M+1);
    R(1,1)=h*(f(a)+f(b))/2;
    for n=2:M+1
        h=h/2;
%         for i=1:2^(n-2)
%             R(n,1)=R(n,1)+f(a+(2*i-1)*h);
%         end
        t=a+h:2*h:b-h;
        R(n,1)=h*sum(f(t))+R(n-1,1)/2;
        for m=2:n
%             R(n,m)=4^m*R(n,m-1)/(4^m-1)-R(n-1,m-1)/(4^m-1);
            R(n,m)=R(n,m-1)+(R(n,m-1)-R(n-1,m-1))/(4^(m-1)-1);
        end
    end
end