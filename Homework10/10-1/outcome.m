clear
clc

fa=@(t) 7*sin(t)+3*cos(t);
fb=@(t) exp(t)+cos(t);

ua=@(t) t.*0;va=@(t) -1+t.*0;wa=@(t) t.*0;
ub=@(t) 2*exp(t);vb=@(t) -1+t.*0;wb=@(t) t.*0;

errora=[];errorb=[];
for i=1:5
    n=2^(i-1)*10;
    [xa,ta]=finite_difference(ua,va,wa,n,3,7,0,pi/2);
%     plot(ta,xa);hold on;
    errora(end+1)=max(abs(xa-fa(ta)));

    [xb,tb]=finite_difference(ub,vb,wb,n,2,exp(1)+cos(1),0,1);
%     plot(tb,xb);
    errorb(end+1)=max(abs(xb-fb(tb)));
end

for i=1:5
    fprintf("%d & ",2^(i-1)*10);
    fprintf("%.5e & ",errora(i));
    if i==1
        fprintf("%s %s\n",'-','\\');
    else
        fprintf("%.5f  %s \n",log(errora(i-1)/errora(i))/log(2),'\\');
    end
end
fprintf("\n");
for i=1:5
    fprintf("%d & ",2^(i-1)*10);
    fprintf("%.5e & ",errorb(i));
    if i==1
        fprintf("%s %s\n",'-','\\');
    else
        fprintf("%.5f %s\n",log(errorb(i-1)/errorb(i))/log(2),'\\');
    end
end