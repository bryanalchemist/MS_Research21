To create fat bands, do the ff:
  1. scf calculations
  2. nscf calculations (set calc= 'bands')
  3. bands.x <*bands.in>*bands.out
  4. projwfc.x<*proj.in>*proj.out
  5. Make a soft link by:
      ln -s *up *.bands.dat.proj
  6. Use list.sh to list all valence electrons flags on an outputfile specified by list.sh
  7. Use select.sh to select specific orbitals the step 6's output. Use the 1st column output information of select.sh 
      as  2nd row input in plotband.x. (this step identifies which among the data is from a certain orbital)
  8. plotband.x<*plot.in        #vary this depending on what orbital you want to compute
  9. sumplot.sh  #edit the code according to step 6
  10. Plot (you can run fatrun_sz.py but first modify fatrun_sz.py accordingly)

To know the orbital contributions at certain energy levels at k-space symmetry points:
  1. Do the above steps (atleast up to step 9).
  2. Identify the k-values of the symmetry points using your *.nscf.in input file
     Example: (pay attention at the  4th column of *nscf.in K_POINTS flag
      
      K_POINTS (crystal_b)
      4
      0.00000 0.00000 0.50000 30 !G
      0.00000 0.50000 0.50000 15 !M
      0.33333 0.33333 0.50000 35 !K 
      0.00000 0.00000 0.50000 30 !G
      
      This means that G is at the 1st row in output data file ("*.bands.dat.gnu")
      This means that M is at the 31st row in output data file
      This means that K is at the 46th row in output data file
      And 81st row goes back to G
      
      To know the k-values at those points, you can use "select_row.sh". The first entry in the output is the K-point value
      of a certain symmetry point specified in the "select_row.sh" bash command.
   
   3. Now run "column_search.sh" to find the band energy levels at a certain symmetry point as specified in the "column_search" command.  
      
      column_search.sh code:
      
        #!/bin/sh
        #This program searches a column
        clm='1'
        searchfor='"0.0000"' #specify here the k-value of the symmetry point. In this case G, which is at 0.0000
        c='$'$clm'=='$searchfor
        File='Nb_dz2.dat.all'
        awk $c $File > G.dat #output file 
