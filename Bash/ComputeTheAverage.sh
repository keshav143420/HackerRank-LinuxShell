#!/bin/bash

read num
sum=0
for (( i=0; i<num; i++ ))
do
    read temp
    sum=`expr $sum + $temp`
done
printf "%.3f\n" `echo "$sum/$num" | bc -l`