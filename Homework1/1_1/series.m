function [ret,k] = series(x,e)
%返回级数计算的结果以及满足条件的最小k值
k=standard(x,e);
ret=0.;
for i=1:k
    ret=ret+1.0/(i*(i+x));
end
end