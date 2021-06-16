#!/bin/sh
#This program searches a column
clm='1'
searchfor='"0.9107"'
c='$'$clm'=='$searchfor
File='Nb_dxy.dat.all'
awk $c $File > 'Nb_dxy.o'
