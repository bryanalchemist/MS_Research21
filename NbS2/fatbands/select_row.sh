#!/bin/sh
#This program extracts a certain row
#I use this to determine where is the symmetry points in kspace

#Enter here the row number. or the number of points plus 1 distance from the origin of kpath:
row=46 
rp=$row'p'
data='NbS2.bands.dat.gnu'
sed -n -e $rp $data
