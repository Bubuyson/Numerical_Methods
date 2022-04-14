clear;clc;close all
t = 1:360;
r = randi([40 60],1,360);
v = zeros(1,360);
v(1) = 50;
beta = 0.9; %red line computes the average of 1/(1-beta) days ---> beta = (d-1)/d 
days = 1/(1-beta)
for i = 1:length(r)-1
    v(i+1) = (beta*v(i) + (1-beta)*r(i));%*(1-(beta)^t(i))
end
norm = (r - mean(r))./var(r);
figure(1)
hold on;grid on
scatter(t,r,'filled')
plot(t,v,'Linewidth',2)
xlim([0 360])
xlabel('Day')
ylabel("Temperature (F)")
title("Temperature in time")
legend("Temperature at that day", "Exponentially weighted average")

figure(2)
hold on;grid on
%scatter(t,r,'filled')
scatter(t,norm,'filled')
xlim([0 360])
xlabel('Day')
title("Normalized graph")