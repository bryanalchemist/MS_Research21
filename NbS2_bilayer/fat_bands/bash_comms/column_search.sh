#!/bin/sh
#This program searches a column
clm='1'
searchfor='"0.0000"'
c='$'$clm'=='$searchfor
File='Nb_dz2.dat.all'
awk $c $File > temp_cl_search
