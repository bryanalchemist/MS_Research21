#!/bin/sh
#This program searches a column
clm='1'
searchfor='"0.9107"'
c='$'$clm'=='$searchfor
File='S_py.dat.all'
awk $c $File > 'S_py.o'
