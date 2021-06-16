#!/usr/bin/env python
from Bands import *

plt.rcParams["figure.figsize"]=(4,15)

datafile='NbS2_bi.bands.gnu'
fermi = 3.1391
symmetryfile='NbS2_bi.bands.out'
bool_shift_efermi= True
fig, ax = plt.subplots()

#bndplot(datafile,fermi,symmetryfile,ax)
bndplot(datafile,fermi,symmetryfile,ax,shift_fermi=1,\
color='black',linestyle='solid',name_k_points=['$\Gamma$','M','K','$\Gamma$'],legend='NbS2 bilayer, LDA')

ax.set_ylim(-6,9)
#fig.savefig("test.png")
plt.show()
