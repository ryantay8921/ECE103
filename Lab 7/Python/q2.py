import numpy as np
import matplotlib.pyplot as plt
import scipy.io

ecg_load = scipy.io.loadmat('ecg_signal.mat')
ecg = ecg_load['ecg']  # Access the ECG signal array
t = ecg_load['t']


m = [0.8, 0.9]
C = 133 * 10 ** (-9)
R = 10000
N = len(ecg)
f = np.linspace(-250, 250, N)
w = 2 * np.pi * f

# Twin-T Notch Filter
X = np.fft.fft(ecg)
H2 = ((1 + m[1]) * ((2j * w * R * C) ** 2 + 1)) / (((2j * w * R * C) ** 2) + 4 * (1 - m[1]) * 1j * w * R * C + 1)
Z = X * H2
z = np.fft.ifft(Z)

# Energy Calculation
Ex = np.sum(np.abs(ecg ** 2))
print('Energy of signal x(t) in time domain is:')
print(Ex)

Ez = np.sum(np.abs(z ** 2))
print('Energy of signal z(t) in time domain is:')
print(Ez)

Exf = np.sum(np.abs(X ** 2)) / N
print('Energy of signal x(t) in frequency domain is:')
print(Exf)

Ezf = np.sum(np.abs(Z ** 2)) / N
print('Energy of signal z(t) in frequency domain is:')
print(Ezf)

# Energy Plotting
Energyx = np.cumsum(np.abs(X) ** 2)
Energyz = np.cumsum(np.abs(Z) ** 2)

# Plotting
plt.figure()

plt.subplot(2, 1, 1)
plt.plot(f[:N], Energyx[:N] / N)
plt.xlabel('f')
plt.ylabel('Energy(X)')

plt.subplot(2, 1, 2)
plt.plot(f[:N], Energyz[:N] / N)
plt.xlabel('f')
plt.ylabel('Energy(Z)')


# Show the plots
plt.show()