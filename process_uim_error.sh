#!/bin/bash
output_file=uim_error_result.txt
echo "the following lines in uicchwd.c have this type of error:" > $output_file
echo "lines:" >> $output_file
grep line UIM_CHANNEL_ERR.txt >> tmp.txt  #only the lines with "line" are valid
awk 'BEGIN{FS=","} {print $7}' tmp.txt | awk 'BEGIN{FS=" "} {print $2}' | sort | uniq >> $output_file
rm tmp.txt
echo "error:" >> $output_file
echo "ETS, Id=CP Fault, Unit=UIM, N=2, SysTime.0=(!1x) 0x0000000c04, SysTime.1=(!DO) 0x0000000000, Code 1=UIM_CHANNEL_ERR, Code 2=0x00000074, Fault Type=Continue" >> $output_file
