clc
clear

f=@(x) 1/(25*x^2+1);
g=@(i,N) -cos((i+1)/(N+2)*pi);
real=2*atan(5)/5;
error_of_union=zeros(1,8);I_of_union=zeros(1,8);
error_of_chebyshev=zeros(1,8);I_of_chebyshev=zeros(1,8);
for i=1:8
    x=linspace(-1,1,5*i+1);
    y=0:5*i;y=g(y,5*i);
    I_of_union(i)=multinomial(f,x,-1,1);
    I_of_chebyshev(i)=multinomial(f,y,-1,1);
    error_of_union(i)=abs(real- I_of_union(i));
    error_of_chebyshev(i)=abs(real-I_of_chebyshev(i));
end
for i=1:8
    fprintf('%d & %4.2f & %.4f & %.4e %s\t',5*i,I_of_union(i),real,error_of_union(i),'\\');fprintf('\n');
end
for i=1:8
    fprintf('%d & %.7f & %.7f & %.4e %s\t',5*i,I_of_chebyshev(i),real,error_of_chebyshev(i),'\\');fprintf('\n');
end