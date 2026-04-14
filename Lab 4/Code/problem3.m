close all;
clear all;
clc;
%% Define the complex signal z(t) for a single period (0 < t ≤ 5)
dT = 0.01;
t_single_period = 0:dT:5;
z_single_period = (t_single_period.^3) - 1i * (2 * pi *t_single_period.^2);
T = 5;
w0 = 2 * pi / T;
Nk = 51;
k = -floor(Nk / 2):floor(Nk / 2);
w0k = w0*k;
p = 1;

%% Compute the Fourier Series coefficients (Ck) for the complex signal using the 'fourier_series_exp' function
[Ck] = fourier_series_exp(z_single_period, t_single_period,Nk,p);

figure(2)
subplot(211)
stem(w0k, abs(Ck));
xlabel('ω');
ylabel('|C_k|');
title('Magnitude Spectrum');

subplot(212)
stem(w0k, angle(Ck) * 180 / pi);
xlabel('ω');
ylabel('Phase (degrees)');
title('Phase Spectrum');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% Reconstruct the time-domain signal z_hat(t) using the Fourier Series coefficients
number_of_periods = 2;
t_reconstructed = linspace(0, 10, 2 * length(t_single_period) - 1);
z_hat = zeros(1, length(t_reconstructed));
for ii = 1:length(Ck)
    z_hat = z_hat + Ck(ii) * exp(1i * (ii-floor(length(Ck)/2)-1) * 2*pi/T * t_reconstructed);
end

%% Plot the real and imaginary parts of z(t) and z_hat(t) for the interval 0 <= t <= 10
figure(1);
subplot(2, 1, 1);
plot(t_reconstructed, real(z_hat), 'r', 'LineWidth', 1);
hold on;
plot([t_single_period, t_single_period + 5], real([z_single_period,z_single_period]), 'b', 'LineWidth', 1);
xlabel('Time');
ylabel('Amplitude');
title('Real part of z(t) and z_hat(t)');
legend('z_hat(t)', 'z(t)');
subplot(2, 1, 2);
plot(t_reconstructed, imag(z_hat), 'r', 'LineWidth', 1);
hold on;
plot([t_single_period, t_single_period + 5], imag([z_single_period,z_single_period]), 'b', 'LineWidth', 1);
xlabel('Time');
ylabel('Amplitude');
title('Imaginary part of z(t) and z_hat(t)');
legend('z_hat(t)', 'z(t)')