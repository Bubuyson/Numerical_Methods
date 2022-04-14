function [area] = trap_ibr(fx, l_lim, r_lim, n)
    %%% Trapezoidal integral
    %%%%girişler --> fonksiyon, sol limit, sağ limit, bölme sayısı
    %%%%çıkış -----> alan
    %%%%ex --------> syms x; trap_ibr(sqrt((sin(x))^3+1), 0, 1, 5)
    if(n < 1 || floor(n) ~= n)
        error("Aralık sayısını 1 veya 1 den yüksek bir tam sayı seçiniz.")
    end
    syms x
    h = (r_lim-l_lim)/n;
    subarea = subs(fx, x, l_lim)/2 + subs(fx, x , r_lim)/2;
    xval = l_lim;
    for i = 1:n-1 
        xval = xval + h;
        subarea = subarea + subs(fx, x, xval);
    end
    area = double(h*subarea);
end