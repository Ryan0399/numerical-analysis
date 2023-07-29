clear
clc

addpath('test function\');

f1=@test1;
f2=@test2;
f3=@test3;
R1=romberg(f1,0,1,6);
R2=romberg(f2,-1,1,6);
R3=romberg(f3,0,1,6);
for i=1:7
    fprintf("%d ",i-1);
    for j=1:i
        fprintf("& %.7f \t",R1(i,j));
    end
    for j=i+1:7
        fprintf(" & ");
    end
    fprintf("%s",'\\');
    fprintf("\n");
end
for i=1:7
    fprintf("%d ",i-1);
    for j=1:i
        fprintf("& %.7f \t",R2(i,j));
    end
    for j=i+1:7
        fprintf(" & ");
    end
    fprintf("%s",'\\');
    fprintf("\n");
end
for i=1:7
    fprintf("%d ",i-1);
    for j=1:i
        fprintf("& %.7f \t",R3(i,j));
    end
    for j=i+1:7
        fprintf(" & ");
    end
    fprintf("%s",'\\');
    fprintf("\n");
end