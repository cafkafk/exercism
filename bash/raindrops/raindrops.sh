#!/usr/bin/env bash

(( $1 % 3 == 0 )) && res+="Pling";
(( $1 % 5 == 0 )) && res+="Plang"
(( $1 % 7 == 0 )) && res+="Plong"
echo "${res:-$1}"
