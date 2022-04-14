function  [m, root] = sek_ibr(fx, a, b, tol, adim_sayisi)
%%%% ex -> syms x;sek_ibr(4*log(x)-x, 1, 2, 10^(-3),6)
%%%%%%%%%%%%%% girişler -> fonksiyon,a,b aralığı, tolerans, adım_sayısı
format long
syms x
xarr(1) = a;
xarr(2) = b;
fxarr(1)= subs(fx,x,a);
fxarr(2)= subs(fx,x,b);
i = 2;
while(1)
    xarr(i+1) = xarr(i)-fxarr(i)*((xarr(i)-xarr(i-1))/(fxarr(i)-fxarr(i-1)));
    fxarr(i+1) = subs(fx,x,xarr(i+1));
    if(i == adim_sayisi)
        break
    end
    % % % % tolerans kullanılacaksa 
    %     if(abs(xval(i+1)-xval(i))<tol)
    %        root = xval(i+1);
    %        break 
    %     end
    i = i+1;
end

o = (1:length(xarr))';
m = table(o-1,xarr', double(fxarr'),'VariableNames',{'iterasyon','x değeri', 'fonksiyon değeri'});
fprintf('\nThe root is found as %4.10f after %d iterations', xarr(length(xarr)), o(length(o)))
end