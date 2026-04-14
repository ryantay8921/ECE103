%Problem 2
clc;close all;clear all;

t = linspace(-5, 5, 1000);
x = 0.6*(heaviside(t+2)-(cos(pi*t)+1).*(heaviside(t+1)-heaviside(t - 1))-heaviside(t-2));
Nk = 51;
p = 1;

[Ck] = fourier_series_exp(x,t,Nk,p);

t_r = linspace(-5,25,3*length(t));
x_x = [x x x];

figure;
plot(t_r, x_x);
grid on;
xlim([-6 26]); % set x limits
ylim([-1.2 1]); % set y limits
xlabel('Time');
ylabel('Amplitude');
title('Signal x for -5 <= t <= 25');











