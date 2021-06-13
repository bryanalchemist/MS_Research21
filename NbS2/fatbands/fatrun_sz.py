#!/usr/bin/python3
from fatbands2_sz import *
El='Nb'
orb='dxy'
plt.rcParams["figure.figsize"]=(4,15)
datafile_full='NbS2.bands.dat.gnu'
#datafile=El+'_'+orb+'.dat.all'
datafile=El+'_'+orb+'.dat.all'
fermi = 1.0177
symmetryfile='NbS2.bands.out'
bool_shift_efermi= True
fig, ax = plt.subplots()

#bndplot(datafile,fermi,symmetryfile,ax)
bndplot(datafile_full,datafile,fermi,symmetryfile,ax,shift_fermi=1,\
color='black',linestyle='solid',name_k_points=['$\Gamma$','M','K','$\Gamma$'], legend=El+', '+orb+'-orbital')

ax.set_ylim(-6,9)
#fig.savefig("test.png")
plt.show()
