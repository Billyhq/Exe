#!/bin/bash
#problem 1.connot find print in shell 2.awk cannot use NR==$line 3.how to copy a part of line
line=$(last -F Billy | grep '.*Dec.*2013' | grep -v 'crash' | grep -v '+' | wc -l)
echo $line
last -F Billy | grep '.*Dec.*2013' | grep -v 'crash' | grep -v '+' | sed 's/(//g' | sed 's/)//g' | awk '{print $15}' | awk 'BEGIN{FS=":"} NR==1{hh=0;mm=0;} {hh=hh+$1;mm=mm+$2} NR==4{print hh "\t" mm}'


