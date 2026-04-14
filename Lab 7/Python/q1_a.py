import numpy as np
import matplotlib.pyplot as plt
import scipy.io


ecg = scipy.io.loadmat('ecg_signal.mat')

R = 10e3  # (ohm)
C = 133e-9  # (F)
m = [0.8, 0.9]  # Feedback

f = np.arange(0, 200.1, 0.1)
w = 2 * np.pi * f

HBS = np.zeros((len(m), len(f)))

for i in range(len(m)):
    HBS[i, :] = ((1 + m[i]) * ((2 * 1j * w * R * C) ** 2 + 1)) / (
        (2 * 1j * w * R * C) ** 2 + 4 * (1 - m[i]) * (1j * w * R * C) + 1 );

for i in range(len(m)):
    plt.subplot(len(m), 2, (2*i)+1 )
    plt.plot(f, np.absolute(HBS[i, :]))
    plt.title("m = " + str(m[i]))
    plt.ylabel("Magnitude")
    plt.xlabel("Frequency (Hz)")

    plt.subplot(len(m), 2, 2 * (i+1))
    plt.plot(f, np.angle(HBS[i, :]))
    plt.title("m = " + str(m[i]))
    plt.ylabel("Phase")
    plt.xlabel("Frequency (Hz)")

plt.tight_layout()
plt.show()