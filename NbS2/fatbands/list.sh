#!/bin/sh
#This commands will list the valence electrons of element E to the file E.val.list
Element="S" #specify the element here
proj=*_up
#specify at egrep as argument the valence electrons of your specified element (enclosed by quotations and separated by vertical bars).
egrep "3S|3P" $proj >> $Element.val.list 


