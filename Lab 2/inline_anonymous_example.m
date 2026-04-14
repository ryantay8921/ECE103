close all
clear all
clc


f1=inline('cos(pi*t/5).*(t>0)','t');  % inline function

f2=@(t) cos(pi*t/5); % anonymous function

% defining the independent variable after the function defination
time=linspace(-20,20,200);

subplot(211)
plot(time,f1(time));
grid on
xlabel('time')
ylabel('f1');
title('using inline function')

subplot(212)
plot(time,f2(time));
grid on;
xlabel('time');
ylabel('f2');
title('using anonymous function')

 



