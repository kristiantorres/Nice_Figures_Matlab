import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np

cos = np.cos
pi = np.pi

# This is not necessary if `text.usetex : True` is already set in `matplotlibrc`.    
mpl.rc('text', usetex = True)
fig = plt.figure()
ax = fig.add_subplot(1, 1, 1)
t = np.linspace(0.0, 2*pi, 100)
s = cos(t)
plt.plot(t, s)

plt.xticks([0, pi/2, pi, 3*pi/2, 2*pi],
           ['$0$', r'$\frac{\pi}{2}$', r'$\pi$', r'$\frac{3\pi}{2}$', r'$2\pi$'],fontsize=20)
plt.show()