To create fat bands do the ff:
  1. scf calculations
  2. nscf calculations (set calc= 'bands')
  3. bands.x <*bands.in>*bands.out
  4. projwfc.x<*proj.in>*proj.out
  5. Make a soft link by:
      ln -s *up *.bands.dat.proj
  6. plotband.x<*plot.in        #vary this depending on what orbital you want to compute
  7. sumplot.sh  #edit the code according to step 6
  8. Plot (you can run fatrun_sz.py but first modify fatrun_sz.py accordingly)
