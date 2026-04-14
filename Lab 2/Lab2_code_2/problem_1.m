clear all;
close all;
clc;

t1 = -1:0.1:1;
t2 = -1:0.01:1;
t3 = -1:0.001:1;

f = @(t)(3*pi*(sin(8*pi.*t + 1.3)).*cos(4*pi.*t - 0.8).*exp(sin(12*pi)));
% Define the function f as an anonymous function of t


% Plotting
figure;
subplot(3,1,1);  % Divide the figure window into 3 subplots vertically, and activate the top subplot
plot(t1, f(t1));  
title('t step size = 0.1');

subplot(3,1,2);
plot(t2, f(t2));
title('t step size = 0.01');

subplot(3,1,3);
plot(t3, f(t3));
title('t step size = 0.001');


%{
This code generates a plot of a given function f over three different ranges of the independent variable t with varying step sizes. 
The purpose of using different step sizes is to illustrate the effect of step size on the accuracy of the plot.

The inputs to this code are the function f and the ranges of the independent variable t with different step sizes. 
The outputs of this code are the plot of function f over the ranges of t specified, displayed in a single figure window divided into three subplots.
%}