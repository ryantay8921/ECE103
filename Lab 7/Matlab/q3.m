%Problem 3
close all; clear all; clc
%--------------------------------------------------------------------------

fm  = 5e4;
fc = 5e5;
tc = 1/10/fc;
t = 0:tc:6/fm;
m_key = [6, 0, 4, -6, 2];
m = zeros(size(t));

%--------------------------------------------------------------------------

for i = 1:length(m_key)
    m(t >= (i - 1)/fm & t < i/fm) = m_key(i);
end
% 
s = m.*cos(2*pi*fc*t);
v = s.*cos(2*pi*fc*t+pi/3);

%--------------------------------------------------------------------------

N = length(t);
frequency = (-(N-1)/2:N/2)*1/tc/N;

%--------------------------------------------------------------------------

v_fft = zeros(size(v));
w_fft = fftshift(fft(v));
v_fft(abs(frequency) < 5e5) = 2 * w_fft(abs(frequency) < 5e5);   % Passing low pass frequencies
vo = ifft(ifftshift(v_fft));


%--------------------------------------------------------------------------

figure
subplot(4, 1, 1)
plot(t, s)
xlabel('time (s)')
ylabel('s(t)')
title('Time domain signal')
set(gca, "linewidth", 1, "fontsize", 18);

subplot(4, 1, 2)
plot(frequency,fftshift(abs(fft(s)) )/N)
xlabel('frequency (Hz)')
ylabel('|S(f)|')
title('Magnitude spectrum')
set(gca, "linewidth", 1, "fontsize", 18);
S  = axes( 'visible', 'off', 'title', 'Modulated signal');

subplot(413)
plot(t, vo)
xlabel('time (s)')
ylabel('v_o(t)')
title('Time domain signal')
set(gca, "linewidth", 1, "fontsize", 18);

subplot(414)
plot(frequency,fftshift(abs(fft(vo)) )/N)
xlabel('frequency (Hz)')
ylabel('|V_o(f)|')
title('Magnitude spectrum')
set(gca, "linewidth", 1, "fontsize", 18);