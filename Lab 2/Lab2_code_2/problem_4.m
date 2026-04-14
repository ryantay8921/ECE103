clear all;
close all;
clc;

f = @(t)(3*pi*(sin(8*pi.*t + 1.3)).*cos(4*pi.*t - 0.8).*exp(sin(12*pi.*t))); % Define the signal as an anonymous function
t_window = [0.25, 0.75]; % Define the time window of interest
Energy = integral(@(t) f(t).^2, 0.25, 0.75); % Compute the energy of the signal over the time window
fprintf("The Energy of the signal is: %s \n", Energy) % Print the energy of the signal

%syms T;
%Power = limit(Energy/T,T,inf);

Power = Energy/(t_window(2)-t_window(1)); % Compute the power of the signal over the time window
fprintf("The power is: %s\n", Power) % Print the power of the signal

%{
The code above defines a signal as an anonymous function and a time window of interest.
It then computes the energy of the signal over the time window and prints the result.
Next, it computes the power of the signal over the time window and prints the result.

The output of this code is two printed values: the energy of the signal and the power of the signal over the time window.
%}