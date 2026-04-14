close all
clear all
clc



f1=@(t) cos(pi*t/5); % anonymous function
f2=@(t) (t>=-5) & (t<=5); % implementaion of rect(t/10) function 

t=-10:1:10;  % undersampling for dot-operation visualization purpose

s1=f1(t);
s2=f2(t);

subplot(311)
plot(t,s1,'-ob')
ylabel('cos(\pit/5)')

subplot(312)
plot(t,s2,'-or')
ylabel('u(t+5)-u(t-5)')

subplot(313)
plot(t,s1.*s2,'-o')
xlabel('t')
title('cos(\pit/5)\timesu(t+5)-u(t-5)')

%% x=t^2

%  x=t^2; % Error using  ^, For elementwise POWER, use POWER (.^) instead

x=t.^2;
figure
plot(t,x,'-o')
xlabel('t')
ylabel('t^2')

