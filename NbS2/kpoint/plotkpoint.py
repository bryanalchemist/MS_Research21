#!/usr/bin/python
import matplotlib.pyplot as plt
import numpy as np

[x,y]=np.loadtxt('calc-kpoint.dat',unpack='True',usecols=[0,1])
plt.plot(x,y)
plt.show()
