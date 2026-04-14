import numpy as np
import matplotlib.pyplot as plt
import scipy.io

# Load ECG signal
ecg_load = scipy.io.loadmat('ecg_signal.mat')
ecg = ecg_load['ecg']  # Access the ECG signal array
t = ecg_load['t']


N = len(ecg)
f = np.linspace(-250, 250, N)
dT = t[0][1] - t[0][0]

X = np.fft.fft(ecg, len(ecg)) * dT
X_omega = np.fft.fftshift(np.abs(X))

# Constants
w = 2 * np.pi * f
R = 10e3  # Resistor value (ohm)
C = 133e-9  # Capacitor value (F)
m = 0.9  # Feedback value

# Transfer function
H = ((1 + m) * ((2j * w * R * C) ** 2 + 1)) / ((2j * w * R * C) ** 2 + 4 * (1 - m) * (1j * w * R * C) + 1)

Z = np.fft.fftshift(X * H)
z = np.fft.ifft(Z)
z_time = np.real(np.fft.ifftshift(z))

# Plotting
plt.figure()

# Plot x(t)
plt.subplot(4, 1, 1)
plt.plot(t, ecg)
plt.title('x(t)')
plt.xlabel('Time (s)')
plt.ylabel('Amplitude')

# Plot X(f)
plt.subplot(4, 1, 2)
plt.plot(f, np.abs(X_omega))
plt.title('X(f)')
plt.xlabel('Frequency (Hz)')
plt.ylabel('Magnitude')

# Plot Z(f)
plt.subplot(4, 1, 3)
plt.plot(f, np.abs(Z))
plt.title('Z(f)')
plt.xlabel('Frequency (Hz)')
plt.ylabel('Magnitude')

# Plot z(t)
plt.subplot(4, 1, 4)
plt.plot(t, np.abs(z_time))
plt.title('z(t)')
plt.xlabel('Time (s)')
plt.ylabel('Amplitude')

# Adjust subplot spacing
plt.tight_layout()

# Show the plots
plt.show()