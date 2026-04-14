clear all;
close all;
clc;
format compact;

t = -0.1:0.001:0.1;
T = -0.1:0.0005:0.1;

w = sin(400*pi*t);
x = (cos(100*pi*t)+sin(400*pi*t)-cos(800*pi*t).*(t>=0));
h = 400*exp(-200*t).*cos(400*pi*t).*(t>=0);

dt = t(2) - t(1);

con = dt*conv(x,h);

subplot(311);
plot(t, w)
xlabel('t')
ylabel('w(t)')
grid on
title('Single-tone signal W(t) - Intial transmitted signal')

subplot(312);
plot(t,x)
xlabel('t')
ylabel('x(t)')
grid on
title('New-Input Signal - Signal after being recieved before put through h(t) filter')

subplot(313);
plot(T,con)
xlabel('t')
ylabel('conv(x and h)')
title('Output Signal: conv(x and h)')


%{

The effect of this filter appears to create only a reduced higher-frequency
signal.


Overall this code creates time arrays and an input signal.  Then sets 3
equations.  We use the conv function to obtain a filtered output signal
y(t) with time resolution dt.  Then we plot all of the signals on the same
plot page.

%}