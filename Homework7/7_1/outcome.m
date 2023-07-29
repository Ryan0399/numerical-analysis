clear
clc

f1=@(x) exp(-x.^2);
f2=@(x) 1./(1+x.^2);
f3=@(x) 1./(2+cos(x));
ord=@(o,n) log(o/n)/log(2);
real1=sqrt(pi)*erf(1)/2;
real2=atan(4);
real3=2*pi/sqrt(3);
e1=zeros(7,2);e2=zeros(7,2);e3=zeros(7,2);
for k=1:7
    N=2^k;
    x1=linspace(0,1,N+1);
    x2=linspace(0,4,N+1);
    x3=linspace(0,2*pi,N+1);
    I1=[trapezoidIntegral(f1,x1) gaussIntegral(f1,x1)];
    I2=[trapezoidIntegral(f2,x2) gaussIntegral(f2,x2)];
    I3=[trapezoidIntegral(f3,x3) gaussIntegral(f3,x3)];
    e1(k,:)=abs(I1-real1);e2(k,:)=abs(I2-real2);e3(k,:)=abs(I3-real3);
end
for j=1:2
    for i=1:7
        fprintf("%d ",2^i);
        if i>1
            fprintf("& %.5e & %.4f & %.5e & %.4f & %.5e & %.4f %s\t",e1(i,j),ord(e1(i-1,j),e1(i,j)),...
                e2(i,j),ord(e2(i-1,j),e2(i,j)),e3(i,j),ord(e3(i-1,j),e3(i,j)),"\\");fprintf("\n");
        else
            fprintf("& %.5e & %d & %.5e & %d & %.5e & %d %s\t\n",e1(i,j),0,...
                e2(i,j),0,e3(i,j),0,"\\");
        end
    end
    fprintf('\n');
end