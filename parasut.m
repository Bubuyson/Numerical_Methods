clc;clear;close all;clf
v = 40;
g = 9.8;
m = 68.1;
t = 10;
c = -0.001:0.1:19.999;
fc = zeros(1,length(c));
for i = 1:length(c)
fc(i) = g*m/c(i)*(1-exp(-c(i)/m*t))-v;
end
hold on; grid on
plot(c,fc, 'Linewidth',2)
fcs1 = sort(fc, "descend");
fcs2 = fcs1(fcs1>0);
plot(c(length(fcs2)),fcs2(length(fcs2)),"*")
title('Paraşüt')
xlabel('c')
ylabel('f(c)')

