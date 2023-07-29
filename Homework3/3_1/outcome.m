% @程序脚本
N=5;
err=zeros(1,8);
i=1;
%% 计算两种样条函数的误差
while N<=40
    t=linspace(0,1,N+1);
    [err(i),err(i+4)]=errorFunc(t);
    N=N*2;i=i+1;
end
%% 计算收敛阶
ord=zeros(1,8);
for i=2:4
    ord(i)=log(err(i-1)/err(i))/log(2);ord(i+4)=log(err(i+3)/err(i+4))/log(2);
end
N=5;
for i=1:4
    fprintf('%d & %e & %f & %e & %f\t',N,err(i),ord(i),err(i+4),ord(i+4));
    fprintf('\\');
    fprintf('\\');
    fprintf('\n');
    N=N*2;
end