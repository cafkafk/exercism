#!/usr/bin/env bash

if (( $1 % 3 == 0 )) ; then
    res+="Pling";
fi
if (( $1 % 5 == 0 )); then
    res+="Plang"
fi
if (($1 % 7 == 0)); then
    res+="Plong"
fi

echo "${res:-$1}"
