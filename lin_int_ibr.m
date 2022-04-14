function [Table] = lin_int_ibr(x_,y_)
%%%%girişler --> x, y
%%%%çıkış -----> lineer interpolasyon
%%%%ex --------> x = [0 1 2 3 4 5 6];y = [10 8 6 7 3 5 7];lin_int_ibr(x,y)
%%%%ödev ------> x = [1 3 5 7];y = [0.3 0.8 1 0.8];lin_int_ibr(x,y)
syms x
k = sym(zeros(length(x_)-1,1));
int = zeros(length(x_)-1,2);
for i = 2: length(x_)
    m = (y_(i) - y_(i - 1))/(x_(i) - x_(i - 1));
    k(i-1) = (x-x_(i)) * m + y_(i);
    int(i-1,1:2) = [x_(i-1) x_(i)];
end
Table = table(string(k),int,'VariableNames',{'fonksiyon','aralık'});
clf;figure(1)
hold on;grid on
plot(x_,y_,'Linewidth',2 , 'Color', [0 0.5 0.5])
scatter(x_, y_, '*', "Linewidth",2 )
title('Lineer interpolasyon grafiği')
ylabel('y')
xlabel('x')
xlim([min(x_)-0.5,max(x_)+0.5])
ylim([min(y_)-0.5,max(y_)+0.5])
end