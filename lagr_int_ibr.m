function Px = lagr_int_ibr(x,y)
%%% Lagrange
%%%%girişler --> x, y
%%%%çıkış -----> polinom interpolasyonu (lagrange)
%%%%ex --------> x = [0 1 2 3 4 5 6];y = [10 8 6 7 3 5 7];lagr_int_ibr(x,y)
%%%%ödev ------> x = [-2 1 3 7];y = [5 7 11 34];lagr_int_ibr(x,y)
x_ = x;
y_ = y;
syms x

L = sym(zeros(length(x_),1));
for i = 1: length(x_)
    num = 1;
    den = 1;
    for j = 1:length(x_)
        if j ~= i
            num = num*(x - x_(j));
            den = den*(x_(i) - x_(j));
        end
    end
    L(i) = num/den;
end
Px = 0;
for i = 1:length(x_)
    Px = Px + y_(i) * L(i);
end
clf;figure(1)
hold on;grid on
fplot(Px,'Linewidth',2 , 'Color', [0 0.5 0.5])
scatter(x_, y_, '*', "Linewidth",2 )
xlim([min(x_)-0.5,max(x_)+0.5])
ylim([min(y_)-0.5,max(y_)+0.5])
title('Lagrange interpolasyon grafiği')
ylabel('y')
xlabel('x')
end