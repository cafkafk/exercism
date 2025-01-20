#!/usr/bin/env bash

main () {
    no_matches=true;
    if (( $1 % 3 == 0 )) ; then
        no_matches=false;
        echo -n "Pling";
    fi
    if (( $1 % 5 == 0 )); then
        no_matches=false;
        echo -n "Plang"
    fi
    if (($1 % 7 == 0)); then
        no_matches=false;
        echo -n "Plong"
    fi
    if $no_matches; then
        echo "$1"
    else
        echo ""
    fi
}

main "$@";
