function I=simpson(f,x,h)
    A=f(x(1:2:end));B=f(x(2:2:end));
    I=h*(2*sum(A)+4*sum(B)-f(x(end))-f(x(1)))/3;
end