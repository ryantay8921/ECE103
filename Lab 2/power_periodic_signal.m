close all
clear all
clc


step=1/100;


y=@(t)sin(2*pi*t)+sin(6*pi*t);

t=0:step:5;

figure
plot(t,y(t))
xlabel('t')
ylabel('sin(2\pit)+sin(6\pit)')

%% period from 2.1 to 3.1 from plot
single_period=2.1:step:3.1;

period_of_signal=3.1-2.1;
% % % % % 
energy_period=trapz(single_period,abs(y(single_period)).^2)
power_=energy_period/period_of_signal







