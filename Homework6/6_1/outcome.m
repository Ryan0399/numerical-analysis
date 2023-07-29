clc
clear

h=1;
y=@atan;x=sqrt(2);M=4; % 测试函数
% y=@log;x=3;M=3; % 函数1
% y=@tan;x=asin(0.8);M=4; % 函数2
% y=@f;x=0;M=5; % 函数3
D=richardson(h,M,y,x);
for i=1:M+1
    fprintf('%d  \t',i-1);
    for j=1:M+1
        fprintf('& %.7f \t',D(i,j));
    end
    fprintf('%s',"\\");
    fprintf('\n');
end