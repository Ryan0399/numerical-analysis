function n = standard(x,e)
%返回误差e的最小k值
if x==0.0
    k=10^6;
else
    k=(x-1+exp(x*e))/(exp(x*e)-1);
end
n=floor(k);
end