function I=trapezoidIntegral(f,x)
    I=0;
    n=length(x);
    for k=2:n
        I=I+(x(k)-x(k-1))*(f(x(k-1))+f(x(k)));
    end
    I=I/2;
end