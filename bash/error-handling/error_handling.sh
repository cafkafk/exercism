#!/usr/bin/env bash

main () {
    if [[ "$#" == "1" ]]; then
        echo "Hello, $1";
    else
        echo "Usage: error_handling.sh <person>";
        exit 1
    fi
}

main "$@"
