e=1.0*10^(-6);
for x=0.0:0.1:1.0
    [phi,k]=series(x,e);
    fprintf('%.1f & %f & %d\t',x,phi,k);
    fprintf('\\');
    fprintf('\\');
    fprintf('\n');
end
for x=10.0:10.0:300.0
    [phi,k]=series(x,e);
    fprintf('%.1f & %f & %d\t',x,phi,k);
    fprintf('\\');
    fprintf('\\');
    fprintf('\n');
end