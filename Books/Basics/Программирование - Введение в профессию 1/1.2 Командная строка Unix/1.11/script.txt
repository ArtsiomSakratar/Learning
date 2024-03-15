#!/bin/sh
N=$(ls -1 | wc -l)
I=1
while [ $I -le $N ]; do
	printf "@"
	I=$(( I+1 ))
done
printf "\n"