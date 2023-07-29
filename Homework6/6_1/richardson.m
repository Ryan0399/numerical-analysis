function D = richardson(h,M,f,x)
% Richardson外推
% input-h,M,f,x
% output-D(Richardson三角阵列)
D=zeros(M+1);
for n=0:M
%     D(n+1,1)=2^(n-1)*(f(x+h/2^n)-f(x-h/2^n))/h;
    D(n+1,1)=phi(f,x,h/2^n);
end
for k=1:M
    for n=k:M
        D(n+1,k+1)=D(n+1,k)+(D(n+1,k)-D(n,k))/(4^k-1);
    end
end
end

function p=phi(f,x,h)
p=(f(x+h)-f(x-h))/(2*h);
end