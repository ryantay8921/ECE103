import numpy as np
import matplotlib.pyplot as plt
import scipy.io

fm = 5e4
fc = 5e5
tc = 1 / (10 * fc)
t = np.arange(0, 6 / fm, tc)
m_key = [6, 0, 4, -6, 2]
m = np.zeros_like(t)

for i in range(len(m_key)):
    m[(t >= (i - 1) / fm) & (t < i / fm)] = m_key[i]

s = m * np.cos(2 * np.pi * fc * t)
v = s * np.cos(2 * np.pi * fc * t + np.pi / 3)

N = len(t)
frequency = np.fft.fftshift(np.fft.fftfreq(N, tc))

v_fft = np.zeros_like(v)
w_fft = np.fft.fftshift(np.fft.fft(v))
v_fft[np.abs(frequency) < 5e5] = 2 * w_fft[np.abs(frequency) < 5e5]
vo = np.fft.ifft(np.fft.ifftshift(v_fft))

plt.figure()

plt.subplot(4, 1, 1)
plt.plot(t, s)
plt.xlabel('time (s)')
plt.ylabel('s(t)')
plt.title('Time domain signal')
plt.tick_params(width=1, labelsize=18)

plt.subplot(4, 1, 2)
plt.plot(frequency, np.fft.fftshift(np.abs(np.fft.fft(s))) / N)
plt.xlabel('frequency (Hz)')
plt.ylabel('|S(f)|')
plt.title('Magnitude spectrum')
plt.tick_params(width=1, labelsize=18)

plt.subplot(4, 1, 3)
plt.plot(t, vo)
plt.xlabel('time (s)')
plt.ylabel('v_o(t)')
plt.title('Time domain signal')
plt.tick_params(width=1, labelsize=18)

plt.subplot(4, 1, 4)
plt.plot(frequency, np.fft.fftshift(np.abs(np.fft.fft(vo))) / N)
plt.xlabel('frequency (Hz)')
plt.ylabel('|V_o(f)|')
plt.title('Magnitude spectrum')
plt.tick_params(width=1, labelsize=18)

plt.tight_layout()
plt.show()