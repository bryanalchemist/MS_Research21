#!/bin/sh
#This program will search for lines in **.val.list that match suborbitals
El='Nb'
l=2 #l param
m=5 #m param based on QE output
#for l=1:
#   1   pz
#   2   px
#   3   py
#for l=2
#   1   dz2
#   2   dzx
#   3   dzy
#   4   dx2-y2
#   5   dxy
awk '$6=='$l' && $7=='$m'' $El.val.list
