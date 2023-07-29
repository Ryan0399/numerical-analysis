clc
clear
I=1-cos(4);
error_of_trapezoid=zeros(1,12);
error_of_simpson=zeros(1,12);
order_of_trapezoid=zeros(1,12);
order_of_simpson=zeros(1,12);
for k=1:12
    N=2^k;
    x=linspace(0,4,N+1);
    h=4/N;
    f=@sin;
%     fprintf('%.7f %.7f\n',trapezoid(f,x),simpson(f,x,h));
    error_of_trapezoid(k)= abs(I-trapezoid(f,x));
    error_of_simpson(k)=abs(I-simpson(f,x,h));
    if k>1
        order_of_trapezoid(k)=log(error_of_trapezoid(k-1)/error_of_trapezoid(k))/log(2);
        order_of_simpson(k)=log(error_of_simpson(k-1)/error_of_simpson(k))/log(2);
    end
end

for k=1:12
   fprintf("%d & %.5e & %.3f & %.5e & %.3f  %s\n ",2^k, error_of_simpson(k),order_of_simpson(k),error_of_trapezoid(k),order_of_trapezoid(k),"\\");
end