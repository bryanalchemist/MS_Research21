#!/usr/bin/env python
from Bands import *

plt.rcParams["figure.figsize"]=(4,15)

datafile='NbS2.bands.gnu'
fermi = 1.0177
symmetryfile='NbS2.bands.out'
bool_shift_efermi= True
fig, ax = plt.subplots()

#bndplot(datafile,fermi,symmetryfile,ax)
bndplot(datafile,fermi,symmetryfile,ax,shift_fermi=1,\
color='black',linestyle='solid',name_k_points=['$\Gamma$','M','K','$\Gamma$'],legend='NbS2, LDA')

ax.set_ylim(-6,9)
#fig.savefig("test.png")
plt.show()
