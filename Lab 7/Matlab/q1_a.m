%Problem 1, Part a
close all; clear all; clc
%--------------------------------------------------------------------------

R = 10e3; % (ohm)
C = 133e-9; % (F)
m = [0.8, 0.9]; % Feedback

f = 0:0.1:200;
w = 2*pi*f;

%--------------------------------------------------------------------------


HBS = zeros(length(m), length(f));

%--------------------------------------------------------------------------

for i = 1:length(m)
    HBS(i, :) = ((1 + m(i)) * ((2*1i*w*R*C).^2 + 1)) ./ ((2*1i*w*R*C).^2 + 4*(1 - m(i))*(1i*w*R*C) + 1);
end

%--------------------------------------------------------------------------


for i = 1:length(m)
    subplot(length(m), 2, (2*i-1))
    plot(f, abs(HBS(i, :)))
    title(['m = ', num2str(m(i))])
    ylabel('Magnitude')
    xlabel('Frequency (Hz)')

    subplot(length(m), 2, 2*i)
    plot(f, angle(HBS(i, :)))
    title(['m = ', num2str(m(i))])
    ylabel('Phase')
    xlabel('Frequency (Hz)')
end
