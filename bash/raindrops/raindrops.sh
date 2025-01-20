#!/usr/bin/env bash

main () {
    if [[ $(($1 % 3)) -eq 0 ]]; then
        echo -n "Pling";
    fi
    if [[ $(($1 % 5)) -eq 0 ]]; then
        echo -n "Plang"
    fi
    if [[ $(($1 % 7)) -eq 0 ]]; then
        echo -n "Plong"
    fi
    if [[ $(($1 % 3)) -eq 0 || $(($1 % 5)) -eq 0 || $(($1 % 7)) -eq 0 ]]; then
        echo ""
    else
        echo "$1"
    fi
}

main "$@";
