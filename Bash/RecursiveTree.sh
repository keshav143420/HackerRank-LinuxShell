#!/bin/bash

read n;
function drawOneInTree() {
  local x=$1
  local y=$2
  local d=$3
  local h=$4

  if [ $d -lt 1 ]
  then
      return 1
  fi 
  local half=$((h/2));
  for ((pos=1;pos<=half;pos++))
  do
    tree[$((y+pos)),$x]="1";
    tree[$((y+half+pos)),$((x-pos))]="1"
    tree[$((y+half+pos)),$((x+pos))]="1"
  done
  drawOneInTree $((x-half)) $((y+h)) $((d-1)) $half
  drawOneInTree $((x+half)) $((y+h)) $((d-1)) $half
}


# Main Starts
declare -A tree
rows=63
cols=100

for ((i=1;i<=rows;i++)) do
  for ((j=1;j<=cols;j++)) do
    tree[$i,$j]="_"
  done
done

drawOneInTree $((cols/2)) 0 $n 32

for ((i=rows;i>=0;i--)) do
  for ((j=1;j<=cols;j++)) do
    printf '%s' "${tree[$i,$j]}"
  done
  echo
done