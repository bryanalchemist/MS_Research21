The following are some usual computation flow in QE:

1. SCF calculation
2. Find Energy convergence as ecut is varied
3. Kpoints sampling
4. vc-relax
-----------------------------------------------------------
from here we can now use the above results to do other 
calculations such as DOS, PDOS, bandstructure,fatbands
and etc.
-----------------------------------------------------------
BAND Structure:
    1. SCF
    2. nscf (set calculation = 'bands' & set Kpath)
    3. bands
        INPUT FILE:
        &bands
            outdir='',
            prefix='',
            filband='',
            /
    4. plotband
        INPUT FILE:
        **.bands.dat
        Emin Emax
        **.bands.xmgr
        **.bands.ps
        Fermi
        1.0 Fermi
-----------------------------------------------------------
PDOS calculation:
    1. SCF
    2. nscf (set calculation='nscf' & set kpoints to high density)
    3. projwfc
        INPUT FILE:
        &projwfc
            prefix='',
            outdir='',
            filpdos='',
        /
    4. Use sumpdos.x to sum-up orbitals
        Example: sumpdos.x *\(Al\)* > atom_Al_tot.dat
                 sumpdos.x *\(Al\)*\(s\) > atom_Al_s.dat
    5. Plot
-----------------------------------------------------------------------------------
DOS calculation:
    1. SCF
    2. nscf (high density kpoints & set calculation='nscf')
    3. dos.x
        INPUT FILE:
        &DOS
            prefix='',
            outdir='',
            fildos='',
            emin='',
            emax='',
        /
    4. plot $fildos
------------------------------------------------------------------------------------
Fat bands Calculation:
    1. SCF
    2. nscf (set calculation='bands' & set kpath)
    3. bands
        INPUT FILE:
        &bands
            prefix='',
            outdir='',
            lsym=.true.,
            filband='',
        /
    4. projwfc
        INPUT FILE:
        &projwfc
            prefix='',
            outdir='',
            lsym=.false.,
            filproj='',
        /
    5. Make soft link to *_up file (or rename the *_up file as **bands.dat.proj)
    6. grep (Search in *_up the patterns of orbitals you want to plot)
        (you may use my bash command list.sh)
            If you want to plot sub-orbitals (use "list.sh" then "select.sh")
    7. Input your obtained block number in the second line of the input file of
        plotband.x as shown below:
            INPUT FILE:
            **.bands.dat
            1 5 
            -50 50
            **.bands_*.dat.gnu
            **.bands_*.ps
            Fermi
            1.0 Fermi     
    8. Use the following similar command to sum-up orbital data (or use sumplot.sh):
            for filgnu in **.bands_*.dat.gnu.[0-9].[0-9];
                do
                    cat $filgnu >> **.bands_*.dat.all
                    echo "\n" >>**.bands_*.dat.all
            done
    9. Plot
