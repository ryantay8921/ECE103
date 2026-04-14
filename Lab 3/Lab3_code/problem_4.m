clear all;
close all;
clc;
format compact;

M = 100; %kg
k = 1; %kg/s^2

syms t h1(t) h2(t);

b = 20; %kg/s



r(t) = dirac(t);
h1_1(t) = diff(h1,t);
ode1 = M*diff(h1_1,t) + b*diff(h1,t) + k*h1(t) == r(t);

con1a = h1(0) == 0;
con2a = h1_1(0) == 1;

h1(t) = dsolve(ode1, con1a, con2a);

subplot(2,1,1);
fplot(h1(t),[-10 300],'b');
grid on
xlabel("t");
ylabel("h_1(t)");
title("Impulse Response (b = 20)");

%--------------------------------------------------------------------------
b = 0.2; %kg/s


h2_1(t) = diff(h2,t);
ode2 = M*diff(h2_1,t) + b*diff(h2,t) + k*h2(t) == r(t);

con1b = h2(0) == 0;
con2b = h2_1(0) == 1;

h2(t) = dsolve(ode2, con1b, con2b);

subplot(2,1,2);
fplot(h2(t),[-10 300],'r');
grid on
xlabel("t");
ylabel("h_2(t)");
title("Impulse Response (b = 0.2)");



%{

Using given variables mass, spring constant, and 2 different friction
coefficients. We use dsolve again to solve a differential equation with
given intial equations.  Then plot it as over -10 to 300 sec.

%}
