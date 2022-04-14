function [m,root] = bisec_ibr(fx, a, b, tol)
%%% ex -> syms x;bisec_ibr(exp(x)*(3.2*sin(x)-0.5*cos(x)),0,1,10^(-8))
%%%%%%%%%%%%%% girişler -> fonksiyon, kökün olduğu a,b aralığı, tolerans
format long
syms x
i = 0;
while(1)
    i = i+1;
    c = (a+b)/2;
    fxvalc = subs(fx,x,c);
    fxvalb = subs(fx,x,b);
    carr(i,1) = c;
    aarr(i,1) = a;
    barr(i,1) = b;
    fxarr(i,1) = double(fxvalc);
    if(fxvalc == 0)
        root = c;
        break
    elseif(fxvalc*fxvalb<0)
        a = c;
    elseif(fxvalc*fxvalb>0)   
        b = c;
    end
    
    if(abs(fxvalc-fxvalb)<tol)
        root = c;
        break
    end
    
end
o = (1:length(aarr))';
m = table(o,aarr, barr, carr, abs(barr-carr),fxarr,sign(fxarr),'VariableNames',{'iterasyon','a değerleri','b değerleri','c değerleri', 'hata','fonksiyon değerleri','fonksiyon işareti'});
fprintf('\nThe root is found as %4.10f after %d iterations', carr(length(carr)), o(length(o)))
end




