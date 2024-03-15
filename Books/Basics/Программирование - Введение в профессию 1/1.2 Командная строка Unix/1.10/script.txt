#!/bin/sh
N=$1
M=$2
I=1
while [ $I -le $M ]; do
	echo "${N} \c"
	N=$((N+1))
	I=$((I+1))
done
echo "\n" 