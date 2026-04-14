%Problem 2
close all; clear all; clc
%--------------------------------------------------------------------------


load('ecg_signal.mat');

m = [0.8, 0.9];
C = 133 * 10^(-9);
R = 10000;
N = length(ecg);
f = linspace(-250, 250, N);
w = 2 * pi * f;

%--------------------------------------------------------------------------

% Twin-T Notch Filter
X = fft(ecg);
H2 = ((1 + m(2)) * ((2j * w * R * C).^2 + 1)) ./ ((2j * w * R * C).^2 + 4 * (1 - m(2)) * 1j * w * R * C + 1);
Z = X .* H2;
z = ifft(Z);

%--------------------------------------------------------------------------

% Energy Calculation
Ex = sum(abs(ecg.^2));
fprintf('Energy of signal x(t) in time domain is: \n')
disp(Ex)

Ez = sum(abs(z.^2));
fprintf('Energy of signal z(t) in time domain is: \n')
disp(Ez)

Exf = sum(abs(X.^2)) / N;
fprintf('Energy of signal x(t) in frequency domain is: \n')
disp(Exf)

Ezf = sum(abs(Z.^2)) / N;
fprintf('Energy of signal z(t) in frequency domain is: \n')
disp(Ezf)

%--------------------------------------------------------------------------

% Energy Plotting
Energyx = cumsum(abs(X).^2);
Energyz = cumsum(abs(Z).^2);

%--------------------------------------------------------------------------

figure;
subplot(2, 1, 1)
plot(f, Energyx / N)
xlabel('f')
ylabel('Energy(X)')

subplot(2, 1, 2)
plot(f, Energyz / N)
xlabel('f')
ylabel('Energy(Z)')

