function [NDT, Px] = newt_int_ibr(x,y)
%%% Newton bölünmüş farklar
%%%%girişler --> x, y
%%%%çıkış -----> polinom interpolasyonu (newton)
%%%%ex --------> x = [0 1 2 3 4 5 6];y = [10 8 6 7 3 5 7];newt_int_ibr(x,y)
%%%%ödev ------> x = [-2 1 3 7];y = [5 7 11 34];newt_int_ibr(x,y)
x_ = x;y_ = y;
L = length(x_);

NDT = zeros(L, L);
NDT(:, 1) = y_';
for j = 2 : L
    for i = 1 : (L - j + 1)
        NDT(i,j) = (NDT(i + 1, j - 1) - NDT(i, j - 1)) / (x_(i + j - 1) - x_(i));
    end
end
sum = y_(1);
syms x
for i = 2:L
    mult = 1;
    for j =1:i-1
        mult = mult*(x-x_(j));
    end
    sum = sum + mult * NDT(1,i);
end
Px = vpa(collect(sum),4);
clf;figure(1);
hold on;grid on
fplot(sum,'Linewidth',2 , 'Color', [0 0.5 0.5])
scatter(x_, y_, '*',"red", "Linewidth",2 )
title('Newton bölünmüş farklar interpolasyon grafiği')
ylabel('y')
xlabel('x')
xlim([min(x_)-0.5,max(x_)+0.5])
ylim([min(y_)-0.5,max(y_)+0.5])
end
