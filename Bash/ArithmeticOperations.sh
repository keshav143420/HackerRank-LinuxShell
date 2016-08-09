#!/bin/bash
read x
printf "%.3f\n" `echo "$x" | bc -l`
#echo "scale=3; ${x}" | bc -l