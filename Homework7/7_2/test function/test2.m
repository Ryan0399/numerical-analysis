function f=test2(x)
    if x==0
        f=-1;
    else
        f=(cos(x)-exp(x))./sin(x);
    end
end