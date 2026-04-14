%Problem 1
clc;close all;clear all;

%--------------------------------------------------------------------------
%PART A
%--------------------------------------------------------------------------

%----------------------------Function---------------------------------------
% Constants
omega = -31.4:0.01:31.4;    % Range of ω
t = -100:0.1:100;           % Range of t

% Frequency domain description G(ω)
G = zeros(size(omega));
G(abs(omega) >= 5 & abs(omega) <= 10) = 2;

% Inverse Fourier Transform of G(ω)
g = zeros(size(t));
for i = 1:length(t)
    g(i) = (1 / (2 * pi)) * trapz(omega, G .* exp(1i * omega * t(i)));
end


%-----------------------------Plotting-------------------------------------

% G(ω)
subplot(3,2,1);
plot(omega, G);
xlabel('ω');
ylabel('G(ω)');
title('Frequency Domain: G(ω)');

% Re(g(t))
subplot(3,2,3);
plot(t, real(g));
xlabel('t');
ylabel('Re(g(t))');
title('Time Domain: Re(g(t))');

% Im(g(t))
subplot(3,2,5);
plot(t, imag(g));
xlabel('t');
ylabel('Im(g(t))');
title('Time Domain: Im(g(t))');

%--------------------------------------------------------------------------
%PART B
%--------------------------------------------------------------------------

%----------------------------Function---------------------------------------

% Shifted frequency domain description Y(ω)
Y = zeros(size(omega));
Y(abs(omega) >= 0 & abs(omega) <= 5) = 2;

% Inverse Fourier Transform of Y(ω)
y = zeros(size(t));
for i = 1:length(t)
    y(i) = (1 / (2 * pi)) * trapz(omega, Y .* exp(1i * omega * (t(i) + 5)));
end

%-----------------------------Plotting-------------------------------------
% Y(ω)
subplot(3,2,2);
plot(omega, Y);
xlabel('ω');
ylabel('Y(ω)');
title('Shifted Frequency Domain: Y(ω)');

% Re(y(t))
subplot(3,2,4);
plot(t, real(y));
xlabel('t');
ylabel('Re(y(t))');
title('Shifted Time Domain: Re(y(t))');

% Im(y(t))
subplot(3,2,6);
plot(t, imag(y));
xlabel('t');
ylabel('Im(y(t))');
title('Shifted Time Domain: Im(y(t))');

%--------------------------------------------------------------------------
%PART C
%--------------------------------------------------------------------------
%{
Both g(t) and y(t) are complex signals.

In general, the inverse Fourier transform of a complex-valued frequency domain signal will result in a complex-valued time domain signal. 
Therefore, g(t) and y(t) are complex signals.
%}




