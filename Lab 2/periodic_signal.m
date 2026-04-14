close all
clear all
clc

%% plotting sin(2pit), sin(12pit), sin(40t)

t=0:1/100:5;
y1=sin(2*pi*t);
y2=sin(12*pi*t);
y3=sin(40*t);

figure
subplot(511)
plot(t,y1)
title('sin(2\pit)')

subplot(512)
plot(t,y2)
title('sin(12\pit)')

subplot(513)
plot(t,y3)
title('sin(40t)')

%% plotting sin(k1*t)+sin(k2*t)

subplot(514)
plot(t,y1+y2)
title('sin(2\pit)+sin(12\pit)')

subplot(515)
plot(t,y1+y3)
title('sin(2\pit)+sin(40t)')

%% plotting sin(k1*t)+sin(k2*t)
figure
subplot(211)
plot(t,y1+y2)
title('sin(2\pit)+sin(12\pit)')

subplot(212)
plot(t,y1+y3)
title('sin(2\pit)+sin(40t)')

