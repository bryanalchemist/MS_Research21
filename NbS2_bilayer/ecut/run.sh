#!/bin/bash
# Explore the effect of an increasing Monhorst-Pack grid and cutoff energy
# nguyen@flex.phys.tohoku.ac.jp
#############

name='NbS2_bi.ecut'

#############
n=4; s=0;

for ecut in 10 15 20 25 30 35 40 45 50 60 70 80 100; do

cat > $name.$ecut.in << EOF
 &CONTROL
       calculation = 'scf',
      restart_mode = 'from_scratch',
        pseudo_dir = '..',
            outdir = './tmp/',
            prefix = 'NbS2_bi',
         verbosity = 'high',
 /
 &SYSTEM
             ibrav = 4,
		 a = 3.2812,
		 c = 20,
               nat = 6,
              ntyp = 2,
       occupations = 'smearing',
          smearing = 'methfessel-paxton',
           degauss = 0.02,
           ecutwfc = ${ecut},
           ecutrho = 400,
              nbnd = 60,
 /
 &ELECTRONS
          conv_thr = 1.0d-8,
       mixing_beta = 0.7,
 /
ATOMIC_SPECIES
Nb 92.906 Nb.pz-spn-kjpaw_psl.1.0.0.UPF
S 32.065 S.pz-n-kjpaw_psl.0.1.UPF
ATOMIC_POSITIONS (crystal)
S	0.3333333333	0.6666666666	0.244987
Nb	0.0000000000	0.0000000000	0.1656123
S	0.3333333333	0.6666666660	0.08731115
S	0.6666666666	0.3333333333	0.41853575
Nb	0.0000000000	0.0000000000	0.49683775
S	0.6666666666	0.3333333333	0.5751389
K_POINTS (automatic)
${n} ${n} 1 ${s} ${s} ${s}
EOF

mpirun -np 2 ~/Desktop/qe-6.6/bin/pw.x <$name.$ecut.in>$name.$ecut.out

awk '/!/ {E=$5} $1=="PWSCF" {printf"%4d %s %s\n",'$ecut',E,$3}' $name.$ecut.out >> calc-ecut.dat

rm -rv ./tmp
done
