function [area] = simp_ibr(fx, l_lim, r_lim, n)
    %%% Simpson integral
    %%%%girişler --> fonksiyon, sol limit, sağ limit, bölme sayısı
    %%%%çıkış -----> alan
    %%%%ex --------> syms x; simp_ibr(sqrt((sin(x))^3+1), 0, 1, 6)
    if(n < 1 || floor(n) ~= n || mod(n,2) ~= 0)
        error("Aralık sayısını 2 veya 2 den yüksek bir çift tam sayı seçiniz.")
    end
    syms x
    h = (r_lim-l_lim)/n;
    subarea = subs(fx, x, l_lim) + subs(fx, x , r_lim);
    xval = l_lim;
    for i = 1:n-1 
        xval = xval + h;
        if(mod(i,2) == 1)
            subarea = subarea + 4*subs(fx, x, xval);
        else
            subarea = subarea + 2*subs(fx, x, xval);
        end
    end
    area = double(h/3*subarea);
end