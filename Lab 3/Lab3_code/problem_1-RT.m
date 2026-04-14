%Problem 1:

%R = 2 ohm
%C = 1 Farad
%L = 0.5 Henrys

% plot h(t) from -10 < t < 30

% of the second order diff eq: for a RLC circuit using dsolve()

% RC(d2y(t)/dt2) + (dy(t)/dt) + R/L * y(t) = (dx(t)/dt)

clear all;
close all;
clc;
format compact;

R = 2; %ohm
C = 1; %Farad
L = 0.5; %Henrys

syms t h(t) h_2(t);

con1 = h(0) == 0;
con2 = h_2(0) == 5;

x(t) = dirac(t);
h_2(t) = diff(h,t);
ode1 = R*C*diff(h_2,t) + diff(h,t) + (R/L)*h(t) == x(t);
h(t) = dsolve(ode1,con1,con2);

fplot(h(t),[-10 30],'b');
grid on
xlabel("t")
ylabel("h(t)")
title("Impulse Response");



