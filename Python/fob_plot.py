from pathlib import Path
home = str(Path.home())
import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np
plt.ion()
import os

mpl.rc('text', usetex = True)
fig = plt.figure()
ax = fig.add_subplot(1, 1, 1)
fs=14
directory = home + '/Desktop/losses_DGD/'

training = np.empty((5,111))
validation = np.empty((5,111))
maxval_t=0.
maxval_v=0.
for i in range(5):
    training[i] =  np.load(directory+'training_loss_it{}.npy'.format(str(i+1)))
    validation[i] = np.load(directory+'valid_loss_it{}.npy'.format(str(i+1)))
    if maxval_v < validation[i].max():
        maxval_v = validation[i].max()
    if i==0:
        training[i][0]=training[i][1]+training[i][1]*0.1 
        plt.plot(range(111*i,111*i+111),(training[i])/maxval_v,'r',label=r'\textnormal{Training}')    
        plt.plot(range(111*i,111*i+111),(validation[i]/maxval_v),'b',label=r'\textnormal{Validation}')
    else:
        plt.plot(range(111*i,111*i+111),(training[i])/maxval_v,'r')    
        plt.plot(range(111*i,111*i+111),(validation[i]/maxval_v),'b')
    plt.ticklabel_format(axis="y", style="sci", scilimits=(0,0))
    plt.xticks(fontsize=fs)
    plt.yticks(fontsize=fs)

plt.ylabel(r'\textnormal{Normalized loss (MSE)}',fontsize=fs)
plt.xlabel(r'\textnormal{Total number of epochs}',fontsize=fs)
plt.legend(fontsize=fs)
plt.tight_layout()
plt.savefig('loss_function_normalized.pdf')