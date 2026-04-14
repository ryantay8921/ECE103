close all
clear all
clc

t=-10:1/10:10;  % time 
signal_defination1(t)

%%
subplot(211)
plot(t,signal_defination1(t));
xlabel('t')

%%

subplot(212)
plot(t,signal_defination1(-2*t+1));
xlabel('t')

