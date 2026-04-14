%Problem 2;

% x1(t) = 5 for 0 < t < 10 & 0 elsewhere
% x2(t) = 2*x1(t-10)

% xlinear_combination(t) = x1(t) + 2*x2(t-10)

%using simplified_convolution_runtime.m plota.b.c
%a) y1(t) = x1(t) ** h(t)
%b) y2(t) = x2(t) ** h(t)
%c) ylinear_combination = x_linear_combination(t) ** h(t)

 
% r ranges Tao and t as -10 <= Tao <= 40 and -10 <= t <= 40; also plot
% y3(t) = y1 + y2

%close all;
clc;
format compact;

x1 = @(t) 5*(t >= 0 & t < 10);
x2 = @(t) (t-10 >= 0 & t-10 > 10);
x_linear = @(t) x1(t) + x2(t);


h = @(t) (t>=0 & t<1);

dtau = 0.1;
tau = -10:dtau:40;
dT=0.1;
t = -10:dT:40;

y1 = NaN(1, length (t));
y2= NaN(1, length (t));
yc = NaN(1, length (t));
y3 = NaN(1, length (t));

for ii = 1: length(t)
%%%%%%%%%%%%%%%%%%%%%%%%%%______PLOT1______%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    x1h = h(t(ii)-tau).*x1(tau);
    y1 (ii)=trapz(tau, x1h);

    subplot(411);
    plot(t,y1,'k',t(ii),y1(ii), 'ok')
    xlabel('t')
    ylabel('y1(t)')
    title('y1(t)')
%%%%%%%%%%%%%%%%%%%%%%%%%%______PLOT2______%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    x2h = h(t(ii)-tau).*x2(tau);
    y2 (ii)=trapz(tau, x2h);

    subplot(412);
    plot(t,y2,'r',t(ii),y2(ii), 'ok')
    xlabel('t')
    ylabel('y2(t)')
    title('y2(t)')
%%%%%%%%%%%%%%%%%%%%%%%%%%______PLOT3______%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    xlinear_h = h(t(ii)-tau).*x_linear(tau);
    yc (ii)=trapz(tau, xlinear_h);

    subplot(413);
    plot(t,yc,'g',t(ii),yc(ii), 'ok')
    xlabel('t')
    ylabel('y linear(t)')
    title('y linear comb(t)')
%%%%%%%%%%%%%%%%%%%%%%%%%%______PLOT4______%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    y3a = @(t) y1(ii) + y2(ii);

    x3h = h(t(ii)-tau).*y3a(tau);
    y3 (ii) = trapz(tau, x3h);

    subplot(414);
    plot(t,y3,'g',t(ii),y3(ii), 'ok')
    xlabel('t')
    ylabel('y3(t)')
    title('y3(t)')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end



%{

Y3(t) and y linear comb(t) seem identical, this is because they are both
linear operations. This means that y_linear_conbination is a linear
combination and y3 satisifies scalalbility and addditivity.

This code uses the outline of the given code convolution_runtime.  But
essentially we are creating a bunch of anonomous functions that we then sub
2 variables in for and plot.  Then plot each iteration.

%}