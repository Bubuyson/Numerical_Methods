function [m, roots] = sbtnk_ibr(fx, a, tol)
%%%%% sbtnk_ibr(1+0.3*sin(x),1,10^(-5))
%%%%%%%%%%%%%% girişler -> fonksiyon,a, tolerans,
format long
syms x
xval(1) = a;
fxval(1) = subs(fx,x,xval(1));
i = 0;
while(1)
    i = i+1;
    xval(i+1) = subs(fx,x,xval(i));
    fxval(i+1) = xval(i+1)-xval(i);
    if(abs(xval(i+1)-xval(i))<tol)
       root = xval(i+1);
       break 
    end
end
o = (1:length(xval))';
m = table(o-1,xval', double(fxval'),'VariableNames',{'iterasyon','x değeri', 'fonksiyon değeri'});
fprintf('\nThe root is found as %4.10f after %d iterations', xval(length(xval)), o(length(o)))

end