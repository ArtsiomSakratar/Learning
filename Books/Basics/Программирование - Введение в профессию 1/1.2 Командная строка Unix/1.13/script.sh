#!/bin/sh

T1=$(date +%s)

$@

T2=$(date +%s)

T3=$((T2-T1))

echo "${T3}"
echo $?
exit $?