#!/bin/bash
# Explore the effect of an increasing Monhorst-Pack grid and cutoff energy
# nguyen@flex.phys.tohoku.ac.jp
#############

name='NbS2.kpoint'

#############
ecut=40; s=0;

for n in 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19; do

cat > $name.$n.in << EOF
 &CONTROL
       calculation = 'scf',
      restart_mode = 'from_scratch',
        pseudo_dir = '..',
            outdir = './tmp/',
            prefix = 'NbS2',
         verbosity = 'high',
 /
 &SYSTEM
             ibrav = 4,
		 a = 3.418,
		 c = 40,
               nat = 3,
              ntyp = 2,
       occupations = 'smearing',
          smearing = 'methfessel-paxton',
           degauss = 0.02,
           ecutwfc = ${ecut},
           ecutrho = 400,
              nbnd = 25,
 /
 &ELECTRONS
          conv_thr = 1.0d-8,
       mixing_beta = 0.7,
 /
ATOMIC_SPECIES
Nb 92.906 Nb.pz-spn-kjpaw_psl.1.0.0.UPF
S 32.065 S.pz-n-kjpaw_psl.0.1.UPF
ATOMIC_POSITIONS (crystal)
S        0.333333333   0.666666666   0.3682
Nb       0.000000000   0.000000000   0.250000000
S        0.333333333   0.666666666   0.1318
K_POINTS (automatic)
${n} ${n} 1 ${s} ${s} ${s}
EOF

mpirun -np 2 ~/Desktop/qe-6.6/bin/pw.x <$name.$n.in>$name.$n.out

awk '/!/ {E=$5} $1=="PWSCF" {printf"%4d %s %s\n",'$n',E,$3}' $name.$n.out >> calc-kpoint.dat

rm -rv ./tmp
done
