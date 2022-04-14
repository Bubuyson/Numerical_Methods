function [Table] = cubic_int_ibr(x,y)
%%%%girişler --> x, y
%%%%çıkış -----> kübik şerit interpolasyon
%%%%ex --------> x = [0 1 2 3 4 5 6];y = [10 8 6 7 3 5 7];cubic_int_ibr(x,y)
%%%%ödev ------> x = [1 2 3 4 5];y = [3 1 2 3 2];cubic_int_ibr(x,y)
[x,sortIdx] = sort(x,'ascend');
y = y(sortIdx);
x_ = x;
y_ = y;
L = length(x_);
M = zeros(L);
M(1,1) = 1;
M(L,L) = 1;
eq= zeros(L,1);
eq(1) = 0;
eq(L) = 0;
for j = 2:L-1
    Mjm = (x_(j)-x_(j-1))/6;
    Mj = (x_(j+1)-x_(j-1))/3;
    Mjp = (x_(j+1)-x_(j))/6;
    M(j,j-1:j+1) = [Mjm Mj Mjp];
    eq(j) = (y_(j+1) - y_(j))/(x_(j+1) - x_(j))-(y_(j) - y_(j-1))/(x_(j) - x_(j-1));
end
M_vec = linsolve(M,eq);
syms x
S = sym(zeros(L-1,1));
int = zeros(L-1,2);
for j = 2:L
    first = ((x_(j)-x)^3*M_vec(j-1)+(x-x_(j-1))^3*M_vec(j))/(6*(x_(j)-x_(j-1)));
    mid = ((x_(j)-x)*y_(j-1)+(x-x_(j-1))*y_(j))/(x_(j)-x_(j-1));
    last = -1/6*(x_(j)-x_(j-1))*((x_(j)-x)*M_vec(j-1)+(x-x_(j-1))*M_vec(j));
    S(j-1) = first + mid + last;
    int(j-1,1:2) = [x_(j-1) x_(j)];
end
Table = table(string(S),int,'VariableNames',{'fonksiyon','aralık'});
clf;figure(1);
hold on;grid on
grad = linspace(0,1,length(S));
for i = 1:length(S)
    fplot(S(i),[int(i,1),int(i,2)],'Linewidth',2 , 'Color', [0 grad(i) 1-grad(i)])
end
scatter(x_, y_, '*',"red", "Linewidth",2 )
title('Doğal kübik şerit interpolasyon grafiği')
ylabel('y')
xlabel('x')
xlim([min(x_)-0.5,max(x_)+0.5])
ylim([min(y_)-0.5,max(y_)+0.5])
end

